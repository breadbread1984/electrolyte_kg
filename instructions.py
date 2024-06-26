#!/usr/bin/python3

from functools import partial
import numpy as np
from neo4j import GraphDatabase
from pymatgen.core import Composition
from description import *

class Instructions(object):
  ops_types = {
    'Material Add': MaterialAdd,
    'Container Preparation': ContainerPreparation,
    'Device': Device,
    'Glove Box Operation': GloveBoxOperation,
    'Collect': Collect,
    'Seal': Seal,
    'Purify': Purify,
    'Dry': Dry,
  }
  def __init__(self, host = 'neo4j://localhost:7687', username = 'neo4j', password = None, db = 'neo4j'):
    self.driver = GraphDatabase.driver(host, auth = (username, password))
    self.database = db
  def __del__(self):
    self.driver.close()
  def steps(self, target: str, precursors: list):
    records, summary, keys = self.driver.execute_query('match (e: Experiment)-[r:USE_PRECURSOR]->(m:Material) with e, count(m) as precursor_num where precursor_num = $precursor_num return e.id as exp_id', precursor_num = len(precursors), database_ = self.database)
    matched = [record['exp_id'] for record in records]
    if len(matched) == 0:
      return None
    idx = np.random.randint(low = 0, high = len(matched), size = ())
    records, summary, keys = self.driver.execute_query('match (e: Experiment) where e.id = $exp_id return e.first_step as first_step, e.last_step as last_step', exp_id = matched[idx], database_ = self.database)
    assert len(records) == 1
    first_step, last_step = records[0]['first_step'], records[0]['last_step']
    records, summary, keys = self.driver.execute_query('match path = (a {id: $first_step})-[r:NEXT*..]->(b {id: $last_step}) return nodes(path) as steps', first_step = first_step, last_step = last_step, database_ = self.database)
    assert len(records[0]) == 1
    instructions = list()
    reactant_idx = 0
    query = partial(self.driver.execute_query, database_ = self.database)
    for step in records[0]['steps']:
      ops_type = list(step.labels)[0]
      if ops_type == 'Material Add':
        records, summary, keys = query('match (a {id: $sid})-[:USES]->(m: Material), (e: Experiment)-[:USE_PRECURSOR]->(m), (e)-[:INCLUDE_STEP]->(a) return count(e) as exp_num', sid = step['id'])
        assert len(records) == 1
        if records[0]['exp_num'] == 1:
          # if the added material is one of reactant
          precursor = precursors[reactant_idx]
          reactant_idx += 1
          instructions.append(self.ops_types[ops_type](step, query, precursor).to_string())
        else:
          # if the added material is just a solvent
          instructions.append(self.ops_types[ops_type](step, query).to_string())
      elif ops_type == 'Glove Box Operation' and step['type'] == 'material add':
        records, summary, keys = query('match (a {id: $sid})-[:USES]->(m: Material), (e: Experiment)-[:USE_PRECURSOR]->(m), (e)-[:INCLUDE_STEP]->(a) return count(e) as exp_num', sid = step['id'])
        assert len(records) == 1
        if records[0]['exp_num'] == 1:
          # if the added material is one of reactant
          precursor = precursors[reactant_idx]
          reactant_idx += 1
          instructions.append(self.ops_types[ops_type](step, query, precursor).to_string())
        else:
          # if the added material is just a solvent
          instructions.append(self.ops_types[ops_type](step, query).to_string())
      elif ops_type == 'Device':
        if step['device'] == 'ICP':
          # replace ICP reading
          comp = Composition(target).as_dict()
          params = json.loads(step['params'])
          params['elements'] = ':'.join(list(comp.keys()))
          params['proportion'] = ':'.join([str(v) for v in comp.values()])
          params['unit'] = 'mol'
        else:
          params = None
        instructions.append(self.ops_types[ops_type](step, query, params).to_string())
      else:
        instructions.append(self.ops_types[ops_type](step, query).to_string())

    return instructions

if __name__ == "__main__":
  exp = Instructions(password = '19841124')
  instructions = exp.steps('Li4Zn6Cl16', ['ZnCl2','LiCl'])
  for idx, instruction in enumerate(instructions):
    print(f"{idx}: {instruction}")


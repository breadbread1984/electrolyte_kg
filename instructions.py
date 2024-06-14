#!/usr/bin/python3

import numpy as np
from neo4j import GraphDatabase

class ExpStepDescription(object):
  def __init__(self, host = 'neo4j://localhost:7687', username = 'neo4j', password = None, db = 'neo4j'):
    self.driver = GraphDatabase.driver(host, auth = (username, password))
    self.database = db
  def __del__(self):
    self.driver.close()
  def steps(self, precursors: list):
    records, summary, keys = self.driver.execute_query('match (e: Experiment)-[r:USE_PRECURSOR]->(m:Material) with e, count(m) as precursor_num where precursor_num = $precursor_num return e.id as exp_id', precursor_num = len(precursors), database_ = self.database)
    matched = [record['exp_id'] for record in records]
    if len(matched) == 0:
      raise Exception('no experiment having the same number of rectants!')
    idx = np.random.randint(low = 0, high = len(matched), size = ())
    records, summary, keys = self.driver.execute_query('match (e: Experiment) where e.id = $exp_id return e.first_step as first_step, e.last_step as last_step', exp_id = matched[idx], database_ = self.database)
    assert len(records)
    first_step, last_step = records[0]['first_step'], records[0]['last_step']

if __name__ == "__main__":
  exp = ExpStepDescription(password = '19841124')
  exp.steps([1,2,3,4])

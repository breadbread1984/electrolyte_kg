#!/usr/bin/python3

from functools import partial
from neo4j import Driver
from neo4j.graph import Node
from abc import ABC, abstractmethod
import json

class Description(ABC):
  @abstractmethod
  def to_string(self,):
    raise NotImplementedError

class ContainerPreparation(Description):
  def __init__(self, node: Node, query: partial):
    self.node = node
  def to_string(self,):
    params = json.loads(self.node['params'])
    if self.node['type'] == 'Tammann tube':
      s = f"准备{self.node['type']}类型，{params['model']}型号的容器{self.node['target']}。"
    else:
      s = f"准备{self.node['type']}类型{params['volume']}{params['unit']}容器{self.node['target']}。"
    return s

class MaterialAdd(Description):
  def __init__(self, node: Node, query: partial, smiles: str = None):
    self.node = node
    self.smiles = smiles
    self.query = query
  def to_string(self,):
    if self.smiles is None:
      records, summary, keys = self.query('match (a {id: $sid})-[r:USES]->(b: Material) return b as material', sid = self.node['id'])
      assert len(records) == 1
      s = f"向容器{self.node['target']}添加{self.node['amount']}{self.node['unit']}前体物质{records[0]['material']['name']}。"
    else:
      s = f"向容器{self.node['target']}添加{self.node['amount']}{self.node['unit']}前体物质{self.smiles}。"
    return s

class Device(Description):
  def __init__(self, node: Node, query: partial, params: dict):
    self.node = node
    self.params = params
  def to_string(self,):
    params = json.loads(self.node['params'])
    if self.node['device'] in {'planetary ball mill','agate mortar and pestle mill'}:
      s = f"采用planetary ball mill对容器{self.node['target']}内的样本进行研磨，研磨转速为{params['rpm']}rpm，研磨时间为{params['seconds']}秒。"
    elif self.node['device'] == 'roller mill':
      s = f"向容器{self.node['target']}加入{params['bead material']}材质的滚磨珠，滚磨珠重量为{params['bead weight']}{params['bead weight unit']}，滚磨珠的直径为{params['bead size']}{params['bead size unit']}，然后通过roller mill对容器{self.node['target']}内的样本进行研磨，研磨转速为{params['rpm']}rpm，研磨时间为{params['seconds']}秒。"
    elif self.node['device'] == 'XRD':
      s = f"采用X-ray diffraction(XRD)设备对容器{self.node['target']}内的样品进行检测，"
      if params['type'] == "2theta":
        s += f"结果2θ应该在{','.join([f'{peak}°' for peak in params['peaks']])}产生峰值。"
      elif params['type'] == 'materials':
        s += f"结果应该在{','.join(params['peaks'])}物质对应位置产生峰值。"
      else:
        raise Exception('unknown mode for XRD!')
    elif self.node['device'] == 'ICP':
      params = self.params
      s = f"采用inductively coupled plasma spectrometer(ICP)设备对容器{self.node['target']}内的样本进行检测，结果需要显示{params['elements']}元素按照单位{params['unit']}计算的比例应该为{params['proportion']}。"
    else:
      raise Exception('unknown device!')
    return s

class GloveBoxOperation(Description):
  def __init__(self, node: Node, query: partial, smiles: str = None):
    self.node = node
    self.query = query
    self.smiles = smiles
  def to_string(self,):
    params = json.loads(self.node['params'])
    if self.node['type'] == 'moving':
      s = f"在{params['atmosphere']}环境的Glove Box中将容器{self.node['source']}中的物质转移{params['amount']}{params['unit']}到容器{self.node['target']}中。"
    elif self.node['type'] == 'sealing':
      s = f"在{params['atmosphere']}环境的Glove Box中对容器{self.node['target']}采用{params['method']}封闭。"
    elif self.node['type'] == 'heating':
      s = f"在{params['atmosphere']}环境的Glove Box中对容器{self.node['target']}进行加热，从室温到目标温度为{params['temperature']}{params['unit']}，"
      if params['warmup seconds'] != 'none' and params['warmup rate'] != 'none':
        s += f"加热需要在{params['warmup seconds']}秒时间以{params['warmup rate']}速率加热到目标温度，"
      s += f"在目标温度需要维持{params['duration seconds']}秒。"
    elif self.node['type'] == 'cooling':
      s = f"在{params['atmosphere']}环境的Glove Box中对容器{self.node['target']}进行冷却，到室温。"
    elif self.node['type'] == 'material add':
      if self.smiles is None:
        records, summary, keys = self.query('match (a {id: $sid})-[:USES]->(b: Material) return b', sid = self.node['id'])
        assert len(records) == 1
        s = f"在{params['atmosphere']}环境的Glove Box中对容器{self.node['target']}添加{self.node['amount']}{self.node['unit']}的{records[0]['b']['name']}。"
      else:
        s = f"在{params['atmosphere']}环境的Glove Box中对容器{self.node['target']}添加{self.node['amount']}{self.node['unit']}的{self.smiles}。"
    elif self.node['type'] == 'purify':
      if params['method'] == 'precipitation':
        s = f"在{params['atmosphere']}环境的Glove Box中对容器{self.node['target']}进行沉淀，然后去除{params['remove']}。"
      else:
        raise Exception('unknown purify method!')
    elif self.node['type'] == 'collect':
      if params['method'] == 'none':
        s = f"在{params['atmosphere']}环境的Glove Box中从容器{self.node['source']}转移样本到容器{self.node['target']}。"
      elif params['method'] == 'press':
        s = f"在{params['atmosphere']}环境的Glove Box中从容器{self.node['source']}中提取{params['sheet number']}份，每份重量为{params['sheet weight']}{params['sheet weight unit']}的样本，每份压成薄片并转移到容器{self.node['target']}。"
      elif params['method'] == 'tableting':
        s = f"在{params['atmosphere']}环境的Glove Box中从容器{self.node['source']}中取出样本用{params['pressure']}{params['pressure unit']}压力压成片，片的厚度为{params['thickness']}{params['unit']}，直径为{params['diameter']}{params['unit']}。将这些片状样本转移到容器{self.node['target']}。"
      else:
        raise Exception('unknown collect method!')
    elif self.node['type'] == 'quenching':
      s = f"在{params['atmosphere']}环境的Glove Box中采用{params['method']}方法对容器{self.node['target']}中的样本进行淬冷。"
    elif self.node['type'] == 'annealing':
      s = f"在{params['atmosphere']}环境的Glove Box中对容器{self.node['target']}中的样本进行退火处理，退火温度为{self.node['temperature']}{self.node['unit']}，保温时间为{self.node['insulation seconds']}秒，然后以{self.node['cooldown rate']}速度降到室温。"
    else:
      raise Exception('unknown Glove Box operation: %s!' % self.node['type'])
    return s

class Collect(Description):
  def __init__(self, node: Node, query: partial):
    self.node = node
  def to_string(self,):
    if self.node['method'] == 'none':
      s = f"从容器{self.node['source']}转移样本到容器{self.node['target']}。"
    elif self.node['method'] == 'press':
      params = json.loads(self.node['params'])
      s = f"从容器{self.node['source']}中提取{params['sheet number']}份，每份重量为{params['sheet weight']}{params['sheet weight unit']}的样本，每份压成薄片并转移到容器{self.node['target']}。"
    return s

class Seal(Description):
  def __init__(self, node: Node, query: partial):
    self.node = node
  def to_string(self,):
    s = f"对容器{self.node['target']}通过vacuum sealer进行密封。"
    return s

class Purify(Description):
  def __init__(self, node: Node, query: partial):
    self.node = node
  def to_string(self,):
    params = json.loads(self.node['params'])
    if self.node['method'] == 'precipitation':
      s = f"对容器{self.node['target']}通过沉淀方法，去除{params['remove']}。"
    elif self.node['method'] == 'calcination':
      s = f"对容器{self.node['target']}进行煅烧，煅烧在温度{params['temperature']}{params['unit']}持续{params['seconds']}秒。"
      if 'warmup rate' in params:
        s += f"升温速度为{params['warmup rate']}。"
      if 'cooldown rate' in params:
        s += f"冷却速度为{params['cooldown rate']}。"
    else:
      raise Exception('unknown purify method!')
    return s

class Dry(Description):
  def __init__(self, node: Node, query: partial):
    self.node = node
  def to_string(self,):
    params = json.loads(self.node['params'])
    if self.node['method'] == 'vacuum pump':
      s = f"对容器{self.node['target']}加热到{params['temperature']}{params['unit']}，并通过{self.node['method']}进行干燥。"
    else:
      raise Exception('unknown dry method!')
    return s



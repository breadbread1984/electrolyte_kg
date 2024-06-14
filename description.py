#!/usr/bin/python3

from neo4j.graph import Node
from abc import ABC, abstractmethod
import json

class Description(ABC):
  @abstractmethod
  def to_string(self,):
    raise NotImplementedError

class ContainerPreparation(Description):
  def __init__(self, node: Node):
    self.node = node
  def to_string(self,):
    s = f"准备{self.node['type']}类型{self.node['volume']}{self.node['unit']}容器{self.node['target']}。"
    return s

class MaterialAdd(Description):
  def __init__(self, node: Node, smiles: str):
    self.node = node
    self.smiles = smiles
  def to_string(self,):
    s = f"向容器{self.node['target']}添加前体物质{self.smiles}。"
    return s

class Device(Description):
  def __init__(self, node: Node):
    self.node = node
  def to_string(self,):
    params = json.loads(self.node['params'])
    if self.node['device'] == 'planetary ball mill':
      s = f"采用planetary ball mill对容器{self.node['target']}内的样本进行研磨，研磨转速为{params['rpm']}rpm，研磨时间为{params['seconds']}秒。"
    elif self.node['device'] == 'XRD':
      s = f"采用X-ray diffraction(XRD)设备对容器{self.node['target']}内的样品进行检测，"
      if params['type'] == "2theta":
        s += f"结果2θ应该在{','.join([f'{peak}°' for peak in params['peaks']])}产生峰值。"
      elif params['type'] == 'materials':
        s += f"结果应该在{','.join(params['peaks'])}物质对应位置产生峰值。"
      else:
        raise Exception('unknown mode for XRD!')
    elif self.node['device'] == 'ICP':
      s = f"采用inductively coupled plasma spectrometer(ICP)设备对容器{self.node['target']}内的样本进行检测，结果需要显示{params['elements']}元素按照单位{params['unit']}计算的比例应该为{params['proportion']}。"
    else:
      raise Exception('unknown device!')
    return s

class GloveBoxOperation(Description):
  def __init__(self, node: Node):
    self.node = node
  def to_string(self,):
    params = json.loads(self.node['params'])
    if self.node['type'] == 'moving':
      s = f"在{params['atmosphere']}环境的Glove Box中将容器{self.node['source']}中的物质转移{params['amount']}{params['unit']}到容器{self.node['target']}中。"
    elif self.node['type'] == 'sealing':
      s = f"在{params['atmosphere']}环境的Glove Box中对容器{self.node['target']}采用{params['method']}采用封闭。"
    elif self.node['type'] == 'heating':
      s = f"在{params['atmosphere']}环境的Glove Box中对容器{self.node['target']}进行加热，从室温到目标温度为{params['temperature']}{params['unit']}，"
      if params['warmup seconds'] != 'none' and params['warmup rate'] != 'none':
        s += f"加热需要在{params['warmup seconds']}秒时间以{params['warmup rate']}速率加热到目标温度，"
      s += f"在目标温度需要维持{params['duration seconds']}秒。"
    elif self.node['type'] == 'cooling':
      s = f"在{params['atmosphere']}环境的Glove Box中对容器{self.node['target']}进行冷却，到室温。"
    else:
      raise Exception('unknown Glove Box operation!')
    return s

class Collect(Description):
  def __init__(self, node: Node):
    self.node = node
  def to_string(self,):
    s = f"从容器{self.node['source']}转移样本到容器{self.node['target']}。"
    return s

class Purify(Description):
  def __init__(self, node: Node):
    self.node = node
  def to_string(self,):
    params = json.loads(self.node['params'])
    s = f"对容器{self.node['target']}通过{self.node['method']}方法，去除{params['remove']}。"
    return s

class Dry(Description):
  def __init__(self, node: Node):
    self.node = node
  def to_string(self,):
    params = json.loads(self.node['params'])
    if self.node['method'] == 'vacuum pump':
      s = f"对容器{self.node['target']}加热到{params['temperature']}{params['unit']}，并通过{self.node['method']}进行干燥。"
    else:
      raise Exception('unknown dry method!')
    return s



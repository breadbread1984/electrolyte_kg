#!/usr/bin/python3

from neo4j.graph import Node
from abc import ABC
import json

class Description(ABC):
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
      s = f"采用planetary ball mill对容器{self.node['target']}进行研磨，研磨转速为{params['rpm']}，研磨时间为{params['seconds']}秒。"
    elif self.node['device'] == 'XRD':
      s = f"采用X-ray diffraction(XRD)设备对容器{self.node['target']}内的样品进行检测，"
      if params['type'] == "2theta":
        s += f"结果2θ应该在{','.join([peak + '°' for peak in params['peaks']])}产生峰值。"
      elif params['type'] == 'materials':
        s += f"结果应该在{','.join(params['peaks'])}物质对应位置产生峰值。"
      else:
        raise Exception('unknown mode for XRD!')
    elif self.node['device'] == 'ICP':
      s = f"采用inductively coupled plasma spectrometer(ICP)设备对容器{self.node['target']}内的样本进行检测，结果需要显示{params['elements']}元素按照单位{params['unit']}计算的比例应该为{params['proportion']}。"
    else:
      raise Exception('unknown device!')
    return s

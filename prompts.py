#!/usr/bin/python3

from langchain import hub
from langchain_core.output_parsers import JsonOutputParser
from langchain_core.pydantic_v1 import BaseModel, Field, create_model
from langchain.tools.render import render_text_description
from langchain_core.prompts.promt import PromptTemplate

def exp_instruction_prompt(tokenizer):
  class UnstructuredSteps(BaseModel):
    steps: list = Field(
      description = (
        "experiment step instructions given in human readable strings as elements of this list"
      )
    )
  parser = JsonOutputParser(pydantic_object = UnstructuredSteps)
  examples = [
      {
        "precursors" : ["Li2O","Li2S","Li3PO4","LiCl"],
        "target": "Li6PS5Cl",
        "steps": [
          "准备zirconia grinding jar类型45ml容器c1。",
          "向容器c1添加0.464g前体物质Li2O。",
          "向容器c1添加0.591g前体物质Li2S。",
          "向容器c1添加0.360g前体物质Li3PO4。",
          "向容器c1添加0.085g前体物质LiCl。",
          "采用planetary ball mill对容器c1内的样本进行研磨，研磨转速为370rpm，研磨时间为90000秒。",
          "采用X-ray diffraction(XRD)设备对容器c1内的样品进行检测，结果2θ应该在26.8°,30.0°,34.6°产生峰值。",
          "准备Tammann tube类型，PT2型号的容器c2。",
          "在argon环境的Glove Box中将容器c1中的物质转移1.5g到容器c2中。",
          "在argon环境的Glove Box中对容器c2采用quartz wool封闭。",
          "在argon环境的Glove Box中对容器c2采用SUS sealed container封闭。",
          "在argon环境的Glove Box中对容器c2进行加热，从室温到目标温度为520C，加热需要在10800秒时间以2.5/min速率加热到目标温度，在目标温度需要维持28800秒。",
          "在argon环境的Glove Box中对容器c2进行冷却，到室温。",
          "采用X-ray diffraction(XRD)设备对容器c2内的样品进行检测，结果2θ应该在15.6°,18.0°,25.6°,30.1°,31.5°,45.2°产生峰值。",
          "采用inductively coupled plasma spectrometer(ICP)设备对容器c2内的样本进行检测，结果需要显示Li:P:S:Cl元素按照单位mol计算的比例应该为6.0:1.0:5.0:1.0。"
        ]
      }
    ]
  instructions = parser.get_format_instructions()
  instructions = instructions.replace('{','{{')
  instructions = instructions.replace('}','}}')
  examples = str(examples).replace('{','{{')
  examples = examples.replace('}','}}')
  system_prompts = """You are an electrolyte design expert. You can design the experimental steps for electrolyte synthesis based on the given precursors of an electrolyte and your own chemical knowledge.


Below are a number of examples of given precursors, target electrolyte and their generated experimental steps.
%s""" % examples
  human_prompts = """For the following given precursors and target electrolyte, design an experiment in detail steps.
%s

precursors: {precursors}
target: {target}""" % instructions
  messages = [
    {'role': 'system', 'content': system_prompt},
    {'role': 'user', 'content': human_prompts}
  ]
  prompt = tokenizer.apply_chat_template(messages, tokenize = False, add_generation_prompt = True)
  template = PromptTemplate(template = prompt, input_variables = ['precursors', 'target'])
  return template, parser


#!/usr/bin/python3

from absl import flags, app
from reaction_path import PrecursorsRecommendation
from prompts import exp_instruction_prompt
from models import Llama3, CodeLlama, Qwen2, CodeQwen1_5, Qwen1_5

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_enum('model', default = 'llama3', enum_values = {'llama3', 'codellama', 'qwen2', 'codeqwen', 'qwen1.5'}, help = 'available models')
  flags.DEFINE_string('target', default = 'Li6PS5Cl', help = 'electrolyte represented in format of chemical formula')
  flags.DEFINE_boolean('locally', default = False, help = 'whether to run model locally')

def main(unused_argv):
  recommend = PrecursorsRecommendation()
  target_formula = [FLAGS.target]
  all_predicts = recommend.call(target_formula = target_formula, top_n = 10)
  precursor_sets = all_predicts[0]['precursors_predicts']
  tokenizer, llm = {
    'llama3': Llama3,
    'codellama': CodeLlama,
    'qwen2': Qwen2,
    'codeqwen': CodeQwen1_5,
    'qwen1.5': Qwen1_5,
  }[FLAGS.model](FLAGS.locally)
  template, parser = exp_instruction_prompt(tokenizer)
  chain = template | llm | parser
  for idx, precursors in enumerate(precursor_sets):
    steps = chain.invoke({'precursors': ','.join(precursors), 'target': FLAGS.target})
    print(steps)

if __name__ == "__main__":
  add_options()
  app.run(main)

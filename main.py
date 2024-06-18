#!/usr/bin/python3

from absl import flags, app
from reaction_path import PrecursorsRecommendation

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('target', default = 'Li6PS5Cl', help = 'electrolyte represented in format of chemical formula')

def main(unused_argv):
  recommend = PrecursorsRecommendation()
  target_formula = [FLAGS.target]
  all_predicts = recommend.call(target_formula = target_formula, top_n = 10)
  print(all_predicts[0]['precursors_predicts'])

if __name__ == "__main__":
  add_options()
  app.run(main)

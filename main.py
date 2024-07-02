#!/usr/bin/python3

from absl import flags, app
from reaction_path import PrecursorsRecommendation
from instructions import Instructions

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('host', default = 'bolt://localhost:7687', help = 'neo4j host')
  flags.DEFINE_string('user', default = 'neo4j', help = 'user name')
  flags.DEFINE_string('password', default = 'neo4j', help = 'password')
  flags.DEFINE_string('db', default = 'neo4j', help = 'database')
  flags.DEFINE_string('target', default = 'Li6PS5Cl', help = 'electrolyte represented in format of chemical formula')

def main(unused_argv):
  recommend = PrecursorsRecommendation()
  target_formula = [FLAGS.target]
  all_predicts = recommend.call(target_formula = target_formula, top_n = 10)
  precursor_sets = all_predicts[0]['precursors_predicts']
  exp = Instructions(host = FLAGS.host, username = FLAGS.user, password = FLAGS.password, db = FLAGS.db)
  for idx, precursors in enumerate(precursor_sets):
    instructions = exp.steps(FLAGS.target, precursors)
    if instructions is None: continue
    print('第%d种实验方案:' % (idx + 1))
    for sid, step in enumerate(instructions):
      print('%d)%s' % (sid, step))

if __name__ == "__main__":
  add_options()
  app.run(main)

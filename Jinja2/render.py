#!/usr/bin/env python

import sys
import re
from jinja2 import Environment, FileSystemLoader
import yaml
from bracket_expansion import *
from pprint import pprint

import os
os.system('cls' if os.name == 'nt' else 'clear')

trim = True
if (len(sys.argv) > 2):
  trim = sys.argv[2] != 'notrim'

ENV = Environment(loader=FileSystemLoader('.'),trim_blocks=trim,lstrip_blocks=trim)
ENV.filters['bracket_expansion'] = bracket_expansion

filename = re.sub("\.$","",sys.argv[1])

print ('--- Reading YAML file '+filename+'.yml ---')
with open(filename + '.yml') as _: yamldict = yaml.load(_)

print ('--- YAML dictionary in '+filename+'.yml ---')
pprint(yamldict)
print

print ('--- Rendering template '+filename+'.j2 ---') 
template = ENV.get_template(filename + ".j2")
print(template.render(**yamldict))
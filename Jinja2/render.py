#!/usr/bin/env python

import sys
import getopt
import re
from jinja2 import Environment, FileSystemLoader, Undefined, StrictUndefined, make_logging_undefined
import yaml
from bracket_expansion import *
from pprint import pprint

import os
os.system('cls' if os.name == 'nt' else 'clear')

def getOptions():
  try:
    options, args = getopt.getopt(sys.argv[1:], "y:j:n:sw", ["yaml=", "jinja=", "notrim", "strict", "warning"])
  except getopt.GetoptError as err:
    # print help information and exit:
    print (str(err))  # will print something like "option -a not recognized"
    sys.exit(2)

  global yamlfile,jinjafile,trim,undefined
  trim = True
  opts = 0

  for opt,arg in options:
    opts = opts + 1
    if opt in ("-y","-yaml"):
      yamlfile = arg
    elif opt in ("-j","-jinja"):
      jinjafile = arg
    elif opt in ("-n","-notrim"):
      trim = False
    elif opt in ("-w","-warning"):
      undefined = make_logging_undefined (base = Undefined)
    elif opt in ("-s","-strict"):
      undefined = make_logging_undefined (base = StrictUndefined)

  return opts > 0

trim = True
undefined = Undefined
yamlfile = None
jinjafile = None

if not getOptions():
  if (len(sys.argv) > 2):
    trim = sys.argv[2] != 'notrim'

ENV = Environment(loader=FileSystemLoader('.'),trim_blocks=trim,lstrip_blocks=trim,undefined=undefined)
ENV.filters['bracket_expansion'] = bracket_expansion

filename = re.sub("\.$","",sys.argv[1])

if yamlfile is None:
  yamlfile = filename+".yml"

if jinjafile is None:
  jinjafile = filename+".j2"

print ('--- Reading YAML file '+yamlfile+' ---')
with open(yamlfile) as _: yamldict = yaml.load(_,Loader=yaml.BaseLoader)

print ('--- YAML dictionary in '+yamlfile+' ---')
pprint(yamldict)
print

print ('--- Rendering template '+jinjafile+' ---') 
template = ENV.get_template(jinjafile)
print(template.render(**yamldict))
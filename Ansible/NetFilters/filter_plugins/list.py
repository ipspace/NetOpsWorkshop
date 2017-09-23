#
# Simple list append filter
#
from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

from jinja2 import TemplateError

class FilterModule(object):


#
# Append a number of items to the list
#
  def list_append(self,l,*argv):
    if type(l) is not list:
      raise TemplateError("First argument of append filter must be a list")

    for element in argv:
      if type(element) is list:
        l.extend(element)
      else:
        l.append(element)
    return l

  def dict_to_list(self,o):
    if type(o) is not dict:
      raise TemplateError("dict_to_list can only be used on dictionaries")

    l = []
    for k,v in o.items():
      v['id'] = k
      l.append(v)

    return l

  def filters(self):
    return {
      'append': self.list_append,
      'to_list': self.dict_to_list
    }
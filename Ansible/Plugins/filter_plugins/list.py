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

  def filters(self):
    return {
      'append': self.list_append
    }
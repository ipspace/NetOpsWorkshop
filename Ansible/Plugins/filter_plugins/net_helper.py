#
# Simple list append filter
#
from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

from jinja2 import TemplateError

class FilterModule(object):


#
# Figure out network device OS type based on "show version" printout
#
  def device_type(self,show_ver,*deftype):
    if "Cisco IOS" in show_ver: return "ios"
    if "NX-OS" in show_ver:     return "nx-os"
    if len(deftype) > 0:        return deftype[0]

    raise TemplateError("Unknown device type - did you pass me show version?")

  def filters(self):
    return {
      'device_type': self.device_type
    }
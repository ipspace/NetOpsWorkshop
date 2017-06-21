#!/usr/bin/env python

try:
  import re
  import sys
  import getopt
  import pprint
  import commands
except ImportError as e:
  print "Import error:",e
  sys.exit(2)

def usage():
  print "Usage: Vagrant2Inventory -a ipaddr -s regexp -u user -p pass -v"
  print ""
  print " -a: specify host IP address in VirtualBox environment (default: 10.0.2.2)"
  print " -s: skip hosts matched by regexp"
  print " -u: SSH username (default: vagrant)"
  print " -p: SSH password (default: vagrant)"
  print " -v: verbose"
  print " --vm: create an inventory for VM-based setup (using 10.0.2.2 IP address in VirtualBox)"

def getOptions():
  try:
    options, args = getopt.getopt(sys.argv[1:], "a:s:u:p:v", ["address=", "skip=", "username=", "password=","vm"])
  except getopt.GetoptError as err:
    # print help information and exit:
    print str(err)  # will print something like "option -a not recognized"
    usage()
    sys.exit(2)

  opts = { 'username': 'vagrant', 'password': 'vagrant' }

  for opt,arg in options:
    if opt in ("-a","-address"):
      opts['address'] = arg
    elif opt in ("-u","-username"):
      opts['username'] = arg
    elif opt in ("-p","-password"):
      opts['password'] = arg
    elif opt in ("-s","-skip"):
      opts['skip'] = arg
    elif opt == "-v":
      opts['verbose'] = True
    elif opt == "--vm":
      opts['address'] = '10.0.2.2'
    elif opt == "-h": 
      usage()
      sys.exit(0)
    else:
      assert False,format("Unhandled option {0}",opt)

  return opts

def getSSHConfig():
  try:
    results = commands.getstatusoutput("vagrant ssh-config")
  except:
    print "Failed: cannot execute ssh-config"
    sys.exit(1)

  if (results[0]):
    print "vagrant ssh-config failed"
    print ""
    print results[1]
    sys.exit(1)

  return results[1]

def parseSSHConfig(c,o):
  nodes = []
  node  = {}

  def addPreviousNode(l,n):
    if "host" in n: l.append(n)

  host = re.compile("Host\s+(.+)$")
  addr = re.compile("\s*HostName\s+(.+)$")  #[0-9a-fA-F.]
  port = re.compile("\s*Port\s+([0-9]+)$")

  for line in c.split("\n"):
    m_host = host.match(line)
    m_addr = addr.match(line)
    m_port = port.match(line)

    if m_host:
      addPreviousNode(nodes,node)
      node = { 'host' : m_host.groups()[0]}
    elif m_addr:
      node['addr'] = m_addr.groups()[0]
    elif m_port:
      node['port'] = m_port.groups()[0]

  addPreviousNode(nodes,node)
  return nodes

def printInventory(nodeList,opts):
  if "skip" in opts:
    skipMatch = re.compile(opts["skip"])

  for node in nodeList:
    d = node.copy()
    d.update(opts)
    if (d['addr'] == "127.0.0.1") and ("address" in d):
      d['addr'] = d['address']

    skip = None
    if "skip" in opts:
      skip = skipMatch.match(d['host'])
    if not(skip):
      print "{host:<10} ansible_host={addr:<16} ansible_port={port:<5} ansible_user={username} ansible_ssh_pass={password}".format(**d)

def main():
  opts = getOptions()
  if 'verbose' in opts: print "Executing vagrant ssh-config"
  sshconf = getSSHConfig()

  if 'verbose' in opts:   
    print "Returned by ssh-config:"
    print sshconf
    print 

  nodeList = parseSSHConfig(sshconf,opts)
  if 'verbose' in opts: 
    print "Parsing results:"
    print pprint.pprint(nodeList)

  printInventory(nodeList,opts)

main()

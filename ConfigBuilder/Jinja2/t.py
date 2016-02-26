import os
import yaml

print '-- initially opened files'
os.system('ls -l /proc/self/fd')

print '-- opening a YAML file'
f = open("1-basicFail.yml")
os.system('ls -l /proc/self/fd')

print '-- opening a YAML file with "WITH" '
with open("2-conditionals.yml") as _: data = yaml.load(_)
os.system('ls -l /proc/self/fd')

print '-- open as a parameter to yaml.load'
data = yaml.load(open('5-sequence.yml'))
os.system('ls -l /proc/self/fd')

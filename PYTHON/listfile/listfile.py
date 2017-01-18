'''
use file ext for searching
'''
import os, sys
path = '.'

fileType = sys.argv[1]

for root, dirs, files in os.walk(path):
  for file in files:
    if file.endswith(fileType):
      print(os.path.join(root, file))
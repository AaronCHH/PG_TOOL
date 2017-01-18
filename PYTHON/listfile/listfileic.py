'''
use partial name for searcing file
'''
import os, sys
path = '.'

fileType = sys.argv[1]

for root, dirs, files in os.walk(path):
  for file in files:
    if fileType in file:
      print(os.path.join(root, file))
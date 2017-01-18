'''
use file ext for searching
search only this level
'''
import os, sys, glob
path = '.'

fileType = sys.argv[1]

for file in glob.glob('*' + fileType):
  print(file)
import os, sys

# listFile = 'list.txt'
listFile = sys.argv[1]

with open(listFile, 'r') as f:
  for line in f:
    line = line.strip()
    os.mkdir(line)
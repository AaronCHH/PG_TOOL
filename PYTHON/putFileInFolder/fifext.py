# put file in folder(same name) with specified extension
import os, sys, shutil
from os.path import basename

fileType = sys.argv[1]
files = [f for f in os.listdir("./") if f.endswith(fileType)]

for file in files:
  fileS = os.path.splitext(file)[0]
  os.mkdir(fileS)
  shutil.move(file, fileS + '/' + file)
# put files with specified partial name in folder with the specified name
import os, sys, shutil, glob
from os.path import basename

fileStr = sys.argv[1]
fdrName = fileStr
os.mkdir(fdrName)

files = [f for f in os.listdir("./") if f.find(fileStr) != -1 and os.path.isfile("./" + f)]

for file in files:
  # print(file)
  shutil.move(file, fdrName + '/' + file)

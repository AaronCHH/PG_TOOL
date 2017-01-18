import os, sys, shutil
files = [f for f in os.listdir("./") if f.endswith('.pdf')]

for file in files:
  fileS = file[:-4]
  os.mkdir(fileS)
  shutil.move(file, fileS + '/' + file)
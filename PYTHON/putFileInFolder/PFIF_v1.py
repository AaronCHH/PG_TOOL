import os, sys
files = [f for f in os.listdir("./") if f.endswith('.pdf')]

for file in files:
  fileS = file[:-4]
  os.mkdir(fileS)
  os.rename(file, fileS + '/' + file)
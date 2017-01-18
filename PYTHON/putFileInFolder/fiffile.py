# put selected file in folder with filename
import os, sys, shutil
from os.path import basename

fileName = sys.argv[1]
files = [f for f in os.listdir("./") if f == fileName]

for file in files:
    fdrName = os.path.splitext(file)[0] 
    os.mkdir(fdrName)
    shutil.move(fileName, fdrName + '/' + file)

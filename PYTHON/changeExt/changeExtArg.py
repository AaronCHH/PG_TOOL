# coding: utf-8

import os, sys
path = "./"

extOld = sys.argv[1]
extNew = sys.argv[2]

files = [f for f in os.listdir(path) if os.path.isfile(os.path.join(path, f))]
files = [f for f in files if f.endswith(extOld)]
# print(files)

for file in files:
#     print(os.path.splitext(file)[0])
    os.rename(file, os.path.splitext(file)[0] + extNew)
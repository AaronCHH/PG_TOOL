# coding: utf-8
import os, shutil, sys
ext = sys.argv[1]

for root, dirs, files in os.walk("./", topdown=False):
    for name in files:
        if name.endswith(ext):
#             print(name)
            print(os.path.join(root, name))
            shutil.move(os.path.join(root, name), './' + name)
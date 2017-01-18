# coding: utf-8
import os, shutil, sys
ext = sys.argv[1]

i = 1
for root, dirs, files in os.walk("./", topdown=False):
    for name in files:
        if name.endswith(ext):
#             print(name)
            print(os.path.join(root, name))
            shutil.copy(os.path.join(root, name), './' + name[:-4] + str(i) + name[-4:])
            i = i + 1 
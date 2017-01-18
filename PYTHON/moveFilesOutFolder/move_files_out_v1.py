# coding: utf-8
import os, shutil
for root, dirs, files in os.walk("./", topdown=False):
    for name in files:
        if name.endswith(".md"):
#             print(name)
            print(os.path.join(root, name))
            shutil.move(os.path.join(root, name), './' + name)
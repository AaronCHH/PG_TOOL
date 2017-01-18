import os

directory_list = list()
for root, dirs, files in os.walk("./", topdown=True):
    for name in dirs:
        # directory_list.append(os.path.join(root, name))
        directory_list.append(name)
print(directory_list)
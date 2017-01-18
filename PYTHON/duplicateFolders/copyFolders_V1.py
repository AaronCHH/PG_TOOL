import os
thedir = './'
names = [ name for name in os.listdir(thedir) if os.path.isdir(os.path.join(thedir, name)) ]

for nm in names:
  print(nm)

opath = '../newset/'
os.mkdir(opath)

for nm in names:
  os.mkdir(opath + nm)
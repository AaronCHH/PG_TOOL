'''
use file ext for searching
search only this level
'''
import os, sys, glob
# path = '.'

folderName = sys.argv[1]
fileType = sys.argv[2]

# print(folderName + '/' + fileType)

for file in glob.glob( folderName + '/*' + fileType):
  # print(file)
  print(os.path.basename(file))
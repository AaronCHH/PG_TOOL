import glob, os, sys

fileList = []

for file in glob.glob("*.java"):
  fileS = file[:-5]
  # fileList.append(fileS)
  # print(file[:-5])
  outFile = fileS + '.bat'
  fout = open(outFile, 'wt', encoding = 'utf-8')
  fout.write('javac ' + file + '\n')
  fout.write('java ' + fileS + '\n')
  fout.write('pause')
  fout.close()
  os.system(outFile)

# os.system("pause")
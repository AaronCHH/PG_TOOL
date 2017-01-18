import glob, os, sys

fileList = []

for file in glob.glob("*.c"):
  fileS = file[:-2]
  # fileList.append(fileS)
  # print(file[:-3])
  outFile = fileS + '.bat'
  fout = open(outFile, 'wt', encoding = 'utf-8')
  fout.write('gcc ' + file + ' -o ' + fileS + '.exe' + '\n')
  fout.write(fileS + '.exe')
  fout.close()
  os.system(outFile)


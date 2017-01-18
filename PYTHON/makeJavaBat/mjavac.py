import glob, os, sys

fileList = []

for file in glob.glob("*.java"):
  fileS = file[:-5]                                     # get file name
  # fileList.append(fileS)
  # print(file[:-5])
  outFile = fileS + '.bat'                              # set output file name
  fout = open(outFile, 'wt', encoding = 'utf-8')        # open output file
  fout.write('if not exist ' + fileS + '.class ')       # (bat) if .class not exist
  fout.write('javac ' + file + '\n')                    #         then compile  
  fout.write('java ' + fileS + '\n')                    # run java
  fout.write('pause')                                   # (bat) "pause" in .bat  
  fout.close()                                          # close output file
  # os.system(outFile)                                    # run .bat

# os.system("pause")
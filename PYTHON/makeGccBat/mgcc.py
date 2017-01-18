#!/usr/bin/env python
# -*- coding: big5 -*-

import glob, os, sys

fileList = []

for file in glob.glob("*.c"):
  fileS = file[:-2]                                               # get file name
  # fileList.append(fileS)
  # print(file[:-3])
  outFile = fileS + '.bat'                                        # set output file name 
  fout = open(outFile, 'wt', encoding = 'big5')                   # open output file
  # fout.write('chcp 65001\n')
  fout.write('if not exist ' + fileS + '.exe ')                   # (bat) if .exe not exist
  fout.write('gcc ' + file + ' -o ' + fileS + '.exe' + '\n')      #         then compile
  fout.write(fileS + '.exe')                                      # (bat) run .exe in .bat
  fout.close()                                                    # close output file
  # os.system(outFile)                                              # run .bat


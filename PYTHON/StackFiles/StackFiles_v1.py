import glob, sys, os
# obtain files
files = glob.glob('./*.py')

fout = open('combine.md','at',encoding='utf-8')

for file in files:

    print(file)

    fin = open(file,'rt',encoding='utf-8')

    line = fin.readline()

    while line:
        fout.write(line)
        line = fin.readline()

    fin.close()



fout.close()

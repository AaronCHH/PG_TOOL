import glob, sys, os
# obtain files
fileType = sys.argv[1]
files = glob.glob('*' + fileType)

fout = open('combine.md','at',encoding='utf-8')

for file in files:

    print(file)

    fin = open(file,'rt',encoding='utf-8')

    line = fin.readline()

    fout.write(file + '\n')
    while line:
        fout.write(line)
        line = fin.readline()

    fin.close()



fout.close()

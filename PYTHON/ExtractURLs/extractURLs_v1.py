
# coding: utf-8
import sys, os

# Find the files end with *.url
path = './'
files = [f for f in os.listdir(path) if f.endswith(".url") or f.endswith(".URL")]
# files

# Open output file
fout = open('urlList.md', 'w+', encoding = 'utf-8')

# Write urls into output file
for i in range(len(files)):
    with open(path + files[i]) as f:
        line = f.readline().strip()
        line2 = f.readline().strip()
    fout.write(files[i][:-4] + ' [link](' + line2[4:] + ')' + '  \n')   

# Close output file    
fout.close()
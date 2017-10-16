#!/usr/bin/python
import sys
import random

if len(sys.argv) < 3:
    print ('Usage:<filename> [nfold = 5] [col_name]')
    exit(0)

fi = open( sys.argv[1], 'r' )
ftr = open( sys.argv[1]+'.train', 'w' )
fte = open( sys.argv[1]+'.test', 'w' )
nfold = int( sys.argv[2] )
col_name = sys.argv[3]

i = 0
qid_col = -1
header = ""

for l in fi:
    i += 1
print "total line in", sys.argv[1], "is", i
fi.close()

trainLineCount = i * (nfold - 1) / nfold
print "expected train line count is", trainLineCount

j = 0
start_test = 0
margin_qid = ""
fi = open( sys.argv[1], 'r' )
for l in fi:
    if j == 0:
        header = l
        qid_col = l.split(",").index(col_name)
        if qid_col == -1:
            print sys.argv[3], "col is not found"
        ftr.write(l)
        fte.write(l)
    elif j < trainLineCount:
        ftr.write(l)
    elif j == trainLineCount:
        if qid_col == -1:
            start_test = 1
            print "train line count is ", j
        else:
            margin_qid = l.split(",")[qid_col]
            print "margin", sys.argv[3], "is", margin_qid
        ftr.write(l)
    elif start_test == 0:
            ftr.write(l)
            if l.split(",")[qid_col] != margin_qid:
                start_test = 1
                print "train line count is ", j
    else:
        fte.write(l)
    j += 1

fi.close()
ftr.close()
fte.close()


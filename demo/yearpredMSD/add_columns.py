#!/usr/bin/python
import sys
import random

if len(sys.argv) < 3:
    print 'Usage: <input csv> <col_name_value_pairs> <output csv>'
    print 'Add columns to csv, col_name_value_pairs pattern is colname1:value1,colname2:value2'

cols_2_add = sys.argv[2].lower().strip().split(',')
header_append = ""
body_append = ""

for col in cols_2_add:
    name_value_pair = col.split(':')
    if len(name_value_pair) == 2:
        header_append += ("," + name_value_pair[0])
        body_append += ("," + name_value_pair[1])
print header_append, body_append

fo = open(sys.argv[3].strip(), 'w')
is_header = 1

for l in open(sys.argv[1].strip()):
    if is_header == 1:
        fo.write(l.strip() + header_append + "\n")
        is_header = 0
    else:
        fo.write(l.strip() + body_append + "\n")
fo.close()

#!/usr/bin/python
import sys
import random

if len(sys.argv) < 4:
    print 'Usage: <input csv> <positive sample rate> <negtive sample rate> <output csv>'
    print 'sample positive and negative labeled data according to given ratio'

pos_ratio = float(sys.argv[2])
neg_ratio = float(sys.argv[3])
fo = open(sys.argv[4].strip(), 'w')
is_header = 1
label_index = -1
print "Pos ratio: ", pos_ratio, ", neg ratio: ", neg_ratio
pos_count = 0
neg_count = 1

for l in open(sys.argv[1].strip()):
    if is_header == 1:
        feature_names = l.lower().replace("(", "").replace(")", "").strip().split(',')
        is_header = 0
        label_index = feature_names.index("label")
        if label_index == -1:
            print "no label column"
            break
        fo.write(l)
        continue
    feature_vector = l.replace("(", "").replace(")", "").split(',')

    if feature_vector[label_index] == "1" and random.random() <= pos_ratio:
        pos_count += 1
        fo.write(l)
    elif feature_vector[label_index] == "0" and random.random() <= neg_ratio:
        neg_count += 1
        fo.write(l)
fo.close()
print "pos_count  neg_count  neg_count/pos_count"
print pos_count, neg_count, float(neg_count)/pos_count

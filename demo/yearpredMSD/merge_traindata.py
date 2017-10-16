#!/usr/bin/python
import sys
import random

if len(sys.argv) < 3:
    print 'Usage: <input csv1> <input csv2> <output csv>'
    print 'Merge two feature vectors to their union set.\n' \
          'When feature name is the same, merge to one column; else give 0 value to the one without this column'


fi1 = open(sys.argv[1].strip())
fi2 = open(sys.argv[2].strip())
fo = open(sys.argv[3].strip(), 'w')

header1 = fi1.readline().lower().replace("(", "").replace(")", "").strip().split(',')
header2 = fi2.readline().lower().replace("(", "").replace(")", "").strip().split(',')
col_num1 = len(header1)
col_num2 = len(header2)
feature_names = header1 + list(set(header2) - set(header1)) #list(set(header1 + header2))
print "feature_num1 feature_num2 feature_num_merged"
print col_num1, col_num2, len(feature_names)
fo.write(','.join([str(j) for j in feature_names]) + "\n")

col1_indices = [-1]*col_num1
for i in range(0, col_num1, 1):
    col1_indices[i] = feature_names.index(header1[i])
col2_indices = [-1]*col_num2
for i in range(0, col_num2, 1):
    col2_indices[i] = feature_names.index(header2[i])

line = fi1.readline()
while line != '':
    feature_values = [0]*len(feature_names)
    cur_instance = line.replace("(", "").replace(")", "").strip().split(',')
    if len(cur_instance) == col_num1:
        for i in range(0, col_num1, 1):
            feature_values[col1_indices[i]] = cur_instance[i]
    fo.write(','.join([str(j) for j in feature_values]) + "\n")
    line = fi1.readline()
fi1.close()

line = fi2.readline()
while line != '':
    feature_values = [0]*len(feature_names)
    cur_instance = line.replace("(", "").replace(")", "").strip().split(',')
    if len(cur_instance) == col_num2:
        for i in range(0, col_num2, 1):
            feature_values[col2_indices[i]] = cur_instance[i]
    fo.write(','.join([str(j) for j in feature_values]) + "\n")
    line = fi2.readline()
fi2.close()

# for l1 in open(sys.argv[1].strip()):
#     for l2 in open(sys.argv[2].strip()):
#         if is_header:
#             li1 = l1.lower().replace("(", "").replace(")", "").strip().split(',')
#             li2 = l2.lower().replace("(", "").replace(")", "").strip().split(',')
#             col_num1 = len(li1)
#             col_num2 = len(li2)
#             feature_names = set(li1 + li2)
#             fo.write(feature_names)
#             # feature_values = [sizeof(feature_names)]
#             is_header = 0
#         else:
#             break

#print fi1.readline(1)
#print fi2.readline(1)
#
# label_index = -1
# print "Pos ratio: ", pos_ratio, ", neg ratio: ", neg_ratio
# pos_count = 0
# neg_count = 1
#
# for l in open(sys.argv[1].strip()):
#     if is_header == 1:
#         feature_names = l.lower().replace("(", "").replace(")", "").strip().split(',')
#         is_header = 0
#         label_index = feature_names.index("label")
#         if label_index == -1:
#             print "no label column"
#             break
#         fo.write(l)
#         continue
#     feature_vector = l.replace("(", "").replace(")", "").split(',')
#
#     if feature_vector[label_index] == "1" and random.random() <= pos_ratio:
#         pos_count += 1
#         fo.write(l)
#     elif feature_vector[label_index] == "0" and random.random() <= neg_ratio:
#         neg_count += 1
#         fo.write(l)
# fo.close()
# print "pos_count  neg_count  pos_count/neg_count"
# print pos_count, neg_count, float(pos_count)/neg_count

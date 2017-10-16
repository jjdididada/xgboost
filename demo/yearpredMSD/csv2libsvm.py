#!/usr/bin/python
import sys
import numpy
from random import randint

if len(sys.argv) < 5:
    print 'Usage: <csv> <blacklist> <libsvm> <feat_map> <is_dcg_label>'
    print 'convert a csv to libsvm, features in blacklist are not included'

fo = open(sys.argv[3].strip(), 'w')
fo1 = open(sys.argv[4].strip(), 'w')
if len(sys.argv) > 5:
    fo2 = open(sys.argv[5].strip(), 'w')
m_features = [line.strip().lower() for line in open(sys.argv[2].strip(), 'r')]
is_header = 1
label_index = -1
feature_indexs = []
feature_names = []
index_in_page = -1
index_in_parent = -1
is_dcg_label = 0
if len(sys.argv) > 5:
    is_dcg_label = float(sys.argv[6])
print is_dcg_label
for l in open(sys.argv[1].strip()):
    if is_header == 1:
        feature_names = l.lower().replace("(", "").replace(")", "").strip().split(',')
        is_header = 0
        label_index = feature_names.index("label")
        if label_index == -1:
            print "no label column"
            break
        if "m_index_in_page" in feature_names:
            del(feature_names[feature_names.index("m_index_in_page")])
        if "m_index_in_parent" in feature_names:
            del(feature_names[feature_names.index("m_index_in_parent")])

        for i in xrange(len(feature_names)):
            if feature_names[i] not in m_features and not feature_names[i].startswith("m_") and not feature_names[i].startswith("max_"):
                fo1.write("%d	%s	q\n" % (i, feature_names[i]))
                feature_indexs.append(i)
            else:
                if feature_names[i].startswith("m_"):
                    feature_names[i] = feature_names[i][2:]
                fo1.write("%d	m_%s	q\n" % (i, feature_names[i]))
        continue

    feature_vector = l.replace("(", "").replace(")", "").split(',')

    dcg_label = 0
    if is_dcg_label == 1:
        float_label = float(feature_vector[label_index])
        if float_label >= 0.7:
            dcg_label = 3
        elif float_label >= 0.3:
            dcg_label = 2
        elif float_label > 0:
            dcg_label = 1
        fo.write('%s' % str(dcg_label))
    else:
        fo.write('%s' % feature_vector[label_index])

    if len(sys.argv) > 5:
        fo2.write(feature_vector[1] + "\t" + feature_vector[0] + "\t" + str(dcg_label) + "\n")
    if index_in_page != -1:
        del (feature_vector[index_in_page])
    if index_in_parent != -1:
        del (feature_vector[index_in_parent])
    # the features start with m_ are not added to the libsvm for training.
    for i in xrange(len(feature_vector)):
        if i in feature_indexs and len(feature_vector[i]) > 0 and feature_vector[i].lower() != "null":
            fo.write(' %d:%s' % (i, round(float(feature_vector[i]), 4)))
    fo.write("\n")
fo.close()

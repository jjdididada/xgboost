#!/bin/bash

#awk 'NR<2{print $0;next}{print $0| "sort -t, -k3,3"}' "/Users/caojiaohua/Downloads/member1507542902687" > "/Users/caojiaohua/Downloads/sorted_member.txt"
#python mknfold_ordered.py "/Users/caojiaohua/Downloads/sorted_member.txt" 10 query_id
#python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/sorted_member.txt.train" "../data/feature_blacklist1.txt" "../data/lambda_member.txt.train" "../data/search_featuremap.txt" "../data/lambda_member.txt.train.queryLabel" 1
#python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/sorted_member.txt.test" "../data/feature_blacklist1.txt" "../data/lambda_member.txt.test" "../data/search_featuremap.txt" "../data/lambda_member.txt.test.queryLabel" 1
#awk -F',' 'NR>1{print $3}' "/Users/caojiaohua/Downloads/sorted_member.txt.train" | sort | uniq -c | awk '{print $1}' > "../data/lambda_member.txt.train.group"
#awk -F',' 'NR>1{print $3}' "/Users/caojiaohua/Downloads/sorted_member.txt.test" | sort | uniq -c | awk '{print $1}' > "../data/lambda_member.txt.test.group"
rm -r models/auc
mkdir models/auc
../../xgboost pair.member.mushroom.conf
../../xgboost pair.member.mushroom.conf task=dump fmap=../data/search_featuremap.txt model_in=models/auc/0018.model
java -jar ~/src/my/jpmml-xgboost-master/target/converter-executable-1.1-SNAPSHOT.jar --model-input /Users/caojiaohua/xgboost/demo/binary_classification/models/auc/0018.model --fmap-input /Users/caojiaohua/xgboost/demo/data/search_featuremap.txt --target-name mpg --pmml-output lambda_rank_xgboost_20170930_member.pmml
cp lambda_rank_xgboost_20170930_member.pmml /Users/caojiaohua/src/my/search-query-segment/resources



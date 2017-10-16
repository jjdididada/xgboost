#!/bin/bash

python ../yearpredMSD/merge_traindata.py "/Users/caojiaohua/Downloads/article1506588666504" "/Users/caojiaohua/Downloads/answer1506588749793" "/Users/caojiaohua/Downloads/answer_article_merged_lambda"
awk 'NR<2{print $0;next}{print $0| "sort -t, -k4,4"}' "/Users/caojiaohua/Downloads/answer_article_merged_lambda" > "/Users/caojiaohua/Downloads/sorted_content.txt"
python mknfold_ordered.py "/Users/caojiaohua/Downloads/sorted_content.txt" 4 query
python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/sorted_content.txt.train" "../data/feature_blacklist1.txt" "../data/lambda_traindata.txt.train" "../data/search_featuremap.txt" "../data/lambda_traindata.txt.train.queryLabel" 1
python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/sorted_content.txt.test" "../data/feature_blacklist1.txt" "../data/lambda_traindata.txt.test" "../data/search_featuremap.txt" "../data/lambda_traindata.txt.test.queryLabel" 1
awk -F',' 'NR>1{print $2}' "/Users/caojiaohua/Downloads/sorted_content.txt.train" | sort | uniq -c | awk '{print $1}' > "../data/lambda_traindata.txt.train.group"
awk -F',' 'NR>1{print $2}' "/Users/caojiaohua/Downloads/sorted_content.txt.test" | sort | uniq -c | awk '{print $1}' > "../data/lambda_traindata.txt.test.group"
rm -r models/auc
mkdir models/auc
../../xgboost pair.mushroom.conf
../../xgboost pair.mushroom.conf task=dump fmap=../data/search_featuremap.txt model_in=models/auc/0015.model
java -jar ~/src/my/jpmml-xgboost-master/target/converter-executable-1.1-SNAPSHOT.jar --model-input /Users/caojiaohua/xgboost/demo/binary_classification/models/auc/0015.model --fmap-input /Users/caojiaohua/xgboost/demo/data/search_featuremap.txt --target-name mpg --pmml-output lambda_rank_xgboost_20170928_content.pmml



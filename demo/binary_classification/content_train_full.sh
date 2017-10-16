#!/bin/bash

python ../yearpredMSD/merge_traindata.py "/Users/caojiaohua/Downloads/article1503332289943" "/Users/caojiaohua/Downloads/answer1503332628067" "/Users/caojiaohua/Downloads/answer_article_merged_lambda"
awk 'NR<2{print $0;next}{print $0| "sort -t, -k2"}' "/Users/caojiaohua/Downloads/answer_article_merged_lambda" > "/Users/caojiaohua/Downloads/sorted_content1.txt"
python mknfold_ordered.py "/Users/caojiaohua/Downloads/sorted_content1.txt" 4
python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/sorted_content1.txt.train" "../data/feature_blacklist1.txt" "../data/lambda_traindata.txt.train" "../data/search_featuremap.txt"
python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/sorted_content1.txt.test" "../data/feature_blacklist1.txt" "../data/lambda_traindata.txt.test" "../data/search_featuremap.txt" "../data/queryLabel.txt"
awk -F',' 'NR>1{print $2}' "/Users/caojiaohua/Downloads/sorted_content1.txt.train" | sort | uniq -c | awk '{print $1}' > "../data/lambda_traindata.txt.train.group"
awk -F',' 'NR>1{print $2}' "/Users/caojiaohua/Downloads/sorted_content1.txt.test" | sort | uniq -c | awk '{print $1}' > "../data/lambda_traindata.txt.test.group"
rm -r models/auc
mkdir models/auc
../../xgboost lambda.mushroom.conf
../../xgboost lambda.mushroom.conf task=dump fmap=../data/search_featuremap.txt model_in=models/auc/0040.model
java -jar ~/src/my/jpmml-xgboost-master/target/converter-executable-1.1-SNAPSHOT.jar --model-input /Users/caojiaohua/xgboost/demo/binary_classification/models/auc/0040.model --fmap-input /Users/caojiaohua/xgboost/demo/data/search_featuremap.txt --target-name mpg --pmml-output answer_rank_xgboost_20170820_content.pmml



#python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/1502367037972" "../data/feature_blacklist1.txt" "../data/search_traindata.txt" "../data/search_featuremap_live.txt"
#python mknfold.py ../data/search_traindata.txt 1 4
rm -r models/auc
mkdir models/auc
../../xgboost mushroom.conf
../../xgboost mushroom.conf task=dump fmap=../data/search_featuremap_live.txt model_in=models/auc/0227.model
java -jar ~/src/my/jpmml-xgboost-master/target/converter-executable-1.1-SNAPSHOT.jar --model-input /Users/caojiaohua/xgboost/demo/binary_classification/models/auc/0227.model --fmap-input /Users/caojiaohua/xgboost/demo/data/search_featuremap_live.txt --target-name mpg --pmml-output integrated_rank_model_xgboost_20170705_live.pmml
cp models/auc/0227.model integrated_rank_live.model


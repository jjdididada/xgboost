python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/1496749578920.balance" "../data/feature_blacklist1.txt" "../data/search_traindata.txt" "../data/search_featuremap.txt"
python mknfold.py ../data/search_traindata.txt 1 4
rm -r models/auc
mkdir models/auc
../../xgboost mushroom.conf
../../xgboost mushroom.conf task=dump fmap=../data/search_featuremap.txt model_in=models/auc/0014.model
java -jar ~/src/my/jpmml-xgboost-master/target/converter-executable-1.1-SNAPSHOT.jar --model-input /Users/caojiaohua/xgboost/demo/binary_classification/models/auc/0014.model --fmap-input /Users/caojiaohua/xgboost/demo/data/search_featuremap.txt --target-name mpg --pmml-output answer_rank_xgboost_20170605_article.pmml
cp answer_rank_xgboost_20170605_article.pmml /Users/caojiaohua/src/my/virgo/plugins/function-score/src/main/resources/dev/models



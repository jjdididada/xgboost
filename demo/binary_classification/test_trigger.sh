python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/query_member.txt.features" "../data/feature_blacklist1.txt" "../data/search_traindata.txt" "../data/search_featuremap.txt" "../data/query_member.txt"
../../xgboost predict/predict_member.mushroom.conf
python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/query_topic.txt.features" "../data/feature_blacklist1.txt" "../data/search_traindata.txt" "../data/search_featuremap.txt" "../data/query_topic.txt"
../../xgboost predict/predict_topic.mushroom.conf
python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/query_column.txt.features" "../data/feature_blacklist1.txt" "../data/search_traindata.txt" "../data/search_featuremap.txt" "../data/query_column.txt"
../../xgboost predict/predict_column.mushroom.conf
python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/query_live.txt.features" "../data/feature_blacklist1.txt" "../data/search_traindata.txt" "../data/search_featuremap.txt" "../data/query_live.txt"
../../xgboost predict/predict_live.mushroom.conf
python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/query_publication.txt.features" "../data/feature_blacklist1.txt" "../data/search_traindata.txt" "../data/search_featuremap.txt" "../data/query_publication.txt"
../../xgboost predict/predict_publication.mushroom.conf


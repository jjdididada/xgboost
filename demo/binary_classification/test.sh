python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/member_integrate_test.txt" "../data/feature_blacklist1.txt" "../data/search_traindata.txt" "../data/search_featuremap.txt" "../data/query_member.txt"
../../xgboost predict/integrate_predict_member.mushroom.conf
python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/topic_integrate_test.txt" "../data/feature_blacklist1.txt" "../data/search_traindata.txt" "../data/search_featuremap.txt" "../data/query_topic.txt"
../../xgboost predict/integrate_predict_topic.mushroom.conf
python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/column_integrate_test.txt" "../data/feature_blacklist1.txt" "../data/search_traindata.txt" "../data/search_featuremap.txt" "../data/query_column.txt"
../../xgboost predict/integrate_predict_column.mushroom.conf
python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/live_integrate_test.txt" "../data/feature_blacklist1.txt" "../data/search_traindata.txt" "../data/search_featuremap.txt" "../data/query_live.txt"
../../xgboost predict/integrate_predict_live.mushroom.conf
python ../yearpredMSD/csv2libsvm.py "/Users/caojiaohua/Downloads/publication_integrate_test.txt" "../data/feature_blacklist1.txt" "../data/search_traindata.txt" "../data/search_featuremap.txt" "../data/query_publication.txt"
../../xgboost predict/integrate_predict_publication.mushroom.conf


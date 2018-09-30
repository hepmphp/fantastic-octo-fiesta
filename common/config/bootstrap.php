<?php
Yii::setAlias('@common', dirname(__DIR__));
Yii::setAlias('@frontend', dirname(dirname(__DIR__)) . '/frontend');
Yii::setAlias('@backend', dirname(dirname(__DIR__)) . '/backend');
Yii::setAlias('@console', dirname(dirname(__DIR__)) . '/console');
Yii::setAlias('@api', dirname(dirname(__DIR__)) . '/api');
//日志
Yii::setAlias('@data_log', dirname(dirname(dirname(__DIR__))) . '/ad_log');
Yii::setAlias('@data_upload', dirname(dirname(dirname(__DIR__))) . '/data_upload');  # 用户上传数据,后台上传的也在此目录下右
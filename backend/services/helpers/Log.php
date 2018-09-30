<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Administrator
 * Date: 18-1-9
 * Time: 上午11:47
 * To change this template use File | Settings | File Templates.
 */

namespace backend\services\helpers;
use Yii;

/***
 * $log_filename = sprintf("%s.%s.%s",__CLASS__,__FUNCTION__,'pay.log');
 * 业务日志
 * Class Log
 * @package backend\services
 */
class Log {
    /***
        error：相应的消息通过 Yii::error() 被记录。
        warning：相应的消息通过 Yii::warning() 被记录。
        info：相应的消息通过 Yii::info() 被记录。
        trace：相应的消息通过 Yii::trace() 被记录。
        profile：相应的消息通过 Yii::beginProfile() 和 Yii::endProfile() 被记录
     */
    public static function error($message,$filename,$type='common'){
        self::write($message,$filename,$type,'error');
    }

    public static function warning($message,$filename,$type='common'){
        self::write($message,$filename,$type,'warning');
    }

    public static function info($message,$filename,$type='common'){
        self::write($message,$filename,$type,'info');
    }

    public static function trace($message,$filename,$type='common'){
        self::write($message,$filename,$type,'trace');
    }

    public static function profile($message,$filename,$type='common'){
        self::write($message,$filename,$type,'profile');
    }


    /***
     *
     * @param $message  消息
     * @param $filename 文件
     * @param $type     日志类型 common普通日志 pay支付日志  login登录日志 user用户日志 等等
     */
    public static function  write($message,$filename,$type='common',$cate='info'){
        $log_dir = "%s/%s/%s";//日志路径 日志类型 年 月 日
        $dir = sprintf($log_dir, Yii::getAlias('@data_log').'/admin/',$type,date('Y/m/d/'));
        if(!is_dir($dir)){
            mkdir($dir,0755,true);
        }
        $log_file = $dir.$cate.'.'.$filename;
        $message = date("Y-m-d H:i:s")."\t".$message.PHP_EOL;
        $res = file_put_contents($log_file, $message, FILE_APPEND | LOCK_EX);
        return $res;
     }

}
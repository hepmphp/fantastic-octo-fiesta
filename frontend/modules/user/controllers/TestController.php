<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ok_fish
 * Date: 18-6-20
 * Time: 上午9:27
 * To change this template use File | Settings | File Templates.
 */

namespace frontend\modules\user\controllers;

use yii\web\Controller;
use Yii;
class TestController extends Controller{


    public function actionIndex(){

    }

    public function actionRedis(){
        //yii\redis\Connectio
        $redis = \Yii::$app->redis;
        var_dump($redis->set("bbbb",1));
        var_dump($redis->get("bbbb"));
        var_dump($redis->hmset("h_stat",'a',1,'b',2,'c',3,'d','4','f',5));
        var_dump($redis->hmget("h_stat",'a','b','c','d','f'));
    }

    /**
     * 邮件
     */
    public function actionMail(){
        $mailer = Yii::$app->mailer;
        $mailer->useFileTransport  =  false;
        $res = $mailer->compose()->setFrom('shrun@qq.com')
                                  ->setTo('306863208@qq.com')
                                  ->setSubject('邮箱验证')
                                  ->setTextBody("消息测试")
                                  ->send();
        var_dump($res);
    }

    /***
     * 邮件日志报错
     */
    public function actionMaillog(){
        Yii::error("支付报错错误消息\n");
    }

}
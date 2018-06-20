<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ok_fish
 * Date: 18-6-20
 * Time: 上午10:47
 * To change this template use File | Settings | File Templates.
 */
namespace console\controllers;
class HelloController extends \yii\console\Controller{
    //php yii hello/world 执行命令
    public function actionWorld(){
        var_dump($_SERVER);
    }

}
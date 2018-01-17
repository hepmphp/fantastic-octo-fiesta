<?php
namespace api\modules\v2;

class Module extends \yii\base\Module
{
    public $controllerNamespace = 'api\modules\v2\controllers';

    public function init()
    {
        parent::init();
        //由于RESTful遵循的是无状态可将用户session关闭
        \Yii::$app->user->enableSession = false;
        //关闭登录失败跳转
        \Yii::$app->user->loginUrl = null;
    }
}

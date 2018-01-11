<?php

namespace backend\modules\api\controllers;

use yii\web\Controller;

/**
 * Default controller for the `api` module
 */
class CaptchaController extends Controller
{
    public $layout = false;
    public function actions(){
        return [
            'captchatest' => [
                'class' => 'yii\captcha\CaptchaAction',
                'maxLength' => 4, //生成的验证码最大长度
                'minLength' => 4  //生成的验证码最短长度
            ]
        ];
    }
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }



}

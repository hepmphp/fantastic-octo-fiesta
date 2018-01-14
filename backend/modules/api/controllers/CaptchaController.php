<?php

namespace backend\modules\api\controllers;

use yii\web\Controller;
use Gregwar\Captcha\CaptchaBuilder;
use Yii;

/**
 * Default controller for the `api` module
 */
class CaptchaController extends Controller
{
    public $layout = false;

    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        $builder = new CaptchaBuilder;
        $builder->build();
        $sesson = Yii::$app->session;
        $sesson['phrase'] = $builder->getPhrase();
        header('Content-type: image/jpeg');
        $builder->output();

        //return $this->render('index');
    }



}

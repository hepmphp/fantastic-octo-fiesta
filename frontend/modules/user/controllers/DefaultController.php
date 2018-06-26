<?php

namespace frontend\modules\user\controllers;

use yii\web\Controller;
use Yii;

/**
 * Default controller for the `user` module
 */
class DefaultController extends Controller
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        \Yii::trace("hello");
        Yii::trace('start calculating average revenue', __METHOD__);

        return $this->render('index');

    }
}

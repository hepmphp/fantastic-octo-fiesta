<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ok_fish
 * Date: 18-1-17
 * Time: 上午10:05
 * To change this template use File | Settings | File Templates.
 */

namespace frontend\controllers;
use yii\rest\ActiveController;

class UserControler extends ActiveController{
    public $modelClass = 'fronted\models\User';

}
<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ok_fish
 * Date: 18-1-18
 * Time: 下午2:44
 * To change this template use File | Settings | File Templates.
 */
namespace api\controllers;
use yii\rest\ActiveController;
use Yii;
use api\models\User;
use api\models\LoginForm;
class UserController extends ActiveController{
    public $modelClass = 'api\models\User';

    public function actionDebug(){
       // echo "<pre>";
      //  print_r(Yii::$app->params['user.apiTokenKey']);
        return "debug";
    }

    public function actionReg(){
        $username = Yii::$app->request->post('username','test');
        $password = Yii::$app->request->post('password','123456');
        $user = new User();
        $user->generateAuthKey();
        $user->username = $username;
        $user->setPassword($password);
        $user->save(false);
        return ['code'=>0];
    }

    public function actionLogin(){
        $model = new LoginForm;
        $model->setAttributes(Yii::$app->request->post());
        if($user = $model->login()){
            return ['access_token'=>$user->access_token];
        }else{
            return $model->errors;
        }
    }

    //获取用户信息
    public function actionInfo()
    {
        $user = $this->authenticate(Yii::$app->user, Yii::$app->request, Yii::$app->response);
        return $user;
    }

}

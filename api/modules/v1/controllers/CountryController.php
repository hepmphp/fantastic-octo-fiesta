<?php

namespace api\modules\v1\controllers;


use api\controllers\ApiController;
use api\modules\v1\models\Country;
use yii\filters\auth\HttpBearerAuth;
/**
 * Country Controller API
 *
 * @author Budi Irawan <deerawan@gmail.com>
 *
 *
    - GET /countries: list all countries
    - HEAD /countries: show the overview information of country listing
    - POST /countries: create a new country
    - GET /countries/AU: return the details of the country AU
    - HEAD /countries/AU: show the overview information of country AU
    - PATCH /countries/AU: update the country AU
    - PUT /countries/AU: update the country AU
    - DELETE /countries/AU: delete the country AU
    - OPTIONS /countries: show the supported verbs regarding endpoint /countries
    - OPTIONS /countries/AU: show the supported verbs regarding endpoint /countries/AU.
 *
 */
class CountryController extends ApiController
{
    public $modelClass = 'api\modules\v1\models\Country';//关联的模型
    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'items',
    ];

    public function behaviors()
    {
        $behaviors = parent::behaviors();
        $behaviors['authenticator'] = [
            'class'=>HttpBearerAuth::className(),
            'optional'=>[
                'login',//登录接口排除
                'reg'//注册用户排除
            ],
        ];
        #定义返回格式是：JSON
       // $behaviors['contentNegotiator']['formats']['text/html'] = Response::FORMAT_JSON;
        return $behaviors;
    }

    public function actions(){
        $actions = parent::actions();
        return $actions;
    }

    public function actionSearch($name){
        $one = Country::findOne(['name'=>$name]);
        return $one;
    }

    public function afterAction($action,$result){
    //    $result['status'] = 0;
       // $result['status'] = 0;
        return parent::afterAction($action,$result);
    }


}



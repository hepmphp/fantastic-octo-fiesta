<?php

namespace api\modules\v1\controllers;


use api\controllers\ApiController;
use api\controllers\ApiTokenValidateController;
use api\modules\v1\models\Country;
use yii\filters\auth\HttpBearerAuth;
use api\services\HttpAccessTokenAuth;
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
class CountryController extends ApiTokenValidateController
{
    public $modelClass = 'api\modules\v1\models\Country';//关联的模型
    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'items',
    ];

//    public function behaviors()
//    {
//        $behaviors = parent::behaviors();
//        $behaviors['authenticator'] = [
//            'class'=>HttpBearerAuth::className(),
//            'optional'=>[
//                'login',//登录接口排除
//                'reg'//注册用户排除
//            ],
//        ];
//        #定义返回格式是：JSON
//       // $behaviors['contentNegotiator']['formats']['text/html'] = Response::FORMAT_JSON;
//        return $behaviors;
//    }

    public function actions(){
        $actions = parent::actions();
        return $actions;
    }

    /**
     *
     * @api {get} /v1/country/search 城市搜索
     * @apiName GetUser
     * @apiGroup Country
     *
     * @apiParam {Number} id Users unique ID.
     *
     * @apiSuccess {String} firstname Firstname of the User.
     * @apiSuccess {String} lastname  Lastname of the User.
     */
    public function actionSearch($name){
        $one = Country::findOne(['name'=>$name]);
        return $one;
    }

    /**
     * @api {get} /v1/country/order 下订单
     * @apiName GetOrder
     * @apiGroup Order
     * @apiParam {json} user  {user_id:1,username:123456,account:1}
     * @apiParam {json} goods {good_id:1,goods_name:"商品名称"}
     *
     * @apiSuccess {json} data {status:0,"msg":"",data:""}
     * @return array
     */
    public function actionOrder(){

        return ['status'=>0,'msg'=>'','data'=>['id'=>1]];
    }

    public function afterAction($action,$result){
    //    $result['status'] = 0;
       // $result['status'] = 0;
        return parent::afterAction($action,$result);
    }


}



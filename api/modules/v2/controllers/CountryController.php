<?php

namespace api\modules\v2\controllers;

use api\controllers\ApiController;
use api\modules\v1\models\Country;
/**
 * Country Controller API
 *
 * @author Budi Irawan <deerawan@gmail.com>
 *
 *   - GET /countries: list all countries
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
    public $modelClass = 'api\modules\v2\models\Country';
    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'items',
    ];

    public function behaviors()
    {
        $behaviors = parent::behaviors();
        #定义返回格式是：JSON
       // $behaviors['contentNegotiator']['formats']['text/html'] = Response::FORMAT_JSON;
        return $behaviors;
    }
    public function actionSearch($name){
        $one = Country::findOne(['name'=>$name]);
        return array('status'=>0,'msg'=>'','data'=>$one);
    }

    public function afterAction($action,$result){
        //$result['status'] = 0;
        return parent::afterAction($action,$result);
    }


}



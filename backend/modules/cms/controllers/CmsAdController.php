<?php

namespace backend\modules\cms\controllers;

use Yii;
use backend\modules\cms\models\CmsAd;
use yii\filters\VerbFilter;
use yii\data\Pagination;
use backend\controllers\BaseController;
use yii\helpers\ArrayHelper;


class CmsAdController extends BaseController
{
    public function init(){
        $this->model = new CmsAd();
    }
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }


    /**
     * 搜索条件
     */
    public function get_search_where(){
        $where = array();
        $and_where = array();
        if(Yii::$app->request->get('search')){
            
            $block_id = Yii::$app->request->get('block_id');
            if($block_id){
               $where['block_id'] = $block_id;
            }
            
             $title = Yii::$app->request->get('title');
              if($title){
                  $and_where[] = ['like','title',$title];
              }


        }
        // $id = Yii::$app->request->get('id');
        // if($id){
        //    $where['id'] = $id;
       // }
        //文本搜索
        //like搜索 $and_where[] = ['like','name',$name];
        //时间搜索 $and_where[] = ['>=','begin_time',$begin_time];
        //时间搜索 $and_where[] = ['<','end_time',$end_time];
        //   $where[] = ['like', 'name', $name];
        return array($where,$and_where);
    }

    /**
     * Lists all CmsAd models.
     * @return mixed
     */
    public function actionIndex()
    {
        list($where,$and_where) = $this->get_search_where();
        $query = CmsAd::find()->where($where);
        if(!empty($and_where)){
            foreach($and_where as $aw){
                $query->andWhere($aw);
            }
        }
        $model_ar =   $query->asArray();
        $page = new Pagination([
            'defaultPageSize' => 20,
            'totalCount' => $model_ar->count(),
        ]);
        $data = $model_ar->orderBy('id ASC')->offset($page->offset)->limit($page->limit)->all();
        if($_GET['debug']){
            echo "<pre>";
            print_r($data);
            print_r($page);
        }
        return $this->render('index', [
            'page' => $page,
            'data'=>$data,
            'config_status' =>CmsAd::getConfigStatus(),
            'config_is_mobile'=>CmsAd::getConfigisMobile(),
        ]);
    }


    public function actionView($id)
    {
        return $this->render('view', [
            'model' => CmsAd::findOne($id),
            'config_status' =>CmsAd::getConfigStatus(),
            'config_is_mobile'=>CmsAd::getConfigisMobile(),
        ]);
    }

    public function actionCreate()
    {
        if(Yii::$app->request->isPost){
            return $this->commonCreate($this->model);
        }else{
            return $this->render('create',[
                'config_status' =>CmsAd::getConfigStatus(),
                'config_is_mobile'=>CmsAd::getConfigisMobile(),
            ]);
        }
    }

    public function actionUpdate()
    {
        $model = CmsAd::findOne(Yii::$app->request->get('id'));
        if(Yii::$app->request->isPost){//Yii::$app->request->isPost
            return $this->commonUpdate($model);//更新
        }else{
            return $this->render('create',[
                'form'=>$model->attributes,//表单参数
                'config_status' =>CmsAd::getConfigStatus(),
                'config_is_mobile'=>CmsAd::getConfigisMobile(),
            ]);
        }
    }
    public function actionDelete()
    {
        return $this->commonDelete($this->model);
    }





}

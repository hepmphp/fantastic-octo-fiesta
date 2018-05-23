<?php

namespace backend\modules\cms\controllers;

use Yii;
use backend\modules\cms\models\CmsTag;
use yii\filters\VerbFilter;
use yii\data\Pagination;
use backend\controllers\BaseController;


class CmsTagController extends BaseController
{
    public function init(){
        $this->model = new CmsTag();
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
            
            $name = Yii::$app->request->get('name');
            if($name){
               $where['name'] = $name;
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
     * Lists all CmsTag models.
     * @return mixed
     */
    public function actionIndex()
    {
        list($where,$and_where) = $this->get_search_where();
        $query = CmsTag::find()->where($where);
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


        ]);
    }


    public function actionView($id)
    {
        return $this->render('view', [
            'model' => CmsTag::findOne($id),


        ]);
    }

    public function actionCreate()
    {
        if(Yii::$app->request->isPost){
            return $this->commonCreate($this->model);
        }else{
            return $this->render('create',[


            ]);
        }
    }

    public function actionUpdate()
    {
        $model = CmsTag::findOne(Yii::$app->request->get('id'));
        if(Yii::$app->request->isPost){//Yii::$app->request->isPost
            return $this->commonUpdate($model);//更新
        }else{
            return $this->render('create',[
                'form'=>$model->attributes,//表单参数


            ]);
        }
    }
    public function actionDelete()
    {
        return $this->commonDelete($this->model);
    }





}

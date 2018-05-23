<?php

namespace backend\modules\cms\controllers;

use Yii;
use yii\filters\VerbFilter;
use yii\data\Pagination;
use backend\controllers\BaseController;
use backend\modules\cms\models\CmsArticle;
use backend\modules\cms\models\CmsArticleCategory;
class CmsArticleController extends BaseController
{
    public function init(){
        $this->model = new CmsArticle();
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
            
            $cate_id = Yii::$app->request->get('cate_id');
            if($cate_id){
               $where['cate_id'] = $cate_id;
            }
            
            $tag_ids = Yii::$app->request->get('tag_ids');
            if($tag_ids){
               $where['tag_ids'] = $tag_ids;
            }
            
             $title = Yii::$app->request->get('title');
              if($title){
                  $and_where[] = ['like','title',$title];
              }

             $content = Yii::$app->request->get('content');
              if($content){
                  $and_where[] = ['like','content',$content];
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
     * Lists all CmsArticle models.
     * @return mixed
     */
    public function actionIndex()
    {
        list($where,$and_where) = $this->get_search_where();
        $query = CmsArticle::find()->where($where);
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
            'config_is_top'=>CmsArticle::get_config_is_top(),
            'config_status'=>CmsArticle::get_config_status(),

        ]);
    }


    public function actionView($id)
    {
        return $this->render('view', [
            'model' => CmsArticle::findOne($id),
            'config_is_top'=>CmsArticle::get_config_is_top(),
            'config_status'=>CmsArticle::get_config_status(),

        ]);
    }

    public function actionCreate()
    {
        if(Yii::$app->request->isPost){
            return $this->commonCreate($this->model);
        }else{
            return $this->render('create',[
				'config_is_top'=>CmsArticle::get_config_is_top(),
                'config_status'=>CmsArticle::get_config_status(),
                'select_tree'=>CmsArticleCategory::get_config_menu()

            ]);
        }
    }

    public function actionUpdate()
    {
        $model = CmsArticle::findOne(Yii::$app->request->get('id'));
        if(Yii::$app->request->isPost){//Yii::$app->request->isPost
            return $this->commonUpdate($model);//更新
        }else{
            return $this->render('create',[
                'form'=>$model->attributes,//表单参数
				'config_is_top'=>CmsArticle::get_config_is_top(),
				'config_status'=>CmsArticle::get_config_status(),
                'select_tree'=>CmsArticleCategory::get_config_menu($model->cate_id)
            ]);
        }
    }
    public function actionDelete()
    {
        return $this->commonLogicDelete($this->model);
    }





}

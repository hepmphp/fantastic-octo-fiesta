<?php

namespace backend\modules\cms\controllers;

use Yii;


use backend\modules\cms\models\CmsAttachCate;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\Pagination;
use backend\controllers\BaseController;

/**
 * GaAdminGroupController implements the CRUD actions for GaAdminGroup model.
 */
class AttachCateController extends BaseController
{
    public $model = null;

    public function init(){
        $this->model = new CmsAttachCate();
    }

    /**
     * 搜索条件
     */
    public function get_search_where(){
        $where = array();
        if(Yii::$app->request->get('search')){
            $id = Yii::$app->request->get('id');
            if($id){
                $where['id'] = $id;
            }
            $name = Yii::$app->request->get('name');
            if($name){
                $where['name'] = $name;
            }
        }
        return $where;
    }

    /**
     * Lists all GaAdminGroup models.
     * @return mixed
     */
    public function actionIndex()
    {
        $where = $this->get_search_where();
        $model_ar = CmsAttachCate::find()->where($where)->asArray();
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

    /**
     * Displays a single GaAdminGroup model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new GaAdminGroup model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if(Yii::$app->request->isPost){
            $model = new CmsAttachCate();
            return $this->commonCreate($model);
        }else{
            return $this->render('create',[]);
        }
    }

    /**
     * Updates an existing GaAdminGroup model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate()
    {
        if(Yii::$app->request->isPost){//Yii::$app->request->isPost
            return $this->commonUpdate();//更新
        }else{
            $model = $this->findModel(Yii::$app->request->get('id'));
            return $this->render('create',[
                'form'=>$model->attributes,//表单参数

            ]);
        }
    }



    /**
     * Deletes an existing GaAdminGroup model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete()
    {
        return $this->commonDelete();
    }


    public function actionSearch(){
        $keywords = Yii::$app->request->get('term');
        $cate_names = $this->model->getAutoCompeleteSearch($keywords);
        if($cate_names){
            $response = array(
                'status'=>0,
                'data'=>$cate_names,
            );
         }else{
            $response = array(
                'status'=>-1,
                'data'=>'',
            );
          }
        $this->asJson($response);
    }
    /**
     * Finds the GaAdminGroup model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return GaAdminGroup the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    public  function findModel($id)
    {
        if (($model = CmsAttachCate::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }


}
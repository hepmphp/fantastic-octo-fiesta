<?php

namespace backend\modules\cms\controllers;

use Yii;
use backend\modules\cms\models\CmsAttach;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\Pagination;
use backend\controllers\BaseController;
use yii\helpers\ArrayHelper;
use  backend\modules\cms\models\CmsAttachCate;
/**
 * Default controller for the `cms` module
 */
class AttachController extends BaseController
{
    public function init(){
		parent::init();
        $this->model = new CmsAttach();
    }

    /**
     * 搜索条件
     */
    public function get_search_where(){
        $where = array();
        if(Yii::$app->request->get('search')){
            $cate_id = Yii::$app->request->get('cate_id');
            if($cate_id){
                $where  = sprintf(" FIND_IN_SET(%s,cate_ids) ",$cate_id);
            }
            $name = Yii::$app->request->get('name');
            if($name){
                $and_where[] = ['like','name',$name];
            }
        }
        return array($where,$and_where);
    }

    /**
     * Lists all GaAdminGroup models.
     * @return mixed
     */
    public function actionIndex()
    {
        list($where,$and_where) = $this->get_search_where();
        $query = CmsAttach::find()->where($where);
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
            'config_attach_cate_id'=>CmsAttachCate::get_config_id(),
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
            $model = new CmsAttach();
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
        $model = $this->findModel(Yii::$app->request->get('id'));
        if(Yii::$app->request->isPost){//Yii::$app->request->isPost
            return $this->commonUpdate($model);//更新
        }else{
            return $this->render('create',[
                'form'=>$model->attributes,//表单参数

            ]);
        }
    }


    public function actionUpdatetag(){
        if(Yii::$app->request->isPost){
            $ids = Yii::$app->request->post("attach_ids");
            $tag_names = Yii::$app->request->post("tag_names");
            $cate_ids =  (new \yii\db\Query())
                        ->select(['id', 'name'])
                        ->from('cms_attach_cate')
                        ->where(['in','name',$tag_names])
                        ->limit(10)
                        ->all();
            $cate_ids =ArrayHelper::getColumn($cate_ids,'id');
//            var_dump($tag_names);
            $res = Yii::$app->db->createCommand()->update('cms_attach',['cate_ids'=>implode(',',$cate_ids)],['in','id',$ids])->execute();
          //  echo    Yii::$app->db->createCommand()->getRawSql();exit();
            if ($res) {
                $response = array(
                    'status'=>0,
                    'msg'=>Yii::t('app','update_success'),
                    'data'=>array(),
                );
            }else{

                $response = array(
                    'status'=>-1,
                    'msg'=>Yii::t('app','db_error'),
                    'data'=>$model->errors,
                    'last_sql'=>   Yii::$app->db->createCommand()->getSql(),
                );
            }
            $this->asJson($response);
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
        $response = array(
            'status'=>-1,
            'msg'=>Yii::t('app','delete_fail'),
            'data'=>'',
        );
        $ids = Yii::$app->request->post('ids');
        $ids_arr = explode(',',$ids);
        $ids_arr = array_map('intval',$ids_arr);
        if(!empty($ids_arr)){
            $attachs = CmsAttach::find()->where(['in','id',$ids_arr])->all();
         //   var_dump($attachs);exit();
            foreach($attachs as $attch){
                if(file_exists($attch['file'])){
                    unlink($attch['file']);
                }
              
            }
            $res = CmsAttach::deleteAll(['in','id',$ids_arr]);
            if($res){
                $response =array(
                    'status'=>0,
                    'msg'=>Yii::t('app','delete_success'),
                    'data'=>'',
                );
            }
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
        if (($model = CmsAttach::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

}

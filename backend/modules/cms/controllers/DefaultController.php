<?php

namespace backend\modules\cms\controllers;

use Yii;
use backend\modules\cms\models\CmsAttach;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\Pagination;
use backend\controllers\BaseController;
use yii\helpers\ArrayHelper;
/**
 * Default controller for the `cms` module
 */
class DefaultController extends BaseController
{
    public function init(){
        $this->model = new CmsAttach();
    }

    /**
     * 搜索条件
     */
    public function get_search_where(){
        $where = array();
        if(Yii::$app->request->get('search')){
            $name = Yii::$app->request->get('name');
            if($name){
                //['like', 'title', $search]
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
        $model_ar = CmsAttach::find()->where($where)->asArray();
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
        if(Yii::$app->request->isPost){//Yii::$app->request->isPost
            return $this->commonUpdate();//更新
        }else{
            $model = $this->findModel(Yii::$app->request->get('id'));
            return $this->render('create',[
                'form'=>$model->attributes,//表单参数

            ]);
        }
    }


    public function actionUpdatetag(){
        if(Yii::$app->request->isPost){
            $ids = Yii::$app->request->post("attach_ids");
            $tag_names = Yii::$app->request->post("tag_names");
            $tag_ids =  (new \yii\db\Query())
                        ->select(['id', 'name'])
                        ->from('cms_attach_cate')
                        ->where(['in','name',$tag_names])
                        ->limit(10)
                        ->all();
            $tag_ids =ArrayHelper::getColumn($tag_ids,'id');
//            var_dump($tag_names);
            $res = Yii::$app->db->createCommand()->update('cms_attach',['tag_ids'=>implode(',',$tag_ids)],['in','id',$ids])->execute();
          //  echo    Yii::$app->db->createCommand()->getSql();exit();
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
                    'last_sql'=>   Yii::$app->db->createCommand()-getRawSql(),
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

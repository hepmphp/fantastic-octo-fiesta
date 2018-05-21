<?php

namespace backend\controllers;

use Yii;
use backend\models\GaAdminGroup;
use backend\models\GaAdminUser;
use backend\models\GaAdminMenu;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\Pagination;
use backend\controllers\BaseController;

/**
 * GaAdminGroupController implements the CRUD actions for GaAdminGroup model.
 */
class GaAdminGroupController extends BaseController
{
    public $model = null;

    public function init(){
        $this->model = new GaAdminGroup();
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
            $id = Yii::$app->request->get('id');
            if($id){
                $where['id'] = $id;
            }
            $name = Yii::$app->request->get('name');
            if($name){
                $where['name'] = $name;
            }

        }
        //like搜索 $and_where[] = ['like','name',$name];
        //时间搜索 $and_where[] = ['>=','begin_time',$begin_time];
        //时间搜索 $and_where[] = ['<','end_time',$end_time];
     //   $where[] = ['like', 'name', $name];
        return array($where,$and_where);
    }

    /**
     * Lists all GaAdminGroup models.
     * @return mixed
     */
    public function actionIndex()
    {
        list($where,$and_where) = $this->get_search_where();
        $query = GaAdminGroup::find()->where($where);
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
            $model = new GaAdminGroup();
            $_POST['GaAdminGroup']['mids'] = 'init';
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

    /**
     * Deletes an existing GaAdminGroup model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete()
    {
        return $this->commonDelete($this->model);
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
        if (($model = GaAdminGroup::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    /***
     * 编辑用户权限
     */
    public function actionEditPermission(){

        if(Yii::$app->request->isPost){
            $id = Yii::$app->request->post('id');
            $mids = Yii::$app->request->post('mids');
            sort($mids);
            $permission = array(
                'mids'=>implode(',',$mids)
            );
            //查找用户组
            $admin_group = $this->model->findOne($id);
            $admin_group->mids = $permission['mids'];
            $res = $admin_group->save();
            //更新相关用户的权限
            $admin_user = new GaAdminUser();
            $admin_user->mids = $permission['mids'];
            $res2 = $admin_user->save();
            if($res){
                $response = array(
                    'status'=>0,
                    'msg'=>Yii::t('app','permission_success'),
                    'data'=>'',
                );
            }else{
                $response = array(
                    'status'=>-1,
                    'msg'=>Yii::t('app','permission_fail'),
                    'data'=>'',
                );
            }
            $this->asJson($response);
        }else{
            $id = Yii::$app->request->get('id');
            $admin_group = $this->model->findOne($id);
            $group_mids = explode(',',$admin_group['mids']);
            $group_mids = json_encode($group_mids,true);

            $mAdminMenu = new GaAdminMenu();
            $menu_data = $mAdminMenu->getMenuData(array());
            return $this->renderPartial('edit-permission',[
                    'menu_data'=>json_encode($menu_data,true),
                    'group_mids'=>$group_mids
            ]);
        }
    }

}

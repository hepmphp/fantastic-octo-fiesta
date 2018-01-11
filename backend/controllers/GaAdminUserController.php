<?php

namespace backend\controllers;

use Yii;
use app\models\GaAdminGroup;
use app\models\GaAdminUser;
use app\models\GaPlatform;
use app\models\GaAdminMenu;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\Pagination;
use backend\controllers\BaseController;
use backend\components\exception\LogicException;

/**
 * GaAdminGroupController implements the CRUD actions for GaAdminGroup model.
 */
class GaAdminUserController extends BaseController
{
    public $model = null;

    public function init(){
        $this->model = new GaAdminUser();
    }

    public function actionLog(){
        echo Yii::t('app','create_success');
        throw new LogicException(LogicException::USER_EXEIST,"hello hello world");
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
        if(Yii::$app->request->get('search')){
            $rq = Yii::$app->request;
            $id = $rq->get('id');
            if($id){
                $where['id'] = $id;
            }
            $username = $rq->get('username');
            if($username){
                $where['username'] = $username;
            }
            $platform_id = $rq->get('platform_id');
            if($platform_id){
                $where['platform_id'] = $platform_id;
            }
            $group_id = $rq->get('group_id');
            if($group_id){
                $where['group_id'] = $group_id;
            }

            $status = $rq->get('status');
            if($status){
                $where['status'] = $status;
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
        $model_ar = GaAdminUser::find()->where($where)->asArray();
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
            'config_status'=>$this->model->get_config_status(),
            'config_group_id'=>(new GaAdminGroup)->get_config_group_id(),
            'config_platform_id'=>(new GaPlatform)->get_config_plat_id()
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
            return $this->commonCreate($this->model);
        }else{
            return $this->render('create',[
                'config_status'=>$this->model->get_config_status(),
                'config_group_id'=>(new GaAdminGroup)->get_config_group_id(),
                'config_platform_id'=>(new GaPlatform)->get_config_plat_id()
            ]);
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
                'config_status'=>$this->model->get_config_status(),
                'config_group_id'=>(new GaAdminGroup)->get_config_group_id(),
                'config_platform_id'=>(new GaPlatform)->get_config_plat_id()

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
        return $this->commonLogicDelete();
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
        if (($model = GaAdminUser::findOne($id)) !== null) {
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
            $admin_user = $this->model->findOne($id);
            $admin_user->mids = $permission['mids'];
            $res = $admin_user->save();
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
            $admin_user = $this->model->findOne($id);

            $admin_mids = explode(',',$admin_user['mids']);
            $admin_mids = json_encode($admin_mids,true);

            $mAdminMenu = new GaAdminMenu();
            $menu_data = $mAdminMenu->getMenuData(array());
            $menu_data = json_encode($menu_data,true);
            return $this->renderPartial('edit-permission',[
                'menu_data'=>$menu_data,
                'admin_mids'=>$admin_mids
            ]);
        }
    }

    public function actionEditPassword(){
        if(Yii::$app->request->isPost){
            $password = Yii::$app->request->post('password');
            $admin_user = GaAdminUser::findOne(['id'=>Yii::$app->session['admin_user.id']]);
            $admin_user->password = $password;
            $res = $admin_user->save();
            if($res){
                $response = array(
                    'status'=>0,
                    'msg'=>Yii::t('app','update_success'),
                );
            }else{
                $response = array(
                    'status'=>-1,
                    'msg'=>Yii::t('app','update_fail')
                );
            }
            $this->asJson($response);
        }else{
            return $this->render('edit-password',[]);
        }
    }


}

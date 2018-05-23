<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Administrator
 * Date: 18-1-6
 * Time: 下午12:45
 * To change this template use File | Settings | File Templates.
 */

namespace backend\controllers;
use Yii;
use backend\models\GaAdminMenu;
use yii\web\Controller;
use backend\components\exception\LogicException;


class BaseController extends Controller{

    /***
     *模块名 Yii::$app->controller->module->id;
     *控制器名 Yii::$app->controller->id
     *方法名 Yii::$app->controller->action->id;
     */
    public $layout = 'main_admin.php';

    public $current_menu = null;


    public $model = '';//通用的操作模型
    public function beforeAction($action){
        if(parent::beforeAction($action)){
//            var_dump(Yii::$app->controller->module->id);
//            var_dump(Yii::$app->controller->id);
//            var_dump(Yii::$app->controller->action->id);
            //登录信息和权限检测
            $this->checkLogin();
            if(in_array($action->id,['create','update','delete','edit-password'])){
                $this->layout = 'main_curd.php';//使用curd布局
            }
            if($this->layout && Yii::$app->request->get('iframe')==1){
                $this->layout = 'main_content.php';//详情页
            }
            return true;
        }else{
            return false;
        }
    }

    public function afterAction($action,$result){
//        var_dump(Yii::$app->controller->module->id);
//        var_dump(Yii::$app->controller->id);
//        var_dump(Yii::$app->controller->action->id);
        return parent::afterAction($action,$result);
    }


    /**
     *账号信息和权限检测
     */
    public function checkLogin(){
        $this->ip_check();
        header("Content-type:text/html;charset=utf-8");

        if(Yii::$app->controller->id !='site'&&empty(Yii::$app->session['admin_user.id'])){
            //跳转
            throw new LogicException(LogicException::PAGE_ERROR,'长时间没操作,请重新登录');
           // $this->error('长时间没操作,请重新登录',U('index/login'),5000);
        }else if(Yii::$app->controller->id !='site'){//检测账号是否过期
            if(
                (Yii::$app->session['admin_user.allow_mutil_login']===0) AND
                !empty(Yii::$app->session['admin_user.last_session_id']) AND
                (Yii::$app->session['admin_user.last_session_id']!=session_id())
            ){//用户组做登录限制
                Yii::$app->session->destroy();
                throw new LogicException(LogicException::PAGE_ERROR,'你的账户在其它地方登录,请重新登录');
            }
        }
//        if(Yii::$app->request->get('iframe')==1){
            $this->checkAccess();
//        }
        //Yii::$app->view->
        $top_menu = GaAdminMenu::find()->where(['parentid'=>0,'status'=>0])->orderBy(['listorder'=>SORT_ASC])->asArray()->all();

        $where_left_menu = array(
            'top_menu_id'=>$this->current_menu['top_menu_id'],
            'level'=>1,
        );
        $left_menu = GaAdminMenu::find()->where($where_left_menu)->orderBy(['listorder'=>SORT_ASC])->asArray()->all();


        $menu = array(
            'top_menu'=>$top_menu,
            'left_menu'=>$left_menu
        );
        Yii::$app->cache->set('menu',$menu);
        Yii::$app->cache->set('current_top_menu_id',$this->current_menu['top_menu_id']);//当前菜单id

      //  var_dump(Yii::$app->cache->get('current_top_menu_id'));
      //  var_dump($left_menu);
      //  Yii::$app->cache->get('current_top_menu_id');
      //  echo "<pre>";
      //  print_r(Yii::$app->view->params['menu']);
    }

    /**
     * 菜单权限检测
     * @param bool $read_only
     * @return bool
     */
    public function checkAccess($read_only=false){
        if(Yii::$app->controller->id=='site'){
            return true;
        }
        //requestedRoute
        if(Yii::$app->controller->module->id!='app-backend'){
            $model = Yii::$app->controller->module->id."/".Yii::$app->controller->id;
        }else{
            $model = Yii::$app->controller->id;
        }

        $where_menu = array(
            'model'=>$model,
            'action'=>Yii::$app->controller->action->id,
        );

        $this->current_menu = GaAdminMenu::find()->where($where_menu)->andWhere(['<>','level',0])->limit(1)->asArray()->one();
        if(!in_array($this->current_menu['id'],Yii::$app->session['admin_user.mids']) && Yii::$app->controller->action->id != 'get_search_where'){//搜索条件拼接不做权限检测
               /*
               $response = array(
                    'status'=>-1,
                    'msg'=>Yii::t('app','user_has_no_permission'),
                    'data'=>array(
                        'method'=>Yii::$app->controller->id,
                        'action'=>Yii::$app->controller->action->id,
                        'current_id'=>$current_menu['id'],
                        'mids'=>Yii::$app->session['admin_user.mids'],
                    ),
                );*/
               // throw new LogicException(-1,Yii::t('app','user_has_no_permission'));
        }else{
            return true;
        }
    }

    public function init(){//公用方法初始化
        //根据url参数设置layout


    }

    /**
     * ip检测
     */
    public function ip_check() {
        if(isset($_SERVER['SERVER_ADDR']) && $_SERVER['SERVER_ADDR']!='192.168.71.21'){//本地测试机
            if (!in_array(Yii::$app->request->getUserIP(),array())) {//ip 白名单 抽离到配置中
                //exit('deny ....');
            }
        }
    }

    /***
     *
     * 通用的添加方法
     * @param $model
     * @return \yii\web\Response
     */
    public function commonCreate($model){
        $model->load(Yii::$app->request->post());
        if($model->validate()){
            $res = $model->save();
            if ($res) {
                $response = array(
                    'status'=>0,
                    'msg'=>Yii::t('app','create_success'),
                    'data'=>array(),
                );
            }else{
                // $commandQuery = clone $model;
                $response = array(
                    'status'=>-1,
                    'msg'=>Yii::t('app','db_error'),
                    'data'=>$model->errors,
                    //   'last_sql'=>$commandQuery->find()->createCommand()->getRawSql(),
                );
            }
        }else{
            $response = array(
                'status'=>-2,
                'msg'=>implode("<br/>",$model->firstErrors),
                'data'=>$model->errors,
            );
        }
        return $this->asJson($response);
    }
    /***
     * 通用的更新方法
     * @param $model
     */
    public function commonUpdate($model){
       // $model = $this->findModel(Yii::$app->request->get('id'));
        $model->load(Yii::$app->request->post());
        if($model->validate()){
            $res = $model->save();
            if ($res) {
                $response = array(
                    'status'=>0,
                    'msg'=>Yii::t('app','update_success'),
                    'data'=>array(),
                );
            }else{
                $commandQuery = clone $model;
                $response = array(
                    'status'=>-1,
                    'msg'=>Yii::t('app','db_error'),
                    'data'=>$model->errors,
                    'last_sql'=>$commandQuery->find()->createCommand()->getRawSql(),
                );
            }
        }else{
            $response = array(
                'status'=>-2,
                'msg'=>implode("<br/>",$model->firstErrors),
                'data'=>$model->errors,
            );
        }
        return $this->asJson($response);
    }

    /**
     * 通用的删除方法
     */
    public function commonDelete($model){
        $response = array(
            'status'=>-1,
            'msg'=>Yii::t('app','delete_fail'),
            'data'=>'',
        );
        $ids = Yii::$app->request->post('ids');
        $ids_arr = explode(',',$ids);
        $ids_arr = array_map('intval',$ids_arr);
        if(!empty($ids_arr)){
            //deleteAll
            $where = ['in', 'id', $ids_arr];
            $res = $this->model->deleteAll($where);
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
    /***
     * 通用逻辑删除
     */
    public function commonLogicDelete(){
        $response = array(
            'status'=>-1,
            'msg'=>Yii::t('app','delete_fail'),
            'data'=>'',
        );
        $status = Yii::$app->request->post('status','1');
        $ids = Yii::$app->request->post('ids');
        $ids_arr = explode(',',$ids);
        $ids_arr = array_map('intval',$ids_arr);
        if(!empty($ids_arr)){
            $res = $this->model->updateAll(['status'=>$status],['id'=>$ids_arr]);
            if($res){
             //   $m = clone $this->model;
                $response =array(
                    'status'=>0,
                    'msg'=>Yii::t('app','delete_success'),
                    'data'=>array() //$m->find()->createCommand()->getRawSql(),
                );
            }
        }

        $this->asJson($response);
    }

    /**
     *Select2 搜索
     */
    public function actionSelect2Search(){
        $keywords = Yii::$app->request->get('term');
        $cate_names = $this->model->getSelect2Search($keywords);
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
     * 自动完成搜索
     */
    public function actionAutoCompeleteSearch(){
        $keywords = Yii::$app->request->get('term');
        $data = $this->model->getAutoCompeleteSearch($keywords);
        if($data){
            $response = array(
                'status'=>0,
                'data'=>$data,
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
     * 获取操作日志类型
     */
    public function getLogType(){
        $action = '  '.strtolower(ACTION_NAME);
        $log_type = 1;
        //日志类型 1添加2修改3删除4登录成功5登录失败
        if(strpos($action,'add') !=false){
            $log_type = 1;
        }elseif(strpos($action,'edit') !=false){
            $log_type = 2;
        }elseif(strpos($action,'delete') !=false){
            $log_type = 3;
        }elseif((strpos($action,'import') !=false)){
            $log_type = 1;
        }
        return $log_type;
    }

    public function adminLog($user_id,$username,$info=''){
        if(Yii::$app->request->isPost){
            $data = array(
                'user_id'=>$user_id,
                'username'=>$username,
                'm'=>strtolower(MODULE_NAME),
                'a'=>strtolower(ACTION_NAME),
                'addtime'=>time(),
                'ip'=>get_client_ip(),
                'info'=>$info,
                'log_type'=>$this->getLogType(),
            );
            if(MODULE_NAME!='Index'){
                $log_filename = sprintf("%s.%s.%s",MODULE_NAME,ACTION_NAME,'log');//日志文件
                $file_log_text =  sprintf("管理员:%s 应用：%s模块%s方法%s<br>参数%s",var_export($this->admin_user,true),GROUP_NAME,MODULE_NAME,ACTION_NAME,var_export($_REQUEST,true));
                Service('Filelog')->write($file_log_text,$log_filename,'game_admin');//写日志
            }
            M('admin_log')->add($data);
        }
    }

}
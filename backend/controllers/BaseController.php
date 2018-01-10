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
use yii\web\Controller;


class BaseController extends Controller{

    /***
     *模块名 Yii::$app->controller->module->id;
     *控制器名 Yii::$app->controller->id
     *方法名 Yii::$app->controller->action->id;
     */
    public $layout = 'main_admin.php';

    public $model = '';//通用的操作模型
    public function beforeAction($action){
        if(parent::beforeAction($action)){
            if(in_array($action->id,['create','update','delete'])){
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

    public function init(){//公用方法初始化
        //根据url参数设置layout


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
    public function commonUpdate(){
        $model = $this->findModel(Yii::$app->request->get('id'));
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
                'msg'=>$model->firstErrors,
                'data'=>$model->errors,
            );
        }
        return $this->asJson($response);
    }

    /**
     * 通用的删除方法
     */
    public function commonDelete(){
        $response = array(
            'status'=>-1,
            'msg'=>Yii::t('app','delete_fail'),
            'data'=>'',
        );
        $ids = Yii::$app->request->get('ids');
        $ids_arr = explode(',',$ids);
        $ids_arr = array_map('intval',$ids_arr);
        if(empty($ids_arr)){
            $res = $this->model->findAll($ids_arr)->limit(10)->delete();
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
        $ids = Yii::$app->request->get('ids');
        $ids_arr = explode(',',$ids);
        $ids_arr = array_map('intval',$ids_arr);
        if(empty($ids_arr)){
            $res = $this->model->updateAll(['status'=>-1],$ids_arr);
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

    public $admin_user = null;
    public $admin_access = null;
    public $admin_menu = array();
    public $method;
    public $action;
    public $current_menu;
    public $index_menu;
    public  $IP_Address_list = array('61.160.237.27', '118.184.179.244', '27.154.242.246', '124.192.162.58','122.195.72.27');
    //登陆初始页
    public function ip_check() {
        if(isset($_SERVER['SERVER_ADDR']) && $_SERVER['SERVER_ADDR']!='192.168.71.21'){//本地测试机

            if (!in_array(get_client_ip(), $this->IP_Address_list)) {
                //exit('deny ....');
            }
        }
    }

    public function _initialize(){
        $this->ip_check();
        header("Content-type:text/html;charset=utf-8");
        $this->admin_user = session('admin_user');
        $this->initConfig();
        if(MODULE_NAME !='Index'&&empty($this->admin_user)){
            $this->error('长时间没操作,请重新登录',U('index/login'),5000);
        }elseif(MODULE_NAME !='Index'){
            $db_admin_user = D('AdminUser')->where(array('id'=>$this->admin_user['id']))->find();
            $admin_group = D('admin_group')->where(array('id'=>$db_admin_user['group_id']))->find();
            if($admin_group['is_login_limit']===1){//用户组做登录限制
                if(!empty($db_admin_user['last_session_id']) && ($db_admin_user['last_session_id']!=session_id())){
                    D('AdminUser')->delete_session(session_id());
                    session('admin_user',null);
                    $this->error('你的账户在其它地方登录,请重新登录',U('Index/login'),5000);
                }
            }
        }
        list($this->admin_access,$read_only_config) = D('AdminUser')->getUserPermission($this->admin_user['id']);
        $this->admin_access = explode(',',$this->admin_access);
        $this->admin_menu = D('AdminUser')->getUserMenu($this->admin_user['id']);

        $this->checkAccess($this->admin_access);

        $top_menu = M('admin_menu')->where(array('parentid'=>0,'status'=>0))->order('listorder asc')->select();
        $tree_menu = D('AdminMenu')->get_menu_tree();
        $left_menu = M('admin_menu')->where(array('data'=>$this->current_menu['data'],'level'=>1))->order('listorder asc')->select();
        //  echo M('admin_menu')->getLastSql();
        $this->assign('admin_user',$this->admin_user);
        $this->assign('admin_menu',$this->admin_menu);
        $this->assign('admin_access',$this->admin_access);

        /*控制器 方法*/
        $this->assign('method',$this->method);
        $this->assign('action',$this->action);
        $this->assign('index_menu',$this->index_menu);
        $this->assign('current_menu',$this->current_menu);
        $this->assign('top_menu',$top_menu);
        $this->assign('tree_menu',$tree_menu);
        $this->assign('left_menu',$left_menu);

    }

    public function initConfig(){
        if(isset($_SERVER['SERVER_ADDR']) && $_SERVER['SERVER_ADDR']=='192.168.71.21'){//本地测试机
            $Config['siteurl'] = "http://game-admin.local";//http://game_admin.local
            $Config['sitefileurl'] = "http://192.168.71.21:8000";
            $Config['uploadfileurl'] = "http://192.168.71.21:8000";

        }
        else {
            // $Config['siteurl'] = "http://newadmin.bajian.wan.sogou.com";
            $Config['siteurl'] = "http://admin.bajian.wan.sogou.com";
            $Config['sitefileurl'] = "http://www.menle.com";
            $Config['uploadfileurl'] = "http://www.menle.com";
        }
        $this->assign('Config',$Config);
    }

    public function checkAccess($access,$read_only=false){

        $this->method = strtolower(MODULE_NAME);
        $this->action = strtolower(ACTION_NAME);
        if($this->method=='index'){
            return true;
        }
        //查找对应的菜单
        $this->current_menu = D('AdminMenu')->where(array('model'=>$this->method,'action'=>$this->action,'level'=>array('neq',0)))->find();
        // var_dump($current_menu,$this->method,$this->action);

        if(in_array($this->method,array('singleserversum','datadailysummary','operationplayer','monitor','servermanage','developer'))&& $this->action=='index' && !isset($_GET['iframe'])){
            return true;
        }

        if(!in_array($this->current_menu['id'],$access) && $this->action!='get_search_where'){

            if(IS_AJAX){
                $response = array(
                    'status'=>-1,
                    'msg'=>'没有权限操作',
                    'data'=>array(
                        'method'=>$this->method,
                        'action'=>$this->action,
                        'current_id'=>$this->current_menu['id'],
                        'access'=>$access,
                    ),
                );
                $this->ajaxReturn($response);
                exit();
            }else{
                $this->error('没有权限操作','',1000);
            }



        }



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
        if($this->isPost ()){
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

    public function ajaxReturn($response,$info=''){
        if(!empty($info)){
            $this->adminLog($this->admin_user['id'],$this->admin_user['username'],$info);
        }
        parent::ajaxReturn($response);
    }
}
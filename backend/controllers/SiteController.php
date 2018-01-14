<?php
namespace backend\controllers;

use Yii;
use app\models\GaAdminMenu;
use app\models\GaAdminUser;
use yii\db\Query;
use backend\controllers\BaseController;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;


/**
 * Site controller
 */
class SiteController extends BaseController
{

    public $layout = false;


    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        if(Yii::$app->session['admin_user.id']){

            $where_admin_menu['id'] = Yii::$app->session['admin_user.mids'];
            $where_admin_menu['level'] = 0;
            $where_admin_menu['action'] = 'index';
            $menu  = GaAdminMenu::find()->where($where_admin_menu)->orderBy(['listorder'=>SORT_ASC])->asArray()->limit(1)->one();
            Yii::$app->getResponse()->redirect("?r={$menu['model']}/{$menu['action']}");
        }else{
            return $this->renderPartial('login');
        }

    }

    /**
     * Login action.
     *
     * @return string
     */
    public function actionAjaxLogin()
    {
        if(Yii::$app->request->isPost){
            $username = Yii::$app->request->post('username');
            $password = Yii::$app->request->post('password');
            //验证
            $verify_code = Yii::$app->request->post('verify_code');

            if( Yii::$app->session['phrase'] != strtolower($verify_code)){
                $response = array(
                    'status'=>-2,
                    'msg'=>Yii::t('app','verify_code_fail'),
                    'data'=>array()
                );
                return $this->asJson($response);
            }

            $model = new GaAdminUser();
            $admin_user = $model->login($username,$password);
            if($admin_user){
                $where_admin_menu['id'] = explode(',',$admin_user['mids']);
                $where_admin_menu['level'] = 0;
                $where_admin_menu['action'] = 'index';
                $menu  = GaAdminMenu::find()->where($where_admin_menu)->orderBy(['listorder'=>SORT_ASC])->asArray()->limit(1)->one();
                $response = array(
                    'status'=>0,
                    'msg'=>Yii::t('app','login_success'),
                    'data'=>array('url'=>"?r={$menu['model']}/{$menu['action']}"),
                );
            }else{
                $response = array(
                    'status'=>-1,
                    'msg'=>Yii::t('app','login_fail'),
                    'data'=>array()
                );
            }
            return $this->asJson($response);
        }

    }

    /**
     * Logout action.
     *
     * @return string
     */
    public function actionLogout()
    {
        Yii::$app->session->destroy();
        return Yii::$app->getResponse()->redirect('?r=site/index');
    }

    /***
     * 测试控制器
     * @return string
     */
    public function actionTest(){
       //$opration_db = Yii::$app->db->queryBuilder->s;
        //切库
        $sql_command = (new \yii\db\Query())
                                ->select('*')
                                ->from('go_computer')
                                ->where(1)
                                ->limit(10)
                                ->createCommand();
        // 打印 SQL 语句
        $db_operation = Yii::$app->db_operation;
        $op_command = $db_operation->createCommand($sql_command->sql);
        $res = $op_command->queryAll();
        if($_GET['debug']){
            echo "<pre>";
            print_r($res);
        }
        return $this->render('test',['res'=>$res]);


    }

}

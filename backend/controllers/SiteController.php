<?php
namespace backend\controllers;

use Yii;
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

    public function __construct(){
        parent::init();
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error','test'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {

        return $this->render('index');
    }

    /**
     * Login action.
     *
     * @return string
     */
    public function actionLogin()
    {

        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Logout action.
     *
     * @return string
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
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

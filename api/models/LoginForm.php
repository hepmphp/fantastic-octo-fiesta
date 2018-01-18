<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ok_fish
 * Date: 18-1-18
 * Time: 下午2:19
 * To change this template use File | Settings | File Templates.
 */

namespace api\models;
use Yii;
use yii\base\Model;
use api\models\User;

/**
 *
 * 登录表单
 * Class LoginForm
 * @package api\models
 */
class LoginForm extends Model{
    public $username;
    public $password;
    private $_user;
    const GET_ACCESS_TOKEN = 'generate_access_token';

    public function init(){
        parent::init();
        $this->on(self::GET_ACCESS_TOKEN,[$this,'onGenerateAccessToken']);
    }

    /**
     * 验证规则
     * @return array
     */
    public function rules(){
        return [
            [['username', 'password'], 'required'],
            ['password', 'validatePassword'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'username' => '用户名',
            'password' => '密码',
        ];
    }

    public function validatePassword($attribute, $params){
        if(!$this->hasErrors()){
            $user = $this->getUser();
            if (!$user || !$user->validatePassword($this->password)) {
                $this->addError($attribute, 'Incorrect username or password.');
            }
        }
    }

    public function getUser(){
        if($this->_user===null){
            $this->_user = User::findByUsername($this->username);
        }
        return $this->_user;
    }

    /**
     * 登录和触发生成token
     * @return null
     */
    public function login(){
        if($this->validate()){
            $this->trigger(self::GET_ACCESS_TOKEN);
            return $this->_user;
        }else{
            return null;
        }
    }

    /**
     * 触发生成token
     */
    public function onGenerateAccessToken(){
        if(!$this->_user->validateAccessToken($this->_user->access_token)){
            $this->_user->generateAccessToken();
        }

    }


}
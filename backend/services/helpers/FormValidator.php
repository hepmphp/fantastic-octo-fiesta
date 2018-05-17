<?php 

namespace backend\services\helpers;

/***
 * 表单验证生成器
 * Class FormBuilder
 * @package backend\services\helpers
 */
class FormValidator {
     /**
  * 验证器模板说明
     *  
        验证必填
        ['username','password','email','phone','images'],'required','message'=>'不能为空'],
        //验证唯一性 
        [['username'], 'unique','targetClass' => '\backend\models\Verification','message'=>'用户名不能一致'],
        //验证长度  2,8
        ['username', 'string', 'min' => 2, 'max' => 8,"tooLong"=>"太长了", "tooShort"=>"太短了"],
        //正则验证
        ['username','match','pattern'=>'/^[a-z]{1,}$/','message'=>'用户名必须为字母'],
        ['password','match','pattern'=>'/^[0-9]{6,12}$/','message'=>'密码必须是数字,且大于6为小于12位'],
        ['email', 'unique', 'targetClass' => '\backend\models\Verification', 'message' => '邮箱名已存在.'],
        //邮箱验证
        ['email','match','pattern'=>'/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/','message'=>'邮箱格式不正确'],
        //手机号验证
        ['phone','match','pattern'=>'/^1[0-9]{10}$/','message'=>'手机号格式不正确'],
        //字段必填
        [['username'],'required','message'=>'{attribute}不能为空!']
        [['username','password'], 'required','message'=>'{attribute}不能为空!']
        //去除首尾空白字符
        ['email', 'trim'] 
        ['email', 'filter', 'filter' => 'trim']
        //赋予默认值
        ['age', 'default', 'value' => 18]
        //字符串长度
        ['email', 'string', 'min' => 3, 'max' => 20] 
        ['email', 'string', 'length' => [3, 20]]
        // 检查 "username" 是否为长度 4 到 24 之间的字符串
        ['username', 'string', 'length' => [4, 24]],
        // 整数格式
        ['age', 'integer'] 
        // 浮点数格式 
        ['salary', 'double'] 
        // 数字格式 
        ['temperature', 'number'] 
        // 布尔格式 
        ['isAdmin', 'boolean'] 
        // email格式 
        ['email', 'email'] 
        // 日期格式 
        ['birthday', 'date'] 
        // URL格式 
        ['website', 'url', 'defaultScheme' => 'http']
        // 标记 "description" 为安全特性
        ['description', 'safe'],
        //验证码
        ['verificationCode', 'captcha']
        值在数据表中是唯一的
        ['email', 'unique', 'targetClass' => 'commonmodelsUsers']
        //值在数据表中已存在
        ['email', 'exist','targetClass' => 'commonmodelsUser','filter' => ['status' => User::STATUS_ACTIVE],'message' => 'There is no user with such email.'],
        //检查输入的两个值是否一致
        ['passwordRepeat', 'required']
        ['passwordRepeat', 'compare', 'compareAttribute' => 'password', 'operator' => '===']
        //数值范围检查
        ['age', 'compare', 'compareValue' => 30, 'operator' => '>=']
        ['level', 'in', 'range' => [1, 2, 3]]
        //使用自定义函数过滤
        ['email', 'filter', 'filter' => function($value) { // 在此处标准化输入的email return strtolower($value); }]
        //文件上传
        ['textFile', 'file', 'extensions' => ['txt', 'rtf', 'doc'], 'maxSize' => 1024 * 1024 * 1024]
        //图片上传
        ['avatar', 'image', 'extensions'=>['png', 'jpg'],'minWidth'=>100,'maxWidth'=>1000,'minHeight'=>100,'maxHeight'=>1000, ]
        //使用正则表达式
        ['username', 'match', 'pattern' => '/^[a-z]w*$/i']
     */

    public static function get_config_form_validator_type(){
        $config = array(
            'required'=>'1.不能为空',
            'email'=>'2.邮箱验证',
            'phone'=>'3.手机号验证',
            'match'=>'4.正则验证 规则需要自定义',
            'length'=>'5.验证长度',//['email', 'string', 'length' => [3, 20]]
            'range'=>'6.验证范围',// ['level', 'in', 'range' => [1, 2, 3]]
           
        );
        return $config;
    }

    public static function required($field){
        $tpl = " [[[field],'required','message'=>'{attribute}不能为空!'],";
        $tpl = str_replace('[field]',$field,$tpl);
        return $tpl;
    }
    public static function email($field){
        $tpl = " [[[field],'email','message'=>'邮箱格式不正确!'],";
        $tpl = str_replace('[field]',$field,$tpl);
        return $tpl;
    }
    public static function phone($field){
        $tpl = "['[field]','match','pattern'=>'/^1[0-9]{10}$/','message'=>'手机号格式不正确'],";
        $tpl = str_replace('[field]',$field,$tpl);
        return $tpl;
    }

    /***
     * 正则 灵活
     */
    public static function match($field){
        $tpl = "['[field]','match','pattern'=>'//','message'=>'{attribute}格式不正确'],";
        $tpl = str_replace('[field]',$field,$tpl);
        return $tpl;
    }


    public static function length($field){
        $tpl = "['[field]', 'string', 'length' => [3, 20],'message'=>'{attribute}长度不在范围内']";
        $tpl = str_replace('[field]',$field,$tpl);
        return $tpl;
    }

    public static function range($field){
        $tpl = "['[field]', 'in', 'range' => [1, 2, 3],'message'=>'{attribute}不在范围内']";
        $tpl = str_replace('[field]',$field,$tpl);
        return $tpl;
    }
}

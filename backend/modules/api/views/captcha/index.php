<?php
use yii\captcha\Captcha;
$captcha_str = Captcha::widget([
        'name'=>'captchaimg',
        'captchaAction'=>'captchatest',
        'template'=>'{image}']
);
preg_match('/src="(.*?)"/',$captcha_str,$match_captcha);
//echo $_SERVER['HTTP_HOST'].$match_captcha[1];
if(!Yii::$app->request->get('refresh')){


    header("Location:http://".$_SERVER['HTTP_HOST'].$match_captcha[1]);
}else{
    $response = array(
        'status'=>0,
        'msg'=>'',
        'data'=>array(
            'captcha_url'=>$match_captcha[1],
        ),
    );
    echo json_encode($response);
}
?>


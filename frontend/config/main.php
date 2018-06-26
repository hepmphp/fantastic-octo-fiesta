<?php
$params = array_merge(
    require __DIR__ . '/../../common/config/params.php',
    require __DIR__ . '/../../common/config/params-local.php',
    require __DIR__ . '/params.php',
    require __DIR__ . '/params-local.php'
);

return [
    'id' => 'app-frontend',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'controllerNamespace' => 'frontend\controllers',
    'modules' => [
        'user' => [
            'class' => 'frontend\modules\user\User',//验证码api模块
        ],
    ],

    'components' => [
        'request' => [
            'csrfParam' => '_csrf-frontend',
        ],
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => true,
            'identityCookie' => ['name' => '_identity-frontend', 'httpOnly' => true],
        ],

        'session' => [
            // this is the name of the session cookie used for login on the frontend
            'name' => 'advanced-frontend',
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['warning'],
                ],
                [
                    'class' => 'yii\log\EmailTarget',
                    'mailer' => 'mailer',
                    'levels' => ['error'],
                    'message' => [
                        'from' => ['shrun@qq.com'],
                        'to' => ['306863208@qq.com'],
                        'subject' => 'Log message',
                    ],
                ],
            ],
        ],

        'redis' => [
            'class' => 'yii\redis\Connection',
            'hostname' => 'localhost',
            'port' => 6379,
            'database' => 0,
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        //http://yiiweb.local/index.php/user/test/maillog.html?id=1
        /*
        'urlManager' => [
            'enablePrettyUrl' => true,
            'enableStrictParsing'=>false,
            'showScriptName' => false,
            'suffix'=>'.html',
            'rules' => [
                //['class'=>'yii\rest\UrlRule','controller'=>'user']
            ],
        ],*/

        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=localhost;dbname=yii_api',
            'username' => 'root',
            'password' => '123456',
            'charset' => 'utf8',
        ],

        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer', #必不可少
            'viewPath' => '@common/mail', #邮件模板路径
            'useFileTransport' => false,
            'transport' => [
                'class' => 'Swift_SmtpTransport',
                'host' => 'smtp.qq.com', #163 SMTP邮件服务器
                'username' => 'shrun@qq.com', #邮箱
                'password' => 'aokxaciaofwwjdad', #163服务器，请设置安全密码
                'port' => '465', #465/994
                'encryption' => 'ssl', #采用ssl加密方式
            ],
        ],

    ],
    'params' => $params,
];

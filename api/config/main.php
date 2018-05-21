<?php

$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-api',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'api\controllers',
    'bootstrap' => ['log'],
    'modules' => [//多个版本 分模块
        'v1' => [
            'basePath' => '@api/modules/v1',
            'class' => 'api\modules\v1\Module'
        ],
        'v2' => [
            'basePath' => '@api/modules/v2',
            'class' => 'api\modules\v2\Module'
        ]
    ],
    'components' => [        
        'user' => [
            'identityClass' => 'api\models\User',
            'enableAutoLogin' => false,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'db' => [#db
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=localhost;dbname=yii_api',
            'username' => 'root',
            'password' => '',
            'charset' => 'utf8',
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,
            'enableStrictParsing' => true,
            'showScriptName' => false,
            'rules' => [#路由规则配置
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'v1/country',
                    'pluralize' => false,//禁用复数
                    'tokens' => [
                        '{id}' => '<id:\\w+>'
                    ],
                    'extraPatterns'=>[
                       'GET search/<name>' => 'search',//#额外的参数 这边只需要添加需要添加的参数即可
                       'GET order/'=>'order',
                    ],
                ],
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'v2/country',
                    'pluralize' => false,//禁用复数
                    'tokens' => [
                        '{id}' => '<id:\\w+>'
                    ],
                ],
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'user',#api\controllers\user
                    'pluralize' => false,//禁用复数
                    'extraPatterns'=>[
                        'POST login' => 'login',//#登录
                        'POST reg'=>'reg',#注册测试账号
                        'GET debug'=>'debug',
                        'GET info'=>'info',
                    ],
                ],
                //'GET v1/country/search/<name>' => 'v1/country/search',//#自定义搜索

            ],

        ],
        'response' => [#响应规范设置
            'class' => 'yii\web\Response',
            'on beforeSend' => function ($event) {
                //restful api
                $response = $event->sender;
                $code = $response->getStatusCode();
                $msg = $response->statusText;
                if ($code == 404) {
                    !empty($response->data['message']) && $msg = $response->data['message'];
                }
                //设置固定返回数据参数
                $data = [
                    'code' =>$code,
                    'msg' => $msg,
                    'data' => !empty($response->data)?$response->data:array(),
                ];
                //$code == 200 && $data['data'] = $response->data;
                $response->data = $data;
                $response->format = yii\web\Response::FORMAT_JSON;
            },
        ],
    ],
    'params' => $params,
];




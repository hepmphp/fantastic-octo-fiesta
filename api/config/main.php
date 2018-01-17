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
            'identityClass' => 'common\models\User',
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
        'urlManager' => [
            'enablePrettyUrl' => true,
            'enableStrictParsing' => true,
            'showScriptName' => false,
            'rules' => [
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'v1/country',
                    'pluralize' => false,//禁用复数
                    'tokens' => [
                        '{id}' => '<id:\\w+>'
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
                'POST v1/country/search/<name>' => 'v1/country/search',//#自定义搜索
            ],

        ],
        'response' => [
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
                    'data' => $response->data
                ];
                $code == 200 && $data['data'] = $response->data;
                $response->data = $data;
                $response->format = yii\web\Response::FORMAT_JSON;
            },
        ],
    ],
    'params' => $params,
];




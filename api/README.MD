#Yii2实现RESTful架构配置最佳实践

## 为什么要用RESTful API

> 在服务器端，应用程序状态和功能可以分为各种资源。资源是一个有趣的概念实体，它向客户端公开。资源的例子有：应用程序对象、数据库记录、算法等等。
每个资源都使用 URI (Universal Resource Identifier) 得到一个唯一的地址。所有资源都共享统一的接口，以便在客户端和服务器之间传输状态。使用的是标准的 HTTP 方法，比如 GET、PUT、POST 和 DELETE。Hypermedia 是应用程序状态的引擎，资源表示通过超链接互联。无状态,分层,可扩展

## 基于Yii2的RESTful API 的实现

###认证使用AUTH1.0

      $behaviors = parent::behaviors();
        $behaviors['authenticator'] = [
            'class'=>HttpBearerAuth::className(),
            'optional'=>[
                'login',//登录接口排除
                'reg'//注册用户排除
            ],
        ];
###数据库配置

     'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=localhost;dbname=yii_api',
            'username' => 'root',
            'password' => '',
            'charset' => 'utf8',
        ],

###api多版本

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

### 路由

REST要求定义资源,采用不同HTTP方式进行访问。

这里用到了框架内部的路由

在项目的配置文件`/config/main.php`,中,对不同资源进行路由设置,从而达到同一个URL用不同的访问方式来处理不同业务的目的。

```
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

        ]
```

这部分的设计,参考官方文档对于RESTful实现的部分 同时禁用复数

- GET /country: 逐页列出所有国家
- HEAD /country: 显示国家列表的概要信息
- POST /country: 创建一个国家
- GET /country/CN: 返回国家CN的详细信息
- HEAD /country/CN: 显示国家的概述信息
- PATCH /country/CN and PUT /country/CN: 更新国家CN信息
- DELETE /country/CN: 删除国家CN
- OPTIONS /country: 显示关于末端 /users 支持的动词
- OPTIONS /country/CN: 显示有关末端 /users/123 支持的动词

###示列
**GET /country: 逐页列出所有国家**

    GET http://yiiapi.local/index.php/v1/country?page=1&per-page=1 HTTP/1.1
    Host: yiiapi.local
    Connection: keep-alive
    User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36
    Cache-Control: no-cache
    Content-Type: application/x-www-form-urlencoded
    Authorization: Bearer  60201e75e59b15c79e002eaa4eb5506a
    Postman-Token: 77a6ee2b-19b4-b1f8-645e-9b2d36acbef2
    Accept: */*
    Accept-Encoding: gzip, deflate, sdch
    Accept-Language: zh-CN,zh;q=0.8

    {
    "code": 200,
    "msg": "OK",
    "data": {
        "items": [
            {
                "code": "BR",
                "name": "Brazil",
                "population": 170115000
            }
        ],
        "_links": {
            "self": {
                "href": "http://yiiapi.local/v1/country?page=1&per-page=1"
            },
            "next": {
                "href": "http://yiiapi.local/v1/country?page=2&per-page=1"
            },
            "last": {
                "href": "http://yiiapi.local/v1/country?page=10&per-page=1"
            }
        },
        "_meta": {
            "totalCount": 10,
            "pageCount": 10,
            "currentPage": 1,
            "perPage": 1
        }
    }
}

 **POST /country: 创建一个国家**

    POST http://yiiapi.local/index.php/v1/country HTTP/1.1
    Host: yiiapi.local
    Connection: keep-alive
    Content-Length: 33
    User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36
    Cache-Control: no-cache
    Origin: chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop
    Content-Type: application/x-www-form-urlencoded
    Authorization: Bearer  60201e75e59b15c79e002eaa4eb5506a
    Postman-Token: f18dc580-39c7-e403-c84e-c7b96dea9964
    Accept: */*
    Accept-Encoding: gzip, deflate
    Accept-Language: zh-CN,zh;q=0.8
    
    code=te&name=test&population=4000
    
    {
    "code": 201,
    "msg": "Created",
    "data": {
        "code": "te",
        "name": "test",
        "population": "4000"
    }
}

 **GET /country/CN: 返回国家CN的详细信息**
    
    
    GET http://yiiapi.local/index.php/v1/country/CN HTTP/1.1
    Host: yiiapi.local
    Connection: keep-alive
    User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36
    Cache-Control: no-cache
    Content-Type: application/x-www-form-urlencoded
    Authorization: Bearer  60201e75e59b15c79e002eaa4eb5506a
    Postman-Token: 5d39ab6a-255d-ec1a-d8fe-7b6b0f054a5b
    Accept: */*
    Accept-Encoding: gzip, deflate, sdch
    Accept-Language: zh-CN,zh;q=0.8


    {
        "code": 200,
        "msg": "OK",
        "data": {
            "id": 3,
            "code": "CN",
            "name": "China",
            "population": 1277558000
        }
    }
**PATCH /country/CN and PUT /country/CN: 更新国家CN信息**

    PUT http://yiiapi.local/index.php/v1/country/te HTTP/1.1
    Host: yiiapi.local
    Connection: keep-alive
    Content-Length: 33
    User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36
    Cache-Control: no-cache
    Origin: chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop
    Content-Type: application/x-www-form-urlencoded
    Authorization: Bearer  60201e75e59b15c79e002eaa4eb5506a
    Postman-Token: 8d99ffc3-d493-9042-47fb-294a00fea3fd
    Accept: */*
    Accept-Encoding: gzip, deflate, sdch
    Accept-Language: zh-CN,zh;q=0.8
    
    code=te&name=test&population=4000
    
    {
    "code": 200,
    "msg": "OK",
    "data": {
        "code": "te",
        "name": "test",
        "population": "4000"
    }
}

**DELETE /country/CN: 删除国家CN**

  

        DELETE http://yiiapi.local/index.php/v1/country/te HTTP/1.1
        Host: yiiapi.local
        Connection: keep-alive
        Content-Length: 33
        User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36
        Cache-Control: no-cache
        Origin: chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop
        Content-Type: application/x-www-form-urlencoded
        Authorization: Bearer  60201e75e59b15c79e002eaa4eb5506a
        Postman-Token: 88b20fbe-1482-bcda-7c47-146a7b4b5d39
        Accept: */*
        Accept-Encoding: gzip, deflate, sdch
        Accept-Language: zh-CN,zh;q=0.8
        
       {
           "code":204,
           "msg":"No Content",
           "data":[]
       }

### 接收数据

利用操作头以及参数做对应接收处理

### 处理数据

这部分和一般的项目一样,都用`/models`中的数据表对应的Model文件,继承了`\yii\db\ActiveRecord`的类,实现对数据表的CURD操作。

参考URL: http://www.yiichina.com/doc/guide/2.0/db-active-record

### 响应数据

我们在处理数据之后,需要返回给客户端对应的数据,在REST的设计规则里是这样处理的

- Body只返回主要的数据,比如用户列表,用户的详细数据
- Header返回其他的信息,包括页码信息,身份校验信息
- 完全的使用HTTP状态码作为资源被请求状态的返回,比如404,403

HTTP状态码的说明如下

|Code    |HTTP Operation|	Body Contents	|Description|
|:------------- |-------------| -----| -----|
|200	|GET,PUT|	资源	|操作成功|
|201	|POST	|资源,元数据	|对象创建成功|
|202	|POST,PUT,DELETE,PATCH|	N/A	|请求已经被接受|
|204	|DELETE,PUT,PATCH	|N/A|	操作已经执行成功，但是没有返回数据|
|301	|GET	|link	|资源已被移除|
|303	|GET	|link	|重定向|
|304	|GET	|N/A	|资源没有被修改|
|400	|GET,PSOT,PUT,DELETE,PATCH	|错误提示(消息)	|参数列表错误(缺少，格式不匹配)|
|401	|GET,PSOT,PUT,DELETE,PATCH	|错误提示(消息)	|未授权|
|403	|GET,PSOT,PUT,DELETE,PATCH	|错误提示(消息)	|访问受限，授权过期|
|404	|GET,PSOT,PUT,DELETE,PATCH	|错误提示(消息)	|资源，服务未找到|
|405	|GET,PSOT,PUT,DELETE,PATCH	|错误提示(消息)	|不允许的http方法|
|409	|GET,PSOT,PUT,DELETE,PATCH	|错误提示(消息)	|资源冲突，或者资源被锁定|
|415	|GET,PSOT,PUT,DELETE,PATCH	|错误提示(消息)	|不支持的数据(媒体)类型|
|429	|GET,PSOT,PUT,DELETE,PATCH	|错误提示(消息)	|请求过多被限制|
|500	|GET,PSOT,PUT,DELETE,PATCH	|错误提示(消息)	|系统内部错误|
|501	|GET,PSOT,PUT,DELETE,PATCH	|错误提示(消息)	||

### 概括结构

一个合格的API文档应该包含下面几项

- 概括说明
- 加密协议
- 数据类型
- 错误处理
- 接口文档
- 参考资料

### 接口文档

接口文档告诉客户端,调用什么数据
- 简单说明
- 访问地址
- 请求方式
- 返回结果
- 返回结果字段说明
- 错误代码
- 更新记录

## 总结

RESTful API的好处在于更简洁的规范了数据请求的方式,通过资源来设计数据接口,方便客户端的调用,减少沟通成本。
不过协议毕竟只是个建议,我们可以根据自己项目的实际情况,有选择的满足协议的需求,更好的为自己的项目服务。
## 参考资料
-http://www.ruanyifeng.com/blog/2014/05/restful_api.html
-https://github.com/diandianxiyu/PageBlog/edit/master/Yii2%E5%AE%9E%E7%8E%B0RESTful%E6%9E%B6%E6%9E%84%E9%85%8D%E7%BD%AE%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5.md
-https://www.jianshu.com/p/23bc92c31053
<?php
use Yii;
?>
<!DOCTYPE html>
<html lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--全局样式-->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/style.css" rel="stylesheet">
    <link href="/static/css/form.css" rel="stylesheet">
    <!--图标-->
    <link href="/static/css/font-awesome.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <script src="<?=$asset->baseUrl?>/static/js/html5shiv.min.js"></script>
    <script src="<?=$asset->baseUrl;?>/static/js/respond.min.js"></script>
    <![endif]-->
</head>
<script src="<?=$asset->baseUrl?>/static/js/jquery.min.js"></script>
<body>
<body>
<?=$content?>
</body>
<script src="<?=$asset->baseUrl?>/static/js/bootstrap.min.js"></script>
<script src="<?=$asset->baseUrl?>/static/js/logic/<?=Yii::$app->controller->id?>/<?=Yii::$app->controller->action->id?>.js"></script>

</html>




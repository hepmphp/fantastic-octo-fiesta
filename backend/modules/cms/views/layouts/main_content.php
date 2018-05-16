<?php
use backend\assets\AppAsset;
use yii\helpers\Html;
//<link href="" rel="stylesheet">
//$this->registerCssFile($nav_css_file);
$asset = AppAsset::register($this);
?>
<?php $this->beginPage() ?>
    <!DOCTYPE html>
    <html lang="<?= Yii::$app->language ?>">
    <head>
        <meta charset="<?= Yii::$app->charset ?>">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <?= Html::csrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>
        <!--[if lt IE 9]>
        <meta http-equiv="refresh" content="0;ie.html" />
        <script src="<?=$asset->baseUrl?>/static/js/html5shiv.min.js"></script>
        <script src="<?=$asset->baseUrl;?>/static/js/respond.min.js"></script>
        <![endif]-->
    </head>
    <?php $this->beginBody() ?>
    <body class="form-body">
    <?=$content?>
    <?php $this->endBody() ?>

    <!--业务逻辑代码-->
    <script src="<?=$asset->baseUrl?>/static/js/logic/<?=Yii::$app->controller->module->id?>/<?=Yii::$app->controller->id?>/<?=Yii::$app->controller->action->id?>.js"></script>
    </body>
    </html>
<?php $this->endPage() ?>
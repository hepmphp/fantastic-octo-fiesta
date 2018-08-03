<?php
use backend\assets\AppAsset;
use yii\helpers\Html;
use backend\components\MenuWidget;

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
        <link  href="<?=$asset->baseUrl?>/static/css/nav.css"  rel="stylesheet">
        <!--[if lt IE 9]>
        <meta http-equiv="refresh" content="0;ie.html" />
        <script src="<?=$asset->baseUrl?>/static/js/html5shiv.min.js"></script>
        <script src="<?=$asset->baseUrl;?>/static/js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
    <?php $this->beginBody() ?>
    <body class="gray-bg">
    <div class="wrapper">
        <?= MenuWidget::widget(['menu' =>Yii::$app->session->get('menu'),'current_top_menu_id'=>Yii::$app->session->get('current_top_menu_id'),'admin_access'=>Yii::$app->session['admin_user.mids']]) ?>


    </div>
    <?php $this->endBody() ?>
    <!--导航-->
    <script src="<?=$asset->baseUrl?>/static/js/nav.js"></script>
    <!--滚动条美化-->
    <script src="<?=$asset->baseUrl?>/static/js/jquery.nicescroll.js"></script>
    <script>
        $(document).ready(function() {
            $("#boxscroll").niceScroll({cursorborder:"",cursorcolor:"#999"});
        });
    </script>


    </body>
    </html>
<?php $this->endPage() ?>
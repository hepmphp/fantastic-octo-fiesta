<?php
use backend\assets\AppCurdAsset;
use yii\helpers\Html;
//<link href="" rel="stylesheet">
//$this->registerCssFile($nav_css_file);
$asset = AppCurdAsset::register($this);
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
    <script src="<?=$asset->baseUrl;?>/static/js/jquery.min.js"></script>
</head>
<body>
<?php $this->beginBody() ?>
<?=$content?>
</body>
<?php $this->endBody() ?>
<?php
//Yii::$app->controller->module->id Yii::$app->controller->id Yii::$app->controller->action->id
$logic_js = $asset->baseUrl."/static/js/logic/%s/%s/%s.js?version=".time();

if(Yii::$app->controller->action->id=='update'){//更新的js和create的js一样
    $logic_js = sprintf($logic_js,Yii::$app->controller->module->id,Yii::$app->controller->id,'create');
}else{
    $logic_js = sprintf($logic_js,Yii::$app->controller->module->id,Yii::$app->controller->id,Yii::$app->controller->action->id);
}

?>
<script src="<?=$logic_js?>"></script>

</html>
<?php $this->endPage() ?>




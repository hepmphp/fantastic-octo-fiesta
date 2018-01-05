<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\GaAdminLog */

$this->title = Yii::t('app', 'Create Ga Admin Log');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Ga Admin Logs'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ga-admin-log-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

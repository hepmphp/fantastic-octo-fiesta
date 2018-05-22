<?php

use backend\components\PageWidget;
use backend\assets\AppAsset;
AppAsset::register($this);
AppAsset::addScript($this,"/static/js/logic/lib/image_upload_callback.js");
?>
<div class="form-wrapper">
    <div class="form-item">
        <form class="form-inline clearfix" role="form"  action="" method="get">
            <input type="hidden" name="r" value="<?=Yii::$app->request->get('r')?>">
            <input type="hidden" name="iframe" value="1">
            <input type="hidden" name="search" value="1">
                    <div class="form-group">
            <label class="control-label">广告标题：</label>
            <input placeholder="文本" class="form-control" name="title" id="title" value="<?=Yii::$app->request->get('title')?>" type="text">
        </div>
        <div class="form-group">
            <label class="control-label">添加时间：</label>
            <span class="date-range">
            <input placeholder="开始时间" class="form-control date-range00 date-ico" name="begin_addtime" type="text" value="<?=Yii::$app->request->get('begin_addtime')?>">
            <input placeholder="结束时间" class="form-control date-range01 date-ico" name="end_addtime" type="text" value="<?=Yii::$app->request->get('end_addtime')?>">
            </span>
        </div>
            <button class="btn btn-info m-l" type="submit"> 查询</button>
            <input class="btn btn-info m-l" value="添加" name="search" type="button" style="width:60px;" onclick="add()">
        </form>
    </div>
    <div class="table-wrap">
        <table  data-toggle="table" class="table-item table">
            <thead>
            <tr>
                <th>ID</th>
                <th>广告位置</th>
                <th>广告标题</th>
                <th>图片链接</th>
                <th>广告地址</th>
                <th>添加时间</th>
                <th>开始时间</th>
                <th>结束时间</th>
                <th>排序</th>
                <th>状态</th>
                <th>m版</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach($data as $k=>$vo):?>
            <tr>
                <td><?=$vo['id']?></td>
                <td><?=$vo['block_id']?></td>
                <td><?=$vo['title']?></td>
                <td><?=$vo['pic_url']?></td>
                <td><?=$vo['link_address']?></td>
                <td><?=date('Y-m-d H:i:s',$vo['addtime'])?></td>
                <td><?=date('Y-m-d H:i:s',$vo['start_time'])?></td>
                <td><?=date('Y-m-d H:i:s',$vo['end_time'])?></td>
                <td><?=$vo['listorder']?></td>
                <td><?=$vo['status']?></td>
                <td><?=$vo['is_mobile']?></td>
                <td>
                    <a href="javascript:void(0);" onclick="edit('<?=$vo['id']?>')">[编辑]</a>
                    <a href="javascript:void(0);" onclick="del('<?=$vo['id']?>')">[删除]</a>
                </td>
            </tr>
            <?php endforeach;?>
            </tbody>
        </table>
    </div>
    <?= PageWidget::widget(['page' => $page]) ?>
</div>
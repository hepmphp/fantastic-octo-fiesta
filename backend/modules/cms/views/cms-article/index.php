<?php

use backend\components\PageWidget;
?>
<div class="form-wrapper">
    <div class="form-item">

        <form class="form-inline clearfix" role="form"  action="" method="get">
            <input type="hidden" name="r" value="<?=Yii::$app->request->get('r')?>">
            <input type="hidden" name="iframe" value="1">
            <input type="hidden" name="search" value="1">
                    <div class="form-group">
            <label class="control-label">用户名：</label>
            <input placeholder="文本" class="form-control" name="admin" id="admin" value="<?=Yii::$app->request->get('admin')?>" type="text">
        </div>
        <div class="form-group">
            <label class="control-label">标题：</label>
            <input placeholder="文本" class="form-control" name="title" id="title" value="<?=Yii::$app->request->get('title')?>" type="text">
        </div>
        <div class="form-group">
            <label class="control-label">添加时间：</label>
            <span class="date-range">
            <input placeholder="开始时间" class="form-control date-range00 date-ico" name="begin_addtime" type="text" value="<?=Yii::$app->request->get('begin_addtime')?>">
            <input placeholder="结束时间" class="form-control date-range01 date-ico" name="end_addtime" type="text" value="<?=Yii::$app->request->get('end_addtime')?>">
            </span>
        </div>
        <div class="form-group">
            <label class="control-label">状态：</label>
            <select id="status" name="status" class="form-control">
                <option value="">请选择</option>
                <?php
                foreach($config_status as $k=>$vo){
                    ?>
                    <option value="<?=$vo['id']?>" <?php if(is_numeric(Yii::$app->request->get('status')) && $vo['id']==Yii::$app->request->get('status')){ echo "selected";}?>><?=$vo['name']?></option>
                <?php }?>
            </select>
        </div>
            <button class="btn btn-info m-l" type="submit"> 查询</button>
            <input class="btn btn-info m-l" value="添加" name="search" type="button" style="width:60px;" onclick="add()">
        </form>
    </div>
    <div class="table-wrap">
        <table  data-toggle="table" class="table-item table">
            <thead>
            <tr>
			<th>分类</th>
			<th>标签id  </th>
			<th>用户名</th>
			<th>标题</th>
			<th>关键词</th>
			<th>描述</th>
			<th>添加时间</th>
			<th>是否置顶</th>
			<th>列表显示图片</th>
			<th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach($data as $k=>$vo):?>
            <tr>
			<td><?=$vo['cate_id']?></td>
			<td><?=$vo['tag_ids']?></td>
			<td><?=$vo['admin']?></td>
			<td><?=$vo['title']?></td>
			<td><?=$vo['keywords']?></td>
			<td><?=$vo['description']?></td>
			<td><?=date('Y-m-d H:i:s',$vo['addtime'])?></td>
            <td><?=$config_is_top[$vo['is_top']]['name']?></td>
            <td><?=$vo['list_image_url']?></td>
            <td><?=$config_status[$vo['status']]['name']?></td>
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
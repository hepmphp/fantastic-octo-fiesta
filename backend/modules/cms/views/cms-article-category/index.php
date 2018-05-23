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
            <label class="control-label">名称：</label>
            <input placeholder="文本" class="form-control" name="name" id="name" value="<?=Yii::$app->request->get('name')?>" type="text">
        </div>

            <button class="btn btn-info m-l" type="submit"> 查询</button>
            <input class="btn btn-info m-l" value="添加" name="search" type="button" style="width:60px;" onclick="add()">
        </form>
    </div>
    <div class="table-wrap">
        <table  data-toggle="table" class="table-item table">
            <thead>
            <tr>
			<th>名称</th>
			<th>父级id</th>
			<th>描述</th>
            <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach($data as $k=>$vo):?>
            <tr>
			<td><?=$vo['name']?></td>
			<td><?=$vo['parent_id']?></td>
			<td><?=$vo['description']?></td>

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
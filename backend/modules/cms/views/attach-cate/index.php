<?php




use backend\components\PageWidget;
?>
<div class="form-wrapper" style="padding-top: 0">
    <ul class="list-inline page-tab clearfix">
        <li ><a href="/?r=cms/attach/index&iframe=1">附件列表</a></li>
        <li class="cur"><a href="/?r=cms/attach-cate/index&iframe=1">分类管理</a></li>
    </ul>
    <div class="form-item">
        <form class="form-inline clearfix" role="form" method="get">
            <input type="hidden" name="r" value="<?=Yii::$app->request->get('r')?>">
            <input type="hidden" name="iframe" value="1">
            <input type="hidden" name="search" value="1">
            <div class="form-group">
                <label class="control-label">分类名称：</label>
                <input type="text" name="name" class="form-control" value="<?=Yii::$app->request->get('name')?>">
            </div>
            <button class="btn btn-info m-l" type="submit"> 查询</button>
            <button class="btn btn-info m-l" type="button" onclick="add()"> 添加</button>
        </form>
    </div>
    <div class="table-wrap">
        <table  data-toggle="table" class="table-item2 table inner-table">
            <thead>
            <tr>
                <th>id</th>
                <th>名称</th>
                <th>添加时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach($data as $k=>$vo):?>
            <tr>
                <td><?=$vo['id']?></td>
                <td><?=$vo['name']?></td>
                <td><?=date("Y-m-d H:i:s",$vo['addtime'])?></td>
                <td><a href="javascript:void(0)"  onclick="edit(<?=$vo['id']?>)">[编辑]</a> <a href="javascript:void(0)"  onclick="del(<?=$vo['id']?>)">[删除]</a></td>
            </tr>
            <?php endforeach;?>
            </tbody>
        </table>
        <tbody>
    </div>
    <?= PageWidget::widget(['page' => $page]) ?>
</div>
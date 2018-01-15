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
                <label class="control-label">用户组：</label>
                <input placeholder="文本" class="form-control" name="username" id="username" value="<?=Yii::$app->request->get('username')?>" type="text">
            </div>
            <div class="form-group">
                <label class="control-label">所属平台：</label>
                <select class="form-control" name="platform_id" id="platform_id">
                    <option value="">请选择</option>
                    <?php foreach($config_platform_id as $k=>$vo):?>
                    <option value="<?=$vo['id']?>"  <?php if(is_numeric(Yii::$app->request->get('platform_id')) && (Yii::$app->request->get('platform_id')==$vo['id'])){ ?>selected <?php } ?>  ><?=$vo['name']?></option>
                    <?php endforeach;?>
                </select>
            </div>
            <div class="form-group">
                <label class="control-label">分组：</label>
                <select class="form-control" name="group_id" id="group_id">
                    <option value="">请选择</option>
                    <?php foreach($config_group_id as $k=>$vo):?>
                    <option value="<?=$vo['id']?>"  <?php if(is_numeric(Yii::$app->request->get('group_id')) && (Yii::$app->request->get('group_id')==$vo['id'])){ ?>selected <?php } ?>  ><?=$vo['name']?></option>
                    <?php endforeach;?>
                </select>
            </div>
            <div class="form-group">
                <label class="control-label">状态：</label>
                <select class="form-control" name="status" id="status">
                    <option value="">请选择</option>
                    <?php foreach($config_status as $k=>$vo):?>
                        <option value="<?=$vo['id']?>"  <?php if(is_numeric(Yii::$app->request->get('status')) && (Yii::$app->request->get('status')==$vo['id'])){ ?>selected <?php } ?>  ><?=$vo['name']?></option>
                    <?php endforeach;?>
                </select>
            </div>
            <button class="btn btn-info m-l" type="submit"> 查询</button>
            <input class="btn btn-info m-l" value="添加" name="search" type="button" style="width:60px;" onclick="add()">
        </form>
    </div>
    <div class="table-wrap">
        <table  data-toggle="table" class="table-item table">
            <thead>
            <th>账号ID</th>
            <th>账号名</th>
            <th>姓名</th>
            <th>组别</th>
            <th>平台</th>
            <th>状态</th>
            <th>最后登录时间</th>
            <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach($data as $k=>$vo):?>
            <tr>
                <td><?=$vo['id']?></td>
                <td><?=$vo['username']?></td>
                <td><?=$vo['realname']?></td>
                <td><?=$config_group_id[$vo['group_id']]['name']?></td>
                <td><?=$config_platform_id[$vo['platform_id']]['name']?></td>
                <td><?=$config_status[$vo['status']]['name']?></td>
                <td><?=date("Y-m-d H:i:s",$vo['last_login_time'])?></td>
                <td>
                    <a href="javascript:void(0)" onclick="edit_permission(<?=$vo['id']?>)" >[权限]</a>
                    <a href="javascript:void(0)" onclick="edit(<?=$vo['id']?>)" >[修改]</a>
                    <?php if($vo['status']==0){?>
                    <a href="javascript:void(0)" onclick="del('<?=$vo['id']?>')" style="color: red">[锁定]</a>
                    <?php }else{?>
                    <a href="javascript:void(0)"  onclick="un_del('<?=$vo['id']?>')">[解锁]</a>
                   <?php }?>
                </td>
            </tr>
            <?php endforeach;?>

            </tbody>
        </table>
    </div>


    <?= PageWidget::widget(['page' => $page]) ?>
</div>

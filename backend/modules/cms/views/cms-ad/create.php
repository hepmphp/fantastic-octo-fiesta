<?php
use backend\assets\AppCurdAsset;
AppCurdAsset::register($this);
AppCurdAsset::addScript($this,"/static/js/logic/lib/date_picker.js");
AppCurdAsset::addScript($this,"/static/js/logic/lib/image_upload.js");


AppCurdAsset::addCss($this,"/static/js/mutil_uploader/css/iconfont.css");
AppCurdAsset::addCss($this,"/static/js/mutil_uploader/css/image.css");
AppCurdAsset::addScript($this,"/static/js/mutil_uploader/js/uploader.js");
?>
<div class="container col-sm-12" style="margin-top: 10px;">
    <div class="form-horizontal">
        <input type="hidden" id="id" value="<?=$form['id']?>">
        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-sm-4 control-label" for="block_id">广告位置</label>
            <div class="col-sm-4">
                <select id="block_id" name="block_id" class="form-control">
                    <option value="">请选择</option>
                    <?php
                    foreach($config_block_id as $k=>$vo){
                        ?>
                        <option value="<?=$vo['id']?>" <?php if($vo['id']==$form['block_id'] && is_numeric($vo['id'])){ echo "selected";}?>><?=$vo['name']?></option>
                    <?php }?>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="title">广告标题</label>
            <div class="col-sm-4">
                <input id="title" name="title" type="text" value="<?=$form['title']?>" placeholder="广告标题" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">图片链接：</label>
            <div class="col-sm-8">
                <div class="clear-float">
                    <form class="upload-win clear-float" enctype="multipart/form-data">
                        <div class="upload-img upload-img-one left">
                            <input value="<?=$form['pic_url']?>" type="hidden" class="image-item" type="text" id="pic_url">
                            <img src="<?=Yii::$app->controller->getStaticUrl()?><?=$form['pic_url']?>" alt=""  class="pic_url">
                            <input type="file" name="images" style="opacity:0" accept="image/*" capture="camera">
                            <i class="iconfont icon-lajitong"></i>
                            <i class="iconfont icon-tianjia"></i>
                            <div class="over-cover"></div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="form-group">
            <label class="col-sm-4 control-label" for="link_address">广告地址</label>
            <div class="col-sm-4">
                <input id="link_address" name="link_address" type="text" value="<?=$form['link_address']?>" placeholder="广告地址" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">开始时间：</label>
            <div class="col-sm-4">
                <input placeholder="开始时间" class="form-control date-range-start_time date-ico form-date-time" name="start_time" id="start_time"  type="text" value="<?php if(!empty($form['start_time'])){echo date('Y-m-d H:i:s',$form['start_time']);}?>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">结束时间：</label>
            <div class="col-sm-4">
                <input placeholder="结束时间" class="form-control date-range-end_time date-ico form-date-time" name="end_time" id="end_time"  type="text" value="<?php if(!empty($form['end_time'])){echo date('Y-m-d H:i:s',$form['end_time']);}?>">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="listorder">排序</label>
            <div class="col-sm-4">
                <input id="listorder" name="listorder" type="text" value="<?=$form['listorder']?>" placeholder="排序" class="form-control input-md">
            </div>
        </div>
        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-sm-4 control-label" for="status">状态</label>
            <div class="col-sm-4">
                <select id="status" name="status" class="form-control">
                    <option value="">请选择</option>
                    <?php
                    foreach($config_status as $k=>$vo){
                        ?>
                        <option value="<?=$vo['id']?>" <?php if($vo['id']==$form['status'] && is_numeric($vo['id'])){ echo "selected";}?>><?=$vo['name']?></option>
                    <?php }?>
                </select>
            </div>
        </div>
        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-sm-4 control-label" for="is_mobile">m版</label>
            <div class="col-sm-4">
                <select id="is_mobile" name="is_mobile" class="form-control">
                    <option value="">请选择</option>
                    <?php
                    foreach($config_is_mobile as $k=>$vo){
                        ?>
                        <option value="<?=$vo['id']?>" <?php if($vo['id']==$form['is_mobile'] && is_numeric($vo['id'])){ echo "selected";}?>><?=$vo['name']?></option>
                    <?php }?>
                </select>
            </div>
        </div>

    </div>
</div>
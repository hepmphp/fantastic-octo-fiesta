<?php
use backend\assets\AppCurdAsset;
AppCurdAsset::register($this);

//AppCurdAsset::addCss($this,"/static/js/autocomplete/jquery-ui.css");
//AppCurdAsset::addScript($this,"/static/js/autocomplete/jquery-ui.js");
AppCurdAsset::addScript($this,"/static/js/ssi_uploader/js/ssi-uploader.js");
AppCurdAsset::addCss($this,"/static/js/ssi_uploader/styles/ssi-uploader.css");

AppCurdAsset::addCss($this,"/static/js/select2/css/select2.min.css");
AppCurdAsset::addScript($this,"/static/js/select2/js/select2.full.min.js");
?>

<div id="uploader" class="wu-example">
    <?php $attach_ids = Yii::$app->request->get("attach_ids"); if(!empty($attach_ids)){?> 
        <?php
            $attach_ids = explode(',',$attach_ids); 
            foreach($attach_ids as $attach_id){ ?>
                <input type="hidden" name="attach_ids[]" value="<?=$attach_id?>" />
            <?php }?>
    <?php }else{?>
    <p>素材文件：</p>
    <table class="ie table upload-warp">
        <tr>
            <td>
                <!--                <button type="button" class="upload-but sc-but green-but">上传</button>-->
                <!--                <button type="button" class="upload-but jc-but blue-but">清空</button>-->
                <input type="file" name="ssiupload" multiple id="ssiupload"/>
            </td>
        </tr>
    </table>
    <?php }?>

    <div class="box1"><span>分类：</span>
<!--        <input id="tag" name="tag" value="" type="text" placeholder="分类名称" class="form-control input-md" style="width:300px;">-->
        <select class="js-data-example-ajax form-control tag" style="width:500px"   name="tag[]" multiple="multiple"></select>
    </div>
</div>


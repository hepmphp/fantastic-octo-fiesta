<?php
use yii\widgets\LinkPager;
?>
<div class="page-bottom clearfix">
    <div class="pull-left pagination-detail">
        <!--            共计：11111角色-->
    </div>
    <div class="pull-right pagination">
            <span class="page-list">每页显示
        <span class="btn-group dropup">
            <select class="form-control"  id="per_page" onchange="change_page()">
                <option value="10"  <?php if(Yii::$app->request->get('per-page')==10){echo 'selected';}?>>10</option>
                <option value="20"  <?php if(Yii::$app->request->get('per-page')==20){echo 'selected';}?>>20</option>
                <option value="100" <?php if(Yii::$app->request->get('per-page')==100){echo 'selected';}?>>100</option>
                <option value="200" <?php if(Yii::$app->request->get('per-page')==200){echo 'selected';}?>>200</option>
            </select>
        </span>条</span>
        <?= LinkPager::widget(
            [
                'pagination' =>$page,
                'nextPageLabel' => '下一页',
                'prevPageLabel' => '上一页',
                'firstPageLabel' => '首页',
                'lastPageLabel' => '尾页',
            ]); ?>

        <input class="form-control jump-page" id="jump_page" size="2" maxlength="7" type="text" style="width: 40px;" value="<?=Yii::$app->request->get('page')?>" onkeydown="keydown_go_page()" >
        <a href="javascript:void(0)" style="margin-right: 10px;" onclick="go_page()"  id="go_page">跳转</a>
    </div>
</div>
<script>
    function go_page(){
        var page = $('#jump_page').val();
        var search_url = window.location.href;
        search_url = search_url.replace(/&page=\d+/,'&page='+page);
        window.location.href = search_url;
    }
    function keydown_go_page(){
        if (event.keyCode == 13)
        {
            event.returnValue=false;
            event.cancel = true;
            $('#go_page').trigger('click');
        }
    }
    function change_page(){
        var per_page = $('#per_page').val();
        var search_url = window.location.href;
        if(search_url.indexOf('per-page')!==-1){
            search_url = search_url.replace(/per-page=\d+/,'per-page='+per_page);
        }else{
            search_url = search_url+'&per-page='+per_page;
        }
        window.location.href = search_url;
    }
</script>
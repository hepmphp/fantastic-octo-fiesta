<div class="container col-sm-12">
<form class="form-horizontal">
        <!-- Select Basic -->
        <div class="form-group inline-block">
            <label class="col-md-2 control-label" for="parentid">上级</label>
            <div class="col-md-4">
                <select id="parentid" name="parentid" class="form-control">
                    <option value="0">作为一级菜单</option>
                    <?=$config_menu?>
                </select>
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="name">菜单名称</label>
            <div class="col-md-4">
                <input id="name" name="name" value="<?=$form['name']?>" type="text" placeholder="菜单名称" class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="model">控制器</label>
            <div class="col-md-4">
                <input id="model" name="model"  value="<?=$form['model']?>" type="text" placeholder="控制器" class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="action">方法</label>
            <div class="col-md-4">
                <input id="action" name="action"  value="<?=$form['action']?>" type="text" placeholder="方法" class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="data">参数</label>
            <div class="col-md-4">
                <input id="data" name="data"  value="<?=$form['data']?>" type="text" placeholder="参数" class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group inline-block">
            <label class="col-md-2 control-label" for="listorder">排序</label>
            <div class="col-md-4">
                <input id="listorder" name="listorder"  value="<?=$form['listorder']?>" type="text" placeholder="排序" class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="remark">备注</label>
            <div class="col-md-4">
                <input id="remark" name="remark"  value="<?=$form['remark']?>" type="text" placeholder="备注" class="form-control input-md">

            </div>
        </div>

        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-2 control-label" for="status">状态</label>
            <div class="col-md-4">
                <select id="status" name="status" class="form-control">
                    <?php
                        foreach($config_status as $k=>$vo){
                    ?>
                    <option value="<?=$vo['id']?>" <?php if($vo['id']==$form['status']){ echo "selected";}?>><?=$vo['name']?></option>
                    <?php }?>
                </select>
            </div>
        </div>

</form>
</div>
<script>
    var parent_id = "<?=$form['parentid']?>";
</script>

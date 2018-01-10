<div class="container col-sm-12">
    <form class="form-horizontal">
        <input type="hidden" name="id" id="id" value="<?=$form['id']?>">
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="name">账号:</label>
            <div class="col-md-4">
                <input id="username" name="username" value="<?=$form['username']?>" type="text" placeholder="账号" class="form-control input-md">

            </div>
        </div>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="model">姓名</label>
            <div class="col-md-4">
                <input id="realname" name="realname"  value="<?=$form['realname']?>" type="text" placeholder="姓名" class="form-control input-md">
            </div>
        </div>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="action">密码</label>
            <div class="col-md-4">
                <input id="password" name="password"  value="" type="password" placeholder="密码" class="form-control input-md">

            </div>
        </div>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="action">确认密码</label>
            <div class="col-md-4">
                <input id="repassword" name="repassword" type="password" value="" type="text" placeholder="确认密码" class="form-control input-md">

            </div>
        </div>

        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-2 control-label" for="status">所属分组</label>
            <div class="col-md-4">
                <select id="group_id" name="group_id" class="form-control">
                    <?php
                    foreach($config_group_id as $k=>$vo){
                        ?>
                        <option value="<?=$vo['id']?>" <?php if($vo['id']==$form['group_id']){ echo "selected";}?>><?=$vo['name']?></option>
                    <?php }?>
                </select>
            </div>
        </div>
        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-2 control-label" for="status">所属平台</label>
            <div class="col-md-4">
                <select id="platform_id" name="platform_id" class="form-control">
                    <?php
                    foreach($config_platform_id as $k=>$vo){
                        ?>
                        <option value="<?=$vo['id']?>" <?php if($vo['id']==$form['platform_id']){ echo "selected";}?>><?=$vo['name']?></option>
                    <?php }?>
                </select>
            </div>
        </div>

    </form>
</div>


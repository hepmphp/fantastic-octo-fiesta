<div class="container col-sm-12">
    <form class="form-horizontal">
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="name">账号:</label>
            <div class="col-md-4">
                <input id="username" name="username" value="<?=Yii::$app->session['admin_user.username']?>" type="text" placeholder="账号" readonly="readonly" class="form-control input-md">

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
    </form>
</div>


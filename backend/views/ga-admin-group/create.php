<div class="form-item">
    <form class="clearfix" role="form">
        <input type="hidden" id="id" value="<?=$form['id']?>">
        <div class="form-group">
            <label class="control-label">分组名称：</label>
            <input  class="form-control int180" type="text" id="name" value="<?=$form['name']?>">
        </div>
        <div class="form-group">
            <label class="control-label">分组说明：</label>
            <textarea class="form-control" rows="4" id="comment"><?=$form['comment']?></textarea>
        </div>
        <div class="form-group">
            <input name="allow_mutil_login" id="allow_mutil_login" type="checkbox" <?php if($form['allow_mutil_login']==1){?>checked="checked"<?php }?> value="1">
            <label class="control-label">多人同时登录</label>
        </div>

    </form>
</div>

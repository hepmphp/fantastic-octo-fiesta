<div class="container col-sm-12" style="margin-top: 10px;">
    <div class="form-horizontal">
        <input type="hidden" id="id" value="<?=$form['id']?>">
                <div class="form-group">
          <label class="col-sm-4 control-label" for="name">名称</label>
          <div class="col-sm-4">
          <input id="name" name="name" type="text" value="<?=$form['name']?>" placeholder="名称" class="form-control input-md">
          </div>
       </div>
        <!-- Select Basic -->
        <div class="form-group">
          <label class="col-sm-4 control-label" for="parent_id">父级id</label>
          <div class="col-sm-4">
            <select id="parent_id" name="parent_id" class="form-control">
              <option value="">请选择</option>
              <option value="0">顶级菜单</option>
                <?=$select_tree?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-4 control-label" for="description">描述</label>
          <div class="col-sm-4">
          <input id="description" name="description" type="text" value="<?=$form['description']?>" placeholder="描述" class="form-control input-md">
          </div>
       </div>

    </div>
</div>
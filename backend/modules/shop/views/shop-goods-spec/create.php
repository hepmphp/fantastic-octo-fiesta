<div class="container col-sm-12" style="margin-top: 10px;">
    <div class="form-horizontal">
        <input type="hidden" id="id" value="<?=$form['id']?>">
                <!-- Select Basic -->
        <div class="form-group">
          <label class="col-sm-4 control-label" for="cate_id">商品类型</label>
          <div class="col-sm-4">
            <select id="cate_id" name="cate_id" class="form-control">
              <option value="">请选择</option>
                <?=$select_tree?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-4 control-label" for="name">规格名称</label>
          <div class="col-sm-4">
          <input id="name" name="name" type="text" value="<?=$form['name']?>" placeholder="规格名称" class="form-control input-md">
          </div>
       </div>
        <!-- Textarea -->
        <div class="form-group">
          <label class="col-sm-4 control-label" for="items">规格项</label>
          <div class="col-sm-4">
            <textarea class="form-control" id="items" name="items">default text</textarea>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-4 control-label" for="rank">排序</label>
          <div class="col-sm-4">
          <input id="rank" name="rank" type="text" value="<?=$form['rank']?>" placeholder="排序" class="form-control input-md">
          </div>
       </div>

    </div>
</div>
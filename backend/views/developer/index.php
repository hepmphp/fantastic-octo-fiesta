<div class="form-wrapper">
    <div class="form-item">
        <form class="form-inline clearfix" role="form">
            <input type="hidden" name="r" value="<?=Yii::$app->request->get('r')?>">
            <input type="hidden" name="iframe" value="1">
            <input type="hidden" name="search" value="1">
            <div class="form-group">
                <label class="control-label">表：</label>
                <select class="form-control" name="table" id="table">
                    <option value="">请选择</option>
                    <?php foreach($config_table_id as $k=>$v){ ?>
                        <option value="<?=$v['id']?>" <?php if($v['id']==Yii::$app->request->get('table')){ echo "selected";}?>><?=$v['name']?></option>
                    <?php }?>
                </select>
            </div>
            <button class="btn btn-info m-l" type="submit"> 查询</button>
            <button class="btn" id="preview" type="button">预览from</button>
            <button class="btn" type="button">生成from</button>
            <button class="btn" type="button" id="btn_js">生成js</button>
            <button class="btn" type="button" id="btn_search">生成搜索项</button>
            <button class="btn" type="button" id="btn_list">生成列表</button>
            <button class="btn" type="button" id="btn_controller">生成控制器</button>
        </form>

    </div>

    <div class="table-wrap">
        <table  data-toggle="table" class="table-item2 table inner-table">
            <thead>
            <tr>
                <th><input type="checkbox" class="chekck_all"></th>
                <th>生成类型</th>
                <th>验证类型</th>
                <th>字段</th>
                <th>字段名</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach($fields as $k=>$vo){ ?>
            <tr>
                <td><input type="checkbox" name="ids[]" value="<?=$k?>"></td>
                <td>
                    <select  name="form_builder_type[]" class="form-control form_builder_type">
                        <?php
                        foreach($config_form_builder_type as $t=>$fb){
                            ?>
                            <option value="<?=$t?>"><?=$fb?></option>
                        <?php }?>
                    </select>
                </td>
                <td></td>
                <td><?=$k?></td>
                <td><?=$vo?></td>
            </tr>
            <?php }?>
            </tbody>
        </table>
    </div>
</div>

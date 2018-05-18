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
          
            <button class="btn" type="button" id="btn_js">预览js</button>
            <!-- <button class="btn" type="button" id="btn_search">生成搜索项</button> -->
            <button class="btn" type="button" id="btn_model">预览模型</button>
            <button class="btn" type="button" id="btn_list">预览列表</button>
            <button class="btn" type="button" id="btn_controller">预览控制器</button>
        </form>

    </div>

    <div class="table-wrap">
        <table  data-toggle="table" class="table-item2 table inner-table">
            <thead>
            <tr>
                <th><input type="checkbox" class="chekck_all"></th>
                <th>字段名</th>
                <th>字段</th>
                <th>表单类型</th>
                <th>列表搜索</th>
                <th>控制器搜索</th>
                <th>验证类型</th>

            </tr>
            </thead>
            <tbody>
            <?php foreach($fields as $k=>$vo){ ?>
            <tr>
                <td><input type="checkbox" name="ids[]" value="<?=$k?>"></td>
                <td><?=$vo?></td>
                <td><?=$k?></td>
                <td>
                    <select  name="form_builder_type[]" class="form-control form_builder_type">
                        <?php
                        foreach($config_form_builder_type as $t=>$fb){
                            ?>
                            <option value="<?=$t?>"><?=$fb?></option>
                        <?php }?>
                    </select>
                </td>
                <td>
                    <select  name="search_list_type[]" class="form-control search_list_type">
                        <?php
                        foreach($config_search_list_type as $t=>$fb){
                            ?>
                            <option value="<?=$t?>"><?=$fb?></option>
                        <?php }?>
                    </select>
                </td>
                <td>
                    <select  name="search_builder_type[]" class="form-control search_builder_type">
                        <?php
                        foreach($config_search_builder_type as $t=>$fb){
                            ?>
                            <option value="<?=$t?>"><?=$fb?></option>
                        <?php }?>
                    </select>
                </td>

                <td>
                    <select  name="form_validator_type[]" class="form-control form_validator_type">
                        <?php
                        foreach($config_form_validator_type as $t=>$vt){
                            ?>
                            <option value="<?=$t?>"><?=$vt?></option>
                        <?php }?>
                    </select>
                </td>
            </tr>
            <?php }?>
            </tbody>
        </table>
    </div>
</div>

<div class="form-wrapper">
    <div class="form-item">
        <form class="form-inline clearfix" role="form">
            <input type="hidden" name="r" value="<?=Yii::$app->request->get('r')?>">
            <input type="hidden" name="iframe" value="1">
            <input type="hidden" name="search" value="1">
            <div class="form-group">
                <label class="control-label">表：</label>
                <select class="form-control" name="table">
                    <option value="">请选择</option>
                    <?php foreach($config_table_id as $k=>$v){ ?>
                        <option value="<?=$v['id']?>" <?php if($v['id']==Yii::$app->request->get('table')){ echo "selected";}?>><?=$v['name']?></option>
                    <?php }?>
                </select>
            </div>
            <button class="btn btn-info m-l" type="submit"> 查询</button>
        </form>

    </div>

    <div class="table-wrap">
        <table  data-toggle="table" class="table-item2 table inner-table">
            <thead>
            <tr>
                <th>选项</th>
                <th>生成类型</th>
                <th>验证类型</th>
                <th>字段</th>
                <th>字段名</th>

            </tr>
            </thead>
            <tbody>
            <?php foreach($fields as $k=>$vo){ ?>
            <tr>
                <td><input type="checkbox" ></td>
                <td></td>
                <td></td>
                <td><?=$k?></td>
                <td><?=$vo?></td>
            </tr>
            <?php }?>
            </tbody>
        </table>
    </div>
</div>

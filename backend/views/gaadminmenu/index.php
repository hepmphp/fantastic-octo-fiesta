<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/layer/layer.js"></script>
<script src="/static/js/common.js"></script>

<script type="text/javascript">
    layer.config({
        skin:'layer-ext-moon',
        extend:'moon/style.css'
    });
</script>

<div class="" style="width: 1760px;">
    <div class="top">
        <form id="searchform" action="" method="get">
            <!--            <input type="hidden" value="Core" name="g">-->
            <input type="hidden" value="{$Think.MODULE_NAME}" name="m">
            <input type="hidden" value="{$Think.ACTION_NAME}" name="a">

            <!--            <span class="part jh-2">-->
            <!--              <span>项目：</span>-->
            <!--                      <select class="sel" id="app_id" name="app_id">-->
            <!--                          {volist name="config_app" id="vo"}-->
            <!--                          <option value="{$vo.id}" {eq name="vo.id" value="$search['app_id']"}selected{/eq}>{$vo.name}</option>-->
            <!--                          {/volist}-->
            <!--                      </select>-->
            <!--            </span>-->
            <!--                <input class="button bgbut" name="search" value="查询" type="submit" style="width:60px;">-->
            <input class="btn btn-info m-l" name="search" value="添加" id="add_adminmenu" type="button" style="width:60px;">
        </form>

    </div>
    <link rel="stylesheet" href="<?=$asset->baseUrl?>/static/js/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <div class="zTreeDemoBackground left">
        <ul id="treeDemo" class="ztree"></ul>
    </div>
</div>
<script>
    var zNodes = <?=$menu_data?>
</script>
<script src="/static/js/ztree/js/jquery.ztree.core.js"></script>
<script src="/static/js/ztree/js/jquery.ztree.excheck.js"></script>
<script src="/static/js/ztree/js/jquery.ztree.exedit.js"></script>
<script src="/static/js/logic/gaadminmenu/tree.js"></script>







<input type="hidden" id="id" value="<?=Yii::$app->request->get('id')?>">
<div class="zTreeDemoBackground left">
    <ul id="treeDemo" class="ztree"></ul>
</div>
<script>
    var zNodes = <?=$menu_data?>;
    var group_mids = <?=$group_mids?>;
</script>
<script src="<?=$asset->baseUrl?>/static/js/jquery.min.js"></script>
<link rel="stylesheet" href="<?=$asset->baseUrl?>/static/js/ztree/css/metroStyle/metroStyle.css" type="text/css">
<script src="<?=$asset->baseUrl?>/static/js/ztree/js/jquery.ztree.core.js"></script>
<script src="<?=$asset->baseUrl?>/static/js/ztree/js/jquery.ztree.excheck.js"></script>
<script src="<?=$asset->baseUrl?>/static/js/ztree/js/jquery.ztree.exedit.js"></script>
<script src="<?=$asset->baseUrl?>/static/js/logic/ga-admin-group/edit-permission.js"></script>


var setting = {
    check: {
    enable: true
    },
data: {
    simpleData: {
    enable: true
    }
},
edit: {
    //enable: true
    }
};
//var zNodes = {$menu_data};
//var group_mids = {$group_mids};
$(document).ready(function(){
    $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
    $.each(group_mids,function(i,v){
    console.log(v);
    node = zTree.getNodeByParam('id',v,null);
    console.log(node);
    if(node){
       zTree.checkNode(node, true, false);
    }
});
window.zTree = zTree;
//zTree.checkAllNodes(true);
});
var newCount = 1;
function addHoverDom(treeId, treeNode) {
    var sObj = $("#" + treeNode.tId + "_span");
    if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
    var addStr = "<span class='button add' id='addBtn_[tid]' data-id='[id]' title='add node'></span>";
    var editStr = "<span class='button edit' id='editBtn_[tid]' data-id='[id]' title='add node'></span>";
    addStr = addStr.replace('[tid]',treeNode.tId).replace('[id]',treeNode.id);
    editStr = editStr.replace('[tid]',treeNode.tId).replace('[id]',treeNode.id);
    addStr = addStr+editStr;
    sObj.after(addStr);
    var btn_add = $("#addBtn_"+treeNode.tId);
    if (btn_add){
    btn_add.bind("click", function(){
    add($(this).data('id'));
    });
}
var btn_edit = $("#editBtn_"+treeNode.tId);
    if (btn_edit){
        btn_edit.bind("click", function(){
            console.log($(this).data('id'));
            edit($(this).data('id'));
        });
    }
};
function removeHoverDom(treeId, treeNode) {
    $("#addBtn_"+treeNode.tId).unbind().remove();
    $("#editBtn_"+treeNode.tId).unbind().remove();
};


$('.div_permisssion').delegate(".perm_menu",'click',function(){
    var parentid = $(this).data('parentid');
    var menu_id = $(this).data('id');
    console.log(menu_id);
    var is_checked = $(this).is(':checked');
    if(is_checked){
        if(parentid!=0){
            $('.perm_menu'+parentid).prop( "checked", true );
        }else{
            $('.perm_menu'+menu_id).prop( "checked", true );
            $('.perm_submenu'+menu_id).prop( "checked", true );
        }
    }else{
        $('.perm_submenu'+menu_id).prop("checked",false);
        if(parentid!=0){
            $(this).removeAttr("checked");
        }else{

            $('.perm_submenu'+menu_id).removeAttr("checked")

        }
    }
});
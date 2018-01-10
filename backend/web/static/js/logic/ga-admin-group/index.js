/**
 * Created with JetBrains PhpStorm.
 * User: Administrator
 * Date: 18-1-10
 * Time: 上午10:36
 * To change this template use File | Settings | File Templates.
 */

function add(){
    var url = "?r=ga-admin-group/create";
    group_form(url);
}
function edit(id) {
    var url = "?r=ga-admin-group/update&id="+id;
    group_form(url,2);
}
//添加模板
function group_form(url,action){
    var content = url;
    var title = action==2?'修改':'添加';
    var btn =  action==2?['确认修改','取消']:['确认添加','取消'];
    layer.open({
        type: 2, //iframe
        area: ['500px', '400px'],
        title: title,
        btn: btn,
        shade: 0.3, //遮罩透明度
        content:content,
        yes: function(index, layero){
            var body = layer.getChildFrame('body', index);
            var param ={
                GaAdminGroup:{
                    id:body.find('#id').val(),
                    name:body.find('#name').val(),
                    comment:body.find('#comment').val(),
                    allow_mutil_login:body.find('#allow_mutil_login').is(":checked")==true?1:0
                }
            };
            var url = "?r=ga-admin-group/create";
            if(param.GaAdminGroup.id){
                var url = "?r=ga-admin-group/update&id="+param.GaAdminGroup.id;
            }
            layer.load(2);
            ajax_post(url,param);

        },btn2: function(index, layero){

        }
        // content:"{:U('Serverpolicy/add')}" //iframe的url
    });
}


function edit_permission(id){
    var url = "?r=ga-admin-group/edit-permission"+"&id="+id+"&iframe=1";
    permission_form(url,1);

}
//权限设置窗口
function permission_form(url,action){
    var content = url;
    var title = action==2?'设置用户权限':'设置用户权限';
    var btn =  action==2?['确认','取消']:['确认','取消'];
    layer.open({
        type: 2, //iframe
        area: ['720px', '510px'],
        title: title,
        btn: btn,
        shade: 0.3, //遮罩透明度
        content:content,
        yes: function(index, layero){
            console.log("tree ok...");
            var body = layer.getChildFrame('body', index);
            var iframeWin = window[layero.find('iframe')[0]['name']];
            //  console.log(iframeWin.zTree);
            var treeObj = iframeWin.zTree;
            var nodes = treeObj.getCheckedNodes(true);
            var mids = new Array();
            for (var i = 0; i < nodes.length; i++) {
                mids.push(nodes[i].id);
            }
            var param = {
                id:body.find('#id').val(),
                mids:mids
            };
            var index = layer.load(2);
            $.ajax({
                type:"POST",
                url: "?r=ga-admin-group/edit-permission",
                data:  param,
                timeout:"4000",
                dataType:"json",
                success: function(data){
                    layer.close(index);
                    if (data.status == 0) {
                        alert_success(data.msg);
                    }
                    else {
                        alert_fail(data.msg);
                    }
                }
            });
        },btn2: function(index, layero){

        }
        // content:"{:U('Serverpolicy/add')}" //iframe的url
    });
}

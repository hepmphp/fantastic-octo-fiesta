/**
 * Created with JetBrains PhpStorm.
 * User: hepm
 * Date: 18-4-22
 * Time: 下午11:26
 * To change this template use File | Settings | File Templates.
 */


var urls = {
    create_url:'?r=cms/default/create',
    update_url:'?r=cms/default/updatetag',
    delete_url:'?r=cms/default/delete'
};

/***
 * 添加
 */
function add(){
    var url = urls.create_url;
    layer_form(url,1,['1200px', '750px']);
}



function edit_tags(){
    var attach_ids = new Array();
    $('.image_border').each(function(){
        attach_ids.push($(this).data('id'));
    });
    var url = urls.create_url+"&attach_ids="+attach_ids.join(',');
    layer_form(url,2,['500px', '300px']);
}

/***
 * * @param id
 */
function del() {
    var attach_ids = new Array();
    $('.image_border').each(function(){
        attach_ids.push($(this).data('id'));
    });
    layer.confirm('确定要删除?',{
            btn: ['确定','取消'], //按钮
            icon: 3,
            title:'提示'
        }, function(){
            ajax_post(urls.delete_url,{ids:attach_ids.join(',')})
        },
        function(){

        }
    );
}


//表单
function layer_form(url,action,area){
    var content = url;
    var title = action==2?'修改':'添加';
    var btn =  action==2?['确认修改','取消']:['确认添加','取消'];
    layer.open({
        type: 2, //iframe
        area: area,
        title: title,
        btn: btn,
        shade: 0.3, //遮罩透明度
        content:content,
        yes: function(index, layero){
            var body = layer.getChildFrame('body', index);
            var tag_names = new Array();
            var attach_ids = new Array();
            body.find('.select2-selection__choice').each(function(){
                tag_names.push($(this).attr('title'));
               // console.log($(this).attr('title'));
            });
            body.find("input[name='attach_ids[]']").each(function(){
                attach_ids.push($(this).val());
//                console.log($(this).val());
            });
            var param ={
                attach_ids:attach_ids,
                tag_names:tag_names,
            };
            var url = urls.update_url;
            ajax_post(url,param);

        },btn2: function(index, layero){

        }
        // content:"{:U('Serverpolicy/add')}" //iframe的url
    });
}

$('.image_item').click(function(){
    if( $(this).children().hasClass('image_border')){
        $(this).children().removeClass('image_border');
    }else{
        $(this).children().addClass('image_border');

    }
});


/**
 * Created with JetBrains PhpStorm.
 * User: xiaoming
 * Date: 18-1-14
 * Time: 下午11:50
 * To change this template use File | Settings | File Templates.
 */

$('.chekck_all').click(function(){
    if(this.checked){
        $("input[name='ids[]']").each(function(){
            this.checked = true;
        });
    }else{
        $("input[name='ids[]']").each(function(){
            this.checked = false;
        });
    };
});

$('#preview').click(function(){
    var fields = new Array();
    var form_builder_types = new Array();
    var table = $('#table').val();
    $("input[name='ids[]']").each(function(){
        if(this.checked){
            var form_builder_type =  $(this).parent().parent().find('.form_builder_type').val();//查找对应的生成类型
            fields.push($(this).val());
            form_builder_types.push(form_builder_type);
        }
    });
    layer.open({
        type: 2, //iframe
        area: ['1200px', '750px'],
        title: '预览',
        btn: [],
        shade: 0.3, //遮罩透明度
        content:"?r=developer/preview&fields="+fields+"&form_builder_types="+form_builder_types+"&table="+table
    });
});

$('#btn_list').click(function(){
    var fields = new Array();
     var search_list_types = new Array();
    var table = $('#table').val();
    $("input[name='ids[]']").each(function(){
        if(this.checked){
            var search_list_types = $(this).parent().parent().find('.search_list_type').val();//查找对应的生成类型
            fields.push($(this).val());
            form_builder_types.push(form_builder_type);
            search_list_types.push(search_list_type);
        }
    });
    layer.open({
        type: 2, //iframe
        area: ['1200px', '750px'],
        title: '预览',
        btn: [],
        shade: 0.3, //遮罩透明度
        content:"?r=developer/create-list&fields="+fields+"&search_list_types="+search_list_types+"&table="+table
    });
});

$('#btn_controller').click(function(){
    var fields = new Array();
    var search_builder_types = new Array();
    var table = $('#table').val();
    $("input[name='ids[]']").each(function(){
        if(this.checked){
            var search_builder_type =  $(this).parent().parent().find('.search_builder_type').val();//查找对应的生成类型
            fields.push($(this).val());
            search_builder_types.push(search_builder_type);
        }
    });
    layer.open({
        type: 2, //iframe
        area: ['1200px', '750px'],
        title: '预览',
        btn: [],
        shade: 0.3, //遮罩透明度
        content:"?r=developer/create-controller&fields="+fields+"&search_builder_types="+search_builder_types+"&table="+table
    });
});

$('#btn_model').click(function(){
    var fields = new Array();
    var form_validator_types = new Array();
    var table = $('#table').val();
    $("input[name='ids[]']").each(function(){
        if(this.checked){
            var form_validator_type =  $(this).parent().parent().find('.form_validator_type').val();//查找对应的生成类型
            fields.push($(this).val());
            form_validator_types.push(form_validator_type);
        }
    });
    layer.open({
        type: 2, //iframe
        area: ['1200px', '750px'],
        title: '预览',
        btn: [],
        shade: 0.3, //遮罩透明度
        content:"?r=developer/create-model&fields="+fields+"&form_validator_types="+form_validator_types+"&table="+table
    });
});

$('#btn_js').click(function(){
    var create_js_url = '?r=developer/create-js';
    var fields = new Array();
    $("input[name='ids[]']").each(function(){
        if(this.checked){
            fields.push($(this).val());
        }
    });
  //  console.log(fields);
    var table = $('#table').val();
    layer.open({
        type: 2, //iframe
        area: ['1200px', '750px'],
        title: '预览',
        btn: [],
        shade: 0.3, //遮罩透明度
        content:create_js_url+"&table="+table+"&fields="+fields
    });
    //ajax_post(create_js_url,{table:$('#table').val()});
});
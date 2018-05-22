/**
 * Created with JetBrains PhpStorm.
 * User: Administrator
 * Date: 18-5-19
 * Time: 下午2:19
 * To change this template use File | Settings | File Templates.
 */


$(document).ready(function(){
        $("#block_id").autocomplete({
        source: function( request, response ) {
            console.log("autocomplete...");
            $.ajax( {
                url: "?r=cms/cms-ad-block/auto-compelete-search",
                dataType: "json",
                data: {
                    term: request.term
                },
                success: function( data ) {
                    response( data.data );
                }
            } );
        },
        minLength:1,
            select: function( event, ui ) {
            $('#block_id').val(ui.item.id);
            console.log(ui.item);
            //log( "Selected: " + ui.item.value + " aka " + ui.item.id );
        }
    });

});











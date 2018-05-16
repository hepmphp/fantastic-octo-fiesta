/**
 * Created with JetBrains PhpStorm.
 * User: hepm
 * Date: 18-5-7
 * Time: 下午10:49
 * To change this template use File | Settings | File Templates.
 */

var IMG_API_URL = "/?r=api/upload/index";
$('#ssiupload').ssi_uploader({
    url: IMG_API_URL,
    maxFileSize: 6,
    allowed: ['jpg', 'gif', 'txt', 'png', 'pdf']
    ,onEachUpload:function(file){
        if(file.responseMsg.status==0){
            // <input type="hidden" id="attach_ids[]" value="">
            var img_list = '<input type="hidden" name="attach_ids[]" value="'+file.responseMsg.data.id+'" />';
            $('#uploader').append(img_list);
        }
        console.log(file)
    },
    locale:"zh_CN"
});



$( function() {
    $('.js-data-example-ajax').select2({
        ajax: {
            url: '?r=cms/attach-cate/search',
            dataType: 'json',
            // Additional AJAX parameters go here; see the end of this chapter for the full code of this example,
            processResults: function (data) {
                console.log(data.data);
                // Tranforms the top-level key of the response object from 'items' to 'results'
                return {
                    results: data.data
                };
            },
            placeholder: 'Search for a repository',
            escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
            minimumInputLength: 1,
            templateResult: formatRepo,
            templateSelection: formatRepoSelection
        },

    });

    function formatRepo (repo) {
        if (repo.loading) {
            return repo.full_name;
        }
        return repo.full_name;
    }

    function formatRepoSelection (repo) {
        return repo.full_name || repo.text;
    }
//    $('#tag').select2({
//        ajax: {
//            url: "?r=cms/attach-cate/search",
//            dataType: 'json'
//            // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
//            data: function (params) {
//                cosole.log(params);
//                var query = {
//                    search: params.term,
//                    type: 'public'
//                }
//
//                // Query parameters will be ?search=[term]&type=public
//                return query;
//            }
//        }
//    });


//    $( "#tag" ).autocomplete({
//        source: function( request, response ) {
//            console.log("aaaaaaa");
//        $.ajax( {
//            url: "?r=cms/attach-cate/search",
//            dataType: "json",
//            data: {
//                term: request.term
//            },
//            success: function( data ) {
//                response( data.data );
//            }
//        } );
//},
//minLength:1,
//select: function( event, ui ) {
//    $('#tag').val(ui.item.id);
//    console.log(ui.item);
//    //log( "Selected: " + ui.item.value + " aka " + ui.item.id );
//    }
//} );
});

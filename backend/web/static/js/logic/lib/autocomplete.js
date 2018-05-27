/**
 * Created with JetBrains PhpStorm.
 * User: Administrator
 * Date: 18-5-22
 * Time: 上午11:29
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

$( function() {
    $('.js-data-example-ajax').select2({
        ajax: {
            url: '?r=cms/attach-cate/select2-search',
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
        }
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
});

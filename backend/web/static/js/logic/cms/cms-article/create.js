/**
 * Created with JetBrains PhpStorm.
 * User: Administrator
 * Date: 18-5-24
 * Time: 下午5:39
 * To change this template use File | Settings | File Templates.
 */

jQuery( function() {
    jQuery('#tag_ids').select2({
        ajax: {
            url: '?r=cms/cms-tag/select2-search',
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
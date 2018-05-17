<?php 
$html = <<<HTML
<div class="container col-sm-12" style="margin-top: 10px;">
    <div class="form-horizontal">
        <input type="hidden" id="id" value="[id]">
        [form_html]
    </div>
</div>
HTML;
$html = str_replace(array('[id]','[form_html]'),array($form['id'],$form_html),$html);
highlight_string($html);

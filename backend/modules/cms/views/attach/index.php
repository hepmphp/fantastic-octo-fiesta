<?php
use backend\assets\AppAsset;
AppAsset::register($this);
AppAsset::addCss($this,"/static/js/photoswipe/photoswipe.css");
AppAsset::addCss($this,"/static/js/photoswipe/default-skin/default-skin.css");


AppAsset::addScript($this,"/static/js/photoswipe/photoswipe.min.js");
AppAsset::addScript($this,"/static/js/photoswipe/photoswipe-ui-default.min.js");



use backend\components\PageWidget;
?>
<body class="form-body">
<div   class="form-wrapper"   style="padding-top: 0">
    <ul class="list-inline page-tab clearfix">
        <li class="cur"><a href="/?r=cms/attach/index&iframe=1">附件列表</a></li>
        <li><a href="/?r=cms/attach-cate/index&iframe=1">分类管理</a></li>
    </ul>
    <div class="form-item">
        <form class="form-inline clearfix" role="form">
            <input type="hidden" name="r" value="<?=Yii::$app->request->get('r')?>">
            <input type="hidden" name="iframe" value="1">
            <input type="hidden" name="search" value="1">
            <div class="form-group">
                <label class="control-label">分类名称：</label>
                <select id="cate_id" name="cate_id" class="form-control">
                    <option value="">请选择</option>
                    <?php
                    foreach($config_attach_cate_id as $k=>$vo){
                        ?>
                        <option value="<?=$vo['id']?>" <?php if(is_numeric(Yii::$app->request->get('cate_id')) && $vo['id']==Yii::$app->request->get('cate_id')){ echo "selected";}?>><?=$vo['name']?></option>
                    <?php }?>
                </select>
            </div>
            <div class="form-group">
                <label class="control-label">文件名：</label>
                <input type="text" class="form-control" name="name" value="<?=Yii::$app->request->get('name')?>">
            </div>

            <button class="btn btn-info m-l" type="submit"> 查询</button>
            <button class="btn btn-info m-l" type="button" onclick="add()"> 上传</button>
            <div class="btn-group">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    操作 <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" style=" top: 30px;">
                    <li><a href="javascrip:void(0)" onclick="edit_tags()">修改分类</a></li>
                    <li><a href="#">修改名称</a></li>
                    <li><a href="javascrip:void(0)" onclick="del()">删除</a></li>

                </ul>
            </div>
        </form>

    </div>




    <div class="my-gallery" itemscope itemtype="http://schema.org/ImageGallery">
        <?php foreach($data as $k=>$vo):?>

            <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
                <a href="javascript:void(0)" data-image="<?=$vo['file']?>" itemprop="contentUrl" data-size="<?=$vo['width']?>x<?=$vo['height']?>" class="image_item">
                    <img src="<?=$vo['file']?>" itemprop="thumbnail" alt="Image description" data-id="<?=$vo['id']?>"/>
                </a>
                <figcaption itemprop="caption description"><?=$vo['name']?></figcaption>

            </figure>
        <?php endforeach;?>


    </div>

    <?= PageWidget::widget(['page' => $page]) ?>



</div>



    <!-- Root element of PhotoSwipe. Must have class pswp. -->
    <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">

        <!-- Background of PhotoSwipe.
             It's a separate element, as animating opacity is faster than rgba(). -->
        <div class="pswp__bg"></div>

        <!-- Slides wrapper with overflow:hidden. -->
        <div class="pswp__scroll-wrap">

            <!-- Container that holds slides. PhotoSwipe keeps only 3 slides in DOM to save memory. -->
            <!-- don't modify these 3 pswp__item elements, data is added later on. -->
            <div class="pswp__container">
                <div class="pswp__item"></div>
                <div class="pswp__item"></div>
                <div class="pswp__item"></div>
            </div>

            <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
            <div class="pswp__ui pswp__ui--hidden">

                <div class="pswp__top-bar">

                    <!--  Controls are self-explanatory. Order can be changed. -->

                    <div class="pswp__counter"></div>

                    <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>

                    <button class="pswp__button pswp__button--share" title="Share"></button>

                    <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>

                    <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>

                    <!-- Preloader demo https://codepen.io/dimsemenov/pen/yyBWoR -->
                    <!-- element will get class pswp__preloader--active when preloader is running -->
                    <div class="pswp__preloader">
                        <div class="pswp__preloader__icn">
                            <div class="pswp__preloader__cut">
                                <div class="pswp__preloader__donut"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                    <div class="pswp__share-tooltip"></div>
                </div>

                <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)">
                </button>

                <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)">
                </button>

                <div class="pswp__caption">
                    <div class="pswp__caption__center"></div>
                </div>

            </div>

        </div>

    </div>
    <style>
        .my-gallery {
            width: 100%;
            height:75%;
            /*float: left;*/
        }
        .my-gallery img {
            width:160px;
            height: 160px;
        }
        .my-gallery figure {
            display: block;
            float: left;
            margin: 0 5px 5px 0;
            width: 160px;
        }
        .my-gallery figcaption {
            text-align: center;
            border: 1px solid;
            /*display: none;*/
        }
        .image_border{
            background:#3b8cff;
            border: 2px solid #3b8cff;
        }
    </style>
<script>

var initPhotoSwipeFromDOM = function(gallerySelector) {
    console.log(gallerySelector);

    // parse slide data (url, title, size ...) from DOM elements
    // (children of gallerySelector)
    var parseThumbnailElements = function(el) {
        var thumbElements = el.childNodes,
            numNodes = thumbElements.length,
            items = [],
            figureEl,
            linkEl,
            size,
            item;

        for(var i = 0; i < numNodes; i++) {

            figureEl = thumbElements[i]; // <figure> element

            // include only element nodes
            if(figureEl.nodeType !== 1) {
                continue;
            }

            linkEl = figureEl.children[0]; // <a> element

            size = linkEl.getAttribute('data-size').split('x');

            // create slide object
            item = {
                src: linkEl.getAttribute('data-image'),
                w: parseInt(size[0], 10),
                h: parseInt(size[1], 10)
            };



            if(figureEl.children.length > 1) {
                // <figcaption> content
                item.title = figureEl.children[1].innerHTML;
            }

            if(linkEl.children.length > 0) {
                // <img> thumbnail element, retrieving thumbnail url
                item.msrc = linkEl.children[0].getAttribute('src');
            }

            item.el = figureEl; // save link to element for getThumbBoundsFn
            items.push(item);
        }

        return items;
    };

    // find nearest parent element
    var closest = function closest(el, fn) {
        return el && ( fn(el) ? el : closest(el.parentNode, fn) );
    };

    // triggers when user clicks on thumbnail
    var onThumbnailsClick = function(e) {
        e = e || window.event;
        e.preventDefault ? e.preventDefault() : e.returnValue = false;

        var eTarget = e.target || e.srcElement;

        // find root element of slide
        var clickedListItem = closest(eTarget, function(el) {
            return (el.tagName && el.tagName.toUpperCase() === 'FIGURE');
        });

        if(!clickedListItem) {
            return;
        }

        // find index of clicked item by looping through all child nodes
        // alternatively, you may define index via data- attribute
        var clickedGallery = clickedListItem.parentNode,
            childNodes = clickedListItem.parentNode.childNodes,
            numChildNodes = childNodes.length,
            nodeIndex = 0,
            index;

        for (var i = 0; i < numChildNodes; i++) {
            if(childNodes[i].nodeType !== 1) {
                continue;
            }

            if(childNodes[i] === clickedListItem) {
                index = nodeIndex;
                break;
            }
            nodeIndex++;
        }



        if(index >= 0) {
            // open PhotoSwipe if valid index found
            openPhotoSwipe( index, clickedGallery );
        }
        return false;
    };

    // parse picture index and gallery index from URL (#&pid=1&gid=2)
    var photoswipeParseHash = function() {
        var hash = window.location.hash.substring(1),
            params = {};

        if(hash.length < 5) {
            return params;
        }

        var vars = hash.split('&');
        for (var i = 0; i < vars.length; i++) {
            if(!vars[i]) {
                continue;
            }
            var pair = vars[i].split('=');
            if(pair.length < 2) {
                continue;
            }
            params[pair[0]] = pair[1];
        }

        if(params.gid) {
            params.gid = parseInt(params.gid, 10);
        }

        return params;
    };

    var openPhotoSwipe = function(index, galleryElement, disableAnimation, fromURL) {
        var pswpElement = document.querySelectorAll('.pswp')[0],
            gallery,
            options,
            items;

        items = parseThumbnailElements(galleryElement);

        // define options (if needed)
        options = {

            // define gallery index (for URL)
            galleryUID: galleryElement.getAttribute('data-pswp-uid'),

            getThumbBoundsFn: function(index) {
                // See Options -> getThumbBoundsFn section of documentation for more info
                var thumbnail = items[index].el.getElementsByTagName('img')[0], // find thumbnail
                    pageYScroll = window.pageYOffset || document.documentElement.scrollTop,
                    rect = thumbnail.getBoundingClientRect();

                return {x:rect.left, y:rect.top + pageYScroll, w:rect.width};
            }

        };

        // PhotoSwipe opened from URL
        if(fromURL) {
            if(options.galleryPIDs) {
                // parse real index when custom PIDs are used
                // http://photoswipe.com/documentation/faq.html#custom-pid-in-url
                for(var j = 0; j < items.length; j++) {
                    if(items[j].pid == index) {
                        options.index = j;
                        break;
                    }
                }
            } else {
                // in URL indexes start from 1
                options.index = parseInt(index, 10) - 1;
            }
        } else {
            options.index = parseInt(index, 10);
        }

        // exit if index not found
        if( isNaN(options.index) ) {
            return;
        }

        if(disableAnimation) {
            options.showAnimationDuration = 0;
        }

        // Pass data to PhotoSwipe and initialize it
        gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
        gallery.init();
    };

    // loop through all gallery elements and bind events
    var galleryElements = document.querySelectorAll( gallerySelector );


    for(var i = 0, l = galleryElements.length; i < l; i++) {
        galleryElements[i].setAttribute('data-pswp-uid', i+1);
        galleryElements[i].ondblclick = onThumbnailsClick;
        console.log( galleryElements[i]);
    }



    // Parse URL and open gallery if it contains #&pid=3&gid=1
    var hashData = photoswipeParseHash();
    if(hashData.pid && hashData.gid) {
        openPhotoSwipe( hashData.pid ,  galleryElements[ hashData.gid - 1 ], true, true );
    }
};

// execute above function
initPhotoSwipeFromDOM('.my-gallery');


</script>
  // 上传图片
var imgNum=0;
var offsBooL=true;
var uploaderApi = '?r=api/upload-mutil/index';
uploadImg();
function uploadImg(){
$(".upload-img input").eq(imgNum).change(function() {
    var that=$(this);
    console.log(that);
    console.log(imgNum);
      var formdata=new FormData();
      formdata.append('image',this.files[0]);
        var str='<div class="upload-img left"><img src="" alt=""><input type="file" name="images" style="opacity:0" accept="image/*" capture="camera"/><i class="iconfont icon-lajitong"></i><i class="iconfont icon-tianjia"></i><div class="over-cover"></div></div>';
        $.ajax({
          type: 'POST',
          url: uploaderApi,
          data: formdata,
          async: false,
          processData: false,
          contentType: false,
          dataType: 'json',
         // headers: { 'X-CSRF-TOKEN': dataType },
          success: function (result) {
            that.data('name',result.data.name);
            that.css({'z-index':'0'});
            that.parents().find(".upload-win .icon-tianjia").hide();
            that.parents().find(".upload-win img").eq(imgNum).attr({'src':result.data.url});
            imgNum ++;
            that.parents().find(".upload-win").append(str);
            uploadImg()
          }
        })
        $('.upload-img').mouseover(function(){
          if($(this).children('img').attr('src') !==''){
            $(this).children('.icon-lajitong').show();
            $(this).children('.over-cover').show();
          }
          $('.icon-lajitong').click(function(){
            $(this).parent().remove();
            if(offsBooL){
              offsBooL=false;
              setTimeout(function(){
                offsBooL=true;
                imgNum --;
              }, 50);
            }
          })
        })
        $('.upload-img').mouseout(function(){
          $('.icon-lajitong').hide();
          $('.over-cover').hide();
        })
  })
}
// 上传图片   
 
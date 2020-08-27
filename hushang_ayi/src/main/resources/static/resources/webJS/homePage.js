let element = layui.element,
    username = document.cookie.split("; ")[0].split("=")[1],
    userPower = document.cookie.split("; ")[1].split("=")[1],
    pathWeb = getRootPathWeb();
$(".layui-icon-spread-left").hide();

$("#username").html(username);
$(".logo").html("ONE PIECE");
if(userPower !== "0"){
    $(".onePiece").hide();
}

$("li>a").click(function (e) {
    e.preventDefault();
    $("#iframeMain").attr("src", $(this).attr("href"));
});

let isShow = true;  //定义一个标志位
$('.shouSuo').click(function(){
    //选择出所有的span，并判断是不是hidden
    $('.layui-nav-item span').each(function(){
        if($(this).is(':hidden')){
            $(this).show();
        }else{
            $(this).hide();
            $(".header").show();
            $(".layui-icon-username").show();
        }
    });
    //判断isShow的状态
    if(isShow){
        $('.layui-side').width(45); //设置宽度
        $(".layui-icon-shrink-right").hide();
        $(".layui-icon-spread-left").show();
        $('.layui-logo').css('left', '-155px');
        $('.layui-icon-android').css('left', '-8px');
        $('.layui-icon-ios').css('left', '-8px');
        $('.layui-icon-windows').css('left', '-8px');
        $('.layui-icon-rate-solid').css('left', '-8px');
        //将footer和body的宽度修改
        $('.layui-layout-left').css('left', 45+'px');
        $('.layui-body').css('left', 45+'px');
        $('.layui-footer').css('left', 45+'px');
        isShow = false;
    }else{
        $('.layui-side').width(200);
        $(".layui-icon-shrink-right").show();
        $(".layui-icon-spread-left").hide();
        $('.layui-logo').css('left', '0px');
        $('.layui-icon-android').css('left', '0px');
        $('.layui-icon-ios').css('left', '0px');
        $('.layui-icon-windows').css('left', '0px');
        $('.layui-icon-rate-solid').css('left', '0px');
        $('.layui-layout-left').css('left', 200+'px');
        $('.layui-body').css('left', 200+'px');
        $('.layui-footer').css('left', 200+'px');
        isShow = true;
    }
});

$('.refresh').click(function(){
    location.reload();
});

function out(){
    window.top.location.href = pathWeb;
}
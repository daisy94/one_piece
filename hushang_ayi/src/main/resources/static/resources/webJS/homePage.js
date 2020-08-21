let element = layui.element,
    username = document.cookie.split("; ")[0].split("=")[1],
    userPower = document.cookie.split("; ")[1].split("=")[1],
    pathWeb = getRootPathWeb();

$(document).ready(function(){

    $("li>a").click(function (e) {
        e.preventDefault();
        $("#iframeMain").attr("src", $(this).attr("href"));
    });
    $("#username").html(username);
    $(".logo").html("奶茶记账账");
    if(userPower !== "0"){
        $(".onePiece").hide();
    }
});

let isShow = true;  //定义一个标志位
$('.shouSuo').click(function(){
    //选择出所有的span，并判断是不是hidden
    $('.layui-nav-item span').each(function(){
        if($(this).is(':hidden')){
            $(this).show();
        }else{
            $(this).hide();
            $("#username").show();
            $(".layui-icon-username").show();
        }
    });
    //判断isshow的状态
    if(isShow){
        $('.layui-side.layui-bg-black').width(45); //设置宽度
        $('.layui-icon-android').css('left', '-8px');
        $('.layui-icon-ios').css('left', '-8px');
        $('.layui-icon-windows').css('left', '-8px');
        $('.layui-icon-rate-solid').css('left', '-8px');
        $('.shouSuo').css('padding-left', '12px');
        //将footer和body的宽度修改
        $('.layui-body').css('left', 45+'px');
        $('.layui-footer').css('left', 45+'px');
        //将二级导航栏隐藏
        /*$('dd span').each(function(){
            $(this).hide();
        });*/
        //修改标志位
        isShow = false;
    }else{
        $('.layui-side.layui-bg-black').width(200);
        $('.layui-icon-android').css('left', '0px');
        $('.layui-icon-ios').css('left', '0px');
        $('.layui-icon-windows').css('left', '0px');
        $('.layui-icon-rate-solid').css('left', '0px');
        $('.shouSuo').css('padding-left', '85px');
        $('.layui-body').css('left', 200+'px');
        $('.layui-footer').css('left', 200+'px');
        /*$('dd span').each(function(){
            $(this).show();
        });*/
        isShow = true;
    }
});

$('.refresh').click(function(){
    location.reload();
});

function out(){
    window.top.location.href = pathWeb;
}
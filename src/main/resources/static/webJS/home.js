let element = layui.element,
    $ = layui.jquery,
    layer = layui.layer;

$(".logo").html("ONE PIECE");

$("li>a").click(function (e) {
    //阻止超链接的默认跳转事件
    e.preventDefault();
    $("#iframeMain").attr("src", $(this).attr("href"));
});

let isShow = true;  //定义一个标志位
function switchLength() {
    //选择出所有的span，并判断是不是hidden
    $('.layui-nav-item span').each(function () {
        if ($(this).is(':hidden')) {
            $(this).show();
        } else {
            $(this).hide();
            $(".header").show();
            $(".layui-icon-username").show();
        }
    });
    //判断isShow的状态
    if (isShow) {
        $('.layui-side').width(45); //设置宽度
        $("#layui-icon-shrink").attr("class", "layui-icon layui-icon-spread-left");
        $('.layui-logo').css('left', '-155px');
        $('.layui-icon-rate-solid').css('left', '-8px');
        $('.layui-icon-picture').css('left', '-8px');
        //将footer和body的宽度修改
        $('.layui-layout-left').css('left', 45 + 'px');
        $('.layui-body').css('left', 45 + 'px');
        $('.layui-footer').css('left', 45 + 'px');
        isShow = false;
    } else {
        $('.layui-side').width(200);
        $("#layui-icon-shrink").attr("class", "layui-icon layui-icon-shrink-right");
        $('.layui-logo').css('left', '0px');
        $('.layui-icon-rate-solid').css('left', '0px');
        $('.layui-icon-picture').css('left', '0px');
        $('.layui-layout-left').css('left', 200 + 'px');
        $('.layui-body').css('left', 200 + 'px');
        $('.layui-footer').css('left', 200 + 'px');
        isShow = true;
    }
}

function out() {
    layer.confirm("确定要退出了吗？", {
        title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
        icon: 3
    }, function () {
        $.ajax({
            type: "POST",
            url: "/logout",
            success: function (result) {
                if (result.code === 0) {
                    window.top.location.href = "/";
                } else {
                    layer.msg(result.msg, {
                        anim: 0
                    });
                }
            }
        });
    });
}
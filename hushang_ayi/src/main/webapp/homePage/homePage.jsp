<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>沪上阿姨丹阳店</title>
  <link rel="stylesheet" href="../resources/layui/css/layui.css">
</head>
<body class="layui-layout-body close-footer" bgcolor="#F2F2F2">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo"><h3 class="logo"></h3></div>
            <!-- 头部区域（可配合layui已有的水平导航） -->
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <span class="layui-icon layui-icon-user"></span>&nbsp;&nbsp;<span id="username"></span>
                </li>
                <li class="layui-nav-item"><a href="javascript:void(0)" onclick="out()">退出</a></li>
            </ul>
        </div>
        <div class="layui-side layui-bg-black">
            <div class="layui-side-scroll">
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <div title="菜单缩放" class="kit-side-fold" style="height: 30px;"><a href="javascript:void(0)"></a></div>
                <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                    <li class="layui-nav-item">
                        <a class="layui-icon layui-icon-android" style="font-size: 20px" href="<%=basePath%>zhichu/zhichu.jsp"><span>&nbsp;&nbsp;每日支出</span></a>
                    </li>
                    <li class="layui-nav-item">
                        <a class="layui-icon layui-icon-ios" style="font-size: 20px" href="<%=basePath%>shouru/shouru.jsp"><span>&nbsp;&nbsp;每日收入</span></a>
                    </li>
                    <li class="layui-nav-item">
                        <a class="layui-icon layui-icon-windows" style="font-size: 20px" href="<%=basePath%>gongzi/gongzi.jsp"><span>&nbsp;&nbsp;工资薪金</span></a>
                    </li>
                    <li class="layui-nav-item">
                        <a class="layui-icon layui-icon-rate" style="font-size: 20px" href="<%=basePath%>touzi/touzi.jsp"><span>&nbsp;&nbsp;投资金额</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="layui-body" style="overflow: hidden;">
            <!-- 内容主体区域 -->
            <iframe src="<%=basePath%>zhichu/zhichu.jsp" frameborder="0" id="iframeMain" style="width: 100%;height: 100%"></iframe>
        </div>
        <div class="layui-footer">
            <!-- 底部固定区域 -->
            © Kiwi - 其实我并不想留这个，但是我不知道怎么去掉
        </div>
    </div>
    <script src="../resources/layui/layui.all.js"></script>
    <script src="../resources/jquery/jquery-1.11.3.min.js"></script>

    <script type="text/javascript">
        let element = layui.element;
        let username = document.cookie.split("; ")[0].split("=")[1];

        $(document).ready(function(){

            $("li>a").click(function (e) {
                e.preventDefault();
                $("#iframeMain").attr("src",$(this).attr("href"));
            });
            $("#username").html(username);
            $(".logo").html("沪上阿姨丹阳店");
        });

        var isShow = true;  //定义一个标志位
        $('.kit-side-fold').click(function(){
            //选择出所有的span，并判断是不是hidden
            $('.layui-nav-item span').each(function(){
                if($(this).is(':hidden')){
                    $(this).show();
                }else{
                    $(this).hide();
                    $("#username").show();
                    $(".layui-icon-user").show();
                }
            });
            //判断isshow的状态
            if(isShow){
                $('.layui-side.layui-bg-black').width(45); //设置宽度
                $('.layui-icon-android').css('left', '-8px');
                $('.layui-icon-ios').css('left', '-8px');
                $('.layui-icon-windows').css('left', '-8px');
                $('.layui-icon-rate').css('left', '-8px');
                //$('.kit-side-fold i').css('margin-right', '70%');  //修改图标的位置
                //将footer和body的宽度修改
                $('.layui-body').css('left', 45+'px');
                $('.layui-footer').css('left', 45+'px');
                //将二级导航栏隐藏
                /*$('dd span').each(function(){
                    $(this).hide();
                });*/
                //修改标志位
                isShow =false;
            }else{
                $('.layui-side.layui-bg-black').width(200);
                $('.layui-icon-android').css('left', '0px');
                $('.layui-icon-ios').css('left', '0px');
                $('.layui-icon-windows').css('left', '0px');
                $('.layui-icon-rate').css('left', '0px');
                //$('.kit-side-fold i').css('margin-right', '10%');
                $('.layui-body').css('left', 200+'px');
                $('.layui-footer').css('left', 200+'px');
                /*$('dd span').each(function(){
                    $(this).show();
                });*/
                isShow =true;
            }
        });

        function out(){
            window.top.location.href= "<%=basePath%>";
        };


    </script>
</body>
</html>
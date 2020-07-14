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
  <title>主页</title>
  <link rel="stylesheet" href="../resources/layui/css/layui.css">
    <style>
        .layui-icon{
             font-size: 20px;
        }
        #iframeMain{
            width: 100%;
            height: 100%;
        }
        .shouSuoDiv{
            height: 30px;
            background-color: dimgrey;
        }
        #username{
            padding-left: 5px;
        }
        .menu{
            padding-left: 8px;
        }
        .shouSuo{
            padding-left: 85px;
        }
    </style>
</head>
<body class="layui-layout-body close-footer" bgcolor="#F2F2F2">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo"><h2 class="logo"></h2></div>
            <!-- 头部区域（可配合layui已有的水平导航） -->
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a href="javascript:void(0)" class="refresh"><span class="layui-icon layui-icon-username"></span><span id="username"></span></a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:void(0)" onclick="out()">退出</a>
                </li>
            </ul>
        </div>
        <div class="layui-side layui-bg-black">
            <div class="layui-side-scroll">
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <div title="菜单缩放" class="shouSuoDiv"><a class="shouSuo" href="javascript:void(0)"><span class="layui-icon layui-icon-shrink-right"></span></a></div>
                <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                    <li class="layui-nav-item">
                        <a class="layui-icon layui-icon-android" href="<%=basePath%>zhichu/zhichu.jsp"><span class="menu">支出统计</span></a>
                    </li>
                    <li class="layui-nav-item">
                        <a class="layui-icon layui-icon-ios" href="<%=basePath%>shouru/shouru.jsp"><span class="menu">收入统计</span></a>
                    </li>
                    <li class="layui-nav-item">
                        <a class="layui-icon layui-icon-windows" href="<%=basePath%>gongzi/gongzi.jsp"><span class="menu">工资薪金</span></a>
                    </li>
                    <li class="layui-nav-item">
                        <a class="layui-icon layui-icon-rate-solid daiGou" href="<%=basePath%>daigou/daigou.jsp"><span class="menu">代购收入</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="layui-body" style="overflow: hidden;">
            <!-- 内容主体区域 -->
            <iframe src="<%=basePath%>tongji/tongji.jsp" frameborder="0" id="iframeMain"></iframe>
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
        let userPower = document.cookie.split("; ")[1].split("=")[1];

        $(document).ready(function(){

            $("li>a").click(function (e) {
                e.preventDefault();
                $("#iframeMain").attr("src",$(this).attr("href"));
            });
            $("#username").html(username);
            $(".logo").html("奶茶记账账");
            if(userPower !== "0"){
                $(".daiGou").hide();
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
                    $(".layui-icon-user").show();
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
                isShow =false;
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
                isShow =true;
            }
        });

        $('.refresh').click(function(){
            location.reload();
        });

        function out(){
            window.top.location.href= "<%=basePath%>";
        }
    </script>
</body>
</html>
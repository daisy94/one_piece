<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link rel="stylesheet" href="<%=basePath%>resources/layui/css/layui.css">
    <style type="text/css">
        .layui-input{
            border-radius: 10px;
            width: 260px;
        }
    </style>
</head>
<body background="<%=basePath%>resources/image/background.jpg">
    <div style="margin-top: 25%;margin-left: 40%;margin-right: 40%;width: 260px">
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <input type="text" id="username" placeholder="输入用户名吧" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <input type="password" id="password" placeholder="输入密码吧" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
                <button type="button" class="layui-btn layui-btn-fluid" onclick="login()" style="border-radius: 10px">登录康康</button>
        </div>
    </div>
    <script src="<%=basePath%>resources/layui/layui.all.js"></script>
    <script src="<%=basePath%>resources/jquery/jquery-2.1.4.min.js"></script>

    <script>
        let layer = layui.layer;

        function login(){

            let username = $("#username").val();
            let password = $("#password").val();
            if(null == username || "" == username){
                layer.msg("用户名没写吧！");
                return null;
            }
            if(null == password || "" == password){
                layer.msg("密码没写吧！");
                return null;
            }
            let params = {
                "username":username,
                "password":password
            };
            $.ajax({
                async: false,
                type: "POST",
                contentType: "application/json;charset=UTF-8",
                url: "<%=basePath%>login",
                data:JSON.stringify(params),
                success: function(data){
                    if(data.code == 500){
                        layer.msg(data.msg);
                        return null;
                    }else{
                        window.top.location.href = "<%=basePath%>homePage/homePage.jsp";
                    }
                }
            });
        };
    </script>
</body>
</html>
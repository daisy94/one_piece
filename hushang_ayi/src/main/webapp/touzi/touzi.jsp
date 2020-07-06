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
	<title>工资薪金</title>
	<link rel="stylesheet" href="<%=basePath%>resources/layui/css/layui.css">
	<style>
		.layui-btn{
			border-radius: 5px;
		}
		.layui-fluid{
			padding: 10px;
		}
		.layui-row{
			padding: 0px;
		}
		.layui-col-md6{
			padding: 5px;
		}
		.layui-col-md{
			padding: 5px;
		}
		#gongZiEchartsByYM{
			height:356px;
		}
		#gongZiEchartsByYear{
			height:356px;
		}
	</style>
</head>
<body>
<div class="layui-fluid">
	<!-- 内容主体区域 -->
	<div class="layui-row layui-col-space15">
		<h1>还没写呢</h1>
	</div>
</div>

<script src="<%=basePath%>resources/layui/layui.all.js"></script>
<script src="<%=basePath%>resources/layui_exts/excel.js"></script>
<script src="<%=basePath%>resources/jquery/jquery-2.1.4.min.js"></script>
<script src="<%=basePath%>resources/echarts/echarts.js"></script>
<script src="<%=basePath%>resources/utils/utils.js"></script>

<script type="text/javascript">

</script>
</body>
</html>
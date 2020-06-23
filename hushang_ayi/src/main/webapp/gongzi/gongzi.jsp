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
  
  	.layui-form-item{
  		margin-top: 9px;
  	}
  	.layui-btn{
  		border-radius: 5px;
  	}
  </style>
</head>
<body class="layui-layout-body">

	  <div class="layui-body" style="margin: 1%">
	    <!-- 内容主体区域 -->
	
			<div class="layui-form">
			  <div class="layui-form-item">
			  
			   	  <div class="layui-form-item">
				    <label class="layui-form-label">收入录入：</label>
				    <div class="layui-input-inline">
				      <input type="text" name="insertShouRuData" id="insertShouRuData" lay-verify="required" placeholder="想一想收入了多少钱" autocomplete="off" class="layui-input">
				    </div>
				    
				    <label class="layui-form-label">收入时间：</label>
			      	<div class="layui-input-inline">
			        <input type="text" class="layui-input" id="insertDATEYMD" placeholder="几号的收入呢">
			        </div>
			        <div style="float: left">
			      		<button type="button" class="layui-btn" onclick="insertSRData()">保存</button>
			        </div>
				  </div>
			  	
			</div> 	
		</div>
	
		    <div class="layui-form">
			  <div class="layui-form-item">
			  
			    <div class="layui-inline">
			      <label class="layui-form-label">选择时间：</label>
			      <div class="layui-input-inline">
			        <input type="text" class="layui-input" id="selectDateYMD" placeholder="想查几号鸭">
			      </div>
			      <div style="float: left;">
			      	<button type="button" class="layui-btn" onclick="getSRDataByYMD()">走你</button>
			      </div>
			    </div>
			    
			    <div class="layui-inline">
			      	<label class="layui-form-label">选择时间：</label>
			      	<div class="layui-input-inline">
			        	<input type="text" class="layui-input" id="selectDateYM" placeholder="想查几月鸭">
			      	</div>
			      	<div style="float: left;">
				      	<button type="button" class="layui-btn" onclick="getSRDataByYM()">走你</button>
				    </div>
			  	</div>
			  	
			<div>
				<table class="layui-hide" id="test5"></table>
			</div>
			  	
			</div> 	
		</div>

		  <div id="shouruEcharts" style="width:100%;height:38%;">


		  </div>
		</div>

	  <script src="<%=basePath%>resources/layui/layui.js"></script>
	  <script src="<%=basePath%>resources/jquery/jquery-2.1.4.min.js"></script>
	  <script src="<%=basePath%>resources/echarts/echarts.js"></script>
<script type="text/javascript">
//JavaScript代码区域

/* $(function(){

	getZCData();
}) */

layui.use('element', function(){
  var element = layui.element;
  
})

function getSRDataByYMD(){

	layui.use('table', function(){
	  var table = layui.table;
	  
	  var date =  $("#selectDateYMD").val();
	  if(date == null || date == ''){
	  
	  	alert("要选择一个日期哦");
	  	return;
	  }
	  var dateYMD = formatDate(date);
	  table.render({
	    elem: '#test5',
	    url: '<%=basePath%>getShouRuByMonthDay',
	    where: {
	    	dateYMD
	    },
	    cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
	    method: 'post',
	    cols: [[
	      {field:'shouru_money', title: '收入金额', sort: true, align: 'center'}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
	      {field:'shouru_time', title: '收入日期', align: 'center'},
	    ]]
	  });
	})
}

function getSRDataByYM(){

	var date =  $("#selectDateYM").val();

	if(date == null || date == ''){

		alert("要选择一个日期哦");
		return;
	}
	var dateYM = formatDate(date);

	layui.use('table', function(){
	  var table = layui.table;
	  var layer = layui.layer;

	  table.render({
	    elem: '#test5',
	    url: '<%=basePath%>getShouRuByMonth',
	    where: {
	    	dateYM
	    },
	    cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
	  	height: 350,
	    method: 'post',
	    cols: [[
	      {field:'shouru_money', title: '收入金额', sort: true, align: 'center'}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
	      {field:'shouru_time', title: '收入日期', align: 'center'},
	    ]]
	  });
	})

	// 基于准备好的dom，初始化echarts实例
	var myChart = echarts.init(document.getElementById('shouruEcharts'));

	var echartsMoney = new Array();
	var echartsTime = new Array();
	$.ajax({
		async: false,
		type: "POST",
		url: "<%=basePath%>getShouRuByMonthEcharts",
		data:{
			"dateYM":dateYM
		},
		success: function(data){
			echartsMoney = data.echartsMoney;
			echartsTime = data.echartsTime;
		}
	});

	// 指定图表的配置项和数据
	var option = {
		tooltip : {
			trigger: 'axis',
			axisPointer: {
				type: 'none'
			}
		},
		title: {
			text: '收入走势柱状图',
		},
		color: ['#33ABA0'],
		xAxis: {
			type: 'category',
			data: echartsTime
		},
		yAxis: {
			type: 'value'
		},
		series: [{
			data: echartsMoney,
			type: 'bar'
		}]
	};

	// 使用刚指定的配置项和数据显示图表。
	myChart.setOption(option);
}

function insertSRData(){

	var insertShouRuData =  $("#insertShouRuData").val();
	var insertDATEYMD =  formatDate($("#insertDATEYMD").val());
	if(insertShouRuData == null || insertShouRuData == ''){
	  
	  	alert("金额是不是忘填了啊");
	  	return;
	}
	if(insertDATEYMD == null || insertDATEYMD == ''){
	  
	  	alert("要选择一个日期哦");
	  	return;
	}
	
	$.post("<%=basePath%>insertShouRuData", {
		insertShouRuData : insertShouRuData,
				insertDATEYMD : insertDATEYMD
			}, function(data) {
				if(data.status == "success"){
					$("#insertShouRuData").val("");
					$("#insertDATEYMD").val("");
					alert("保存成功啦");
				}
				//当第四个参数设置为json时，不需要手动解析，而是由jquery框架帮助我们实现了解析
			}, "json");
		
}

function formatDate(date){

	var str = new String();
	var arr = new Array();
	arr = date.split('-');
	for(var i=0;i<arr.length;i++){
		str += arr[i];
	}
	
	return str
}

layui.use('laydate', function(){
  var laydate = layui.laydate;
  
  //常规用法
  laydate.render({
    elem: '#insertDATEYMD',
    trigger: 'click', //采用click弹出
    position: 'fixed'
  });
  
  //常规用法
  laydate.render({
    elem: '#selectDateYMD',
    trigger: 'click'
  });
  
  //年月选择器
  laydate.render({
    elem: '#selectDateYM',
    trigger: 'click',
    type: 'month'
  });
  
})

</script>
</body>
</html>
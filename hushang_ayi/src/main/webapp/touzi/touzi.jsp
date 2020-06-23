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
  <title>投资金额</title>
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
<body>

	<div style="margin: 1%;height: 843px">
	<!-- 内容主体区域 -->

		<div>
			<table class="layui-hide" id="test5"></table>
		</div>

	</div>

<script src="<%=basePath%>resources/layui/layui.all.js"></script>
<script src="<%=basePath%>resources/jquery/jquery-2.1.4.min.js"></script>

<script type="text/javascript">
var table = layui.table;

function getSRDataByYMD(){

	  let date =  $("#selectDateYMD").val();
	  if(date == null || date == ''){

          layer.alert("要选择一个日期哦");
	  	return;
	  }
	  let dateYMD = formatDate(date);
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
}

function getSRDataByYM(){

		let date = $("#selectDateYM").val();

		if (date == null || date == '') {

            layer.alert("要选择一个日期哦");
			return;
		}
		let dateYM = formatDate(date);

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
					{field: 'shouru_money', title: '收入金额', sort: true, align: 'center'}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
					{field: 'shouru_time', title: '收入日期', align: 'center'},
				]]
			});

		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('shouruEcharts'));

		var echartsMoney = new Array();
		var echartsTime = new Array();
		$.ajax({
			async: false,
			type: "POST",
			url: "<%=basePath%>getShouRuByMonthEcharts",
			data: {
				"dateYM": dateYM
			},
			success: function (data) {
				echartsMoney = data.echartsMoney;
				echartsTime = data.echartsTime;
			}
		});

		// 指定图表的配置项和数据
		var option = {
			tooltip: {
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

        layer.alert("金额是不是忘填了啊");
	  	return;
	}
	if(insertDATEYMD == null || insertDATEYMD == ''){

        layer.alert("要选择一个日期哦");
	  	return;
	}
	
	$.post("<%=basePath%>insertShouRuData", {
		insertShouRuData : insertShouRuData,
				insertDATEYMD : insertDATEYMD
			}, function(data) {
				if(data.status == "success"){
					$("#insertShouRuData").val("");
					$("#insertDATEYMD").val("");
                    layer.alert("保存成功啦");
				}
				//当第四个参数设置为json时，不需要手动解析，而是由jquery框架帮助我们实现了解析
			}, "json");
		
}

function getSRCountByYM(){

	let date = $("#selectDateYM").val();
	if (date == null || date == '') {

		layer.alert("要选择一个日期哦");
		return;
	}
	let dateYM = formatDate(date);

	$.ajax({
		//请求方式
		type : "POST",
		//请求的媒体类型
		contentType: "application/json;charset=UTF-8",
		//请求地址
		url : "<%=basePath%>getSRCountByYM",
		//数据，json字符串
		data : JSON.stringify({
			dateYM : dateYM
		}),
		//请求成功
		success : function(result) {
			if(result.shouRuCount == null || result.shouRuCount == undefined){
				layer.alert("还没有赚到钱，哭泣~");
				return;
			}
				layer.alert(date+" "+"一共赚了"+" "+result.shouRuCount+"~~~");
		},
		//请求失败，包含具体的错误信息
		error : function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
	});
}

</script>
</body>
</html>
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
  <title>收入</title>
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
	
			<div class="layui-form">
			   	  <div class="layui-form-item">
				    <label class="layui-form-label">收入金额：</label>
				    <div class="layui-input-inline">
				    	<input type="text" name="insertShouRuData" id="insertShouRuData" placeholder="想一想收入了多少钱" autocomplete="off" class="layui-input">
				    </div>
				    
				    <label class="layui-form-label">收入时间：</label>
			      	<div class="layui-inline">
			        	<input type="text" class="layui-input" id="insertDATEYMD" placeholder="几号的收入呢" autocomplete="off">
			        </div>
			        <div class="layui-inline">
			      		<button type="button" class="layui-btn" onclick="insertSRData()">保存</button>
			        </div>
				  </div>
		</div>
	
		    <div class="layui-form">
			  <div class="layui-form-item">
			  
			    <div class="layui-inline">
			      <label class="layui-form-label">选择时间：</label>
			      <div class="layui-inline">
			        <input type="text" class="layui-input" id="selectDateYMD" placeholder="想查几号鸭" autocomplete="off">
			      </div>
			      <div class="layui-inline">
			      	<button type="button" class="layui-btn" onclick="getSRDataByYMD()">走你</button>
			      </div>
			    </div>
			    
			    <div class="layui-inline">
			      	<label class="layui-form-label">选择时间：</label>
			      	<div class="layui-inline">
			        	<input type="text" class="layui-input" id="selectDateYM" placeholder="想查几月鸭" autocomplete="off">
			      	</div>
			      	<div class="layui-inline">
				      	<button type="button" class="layui-btn" onclick="getSRDataByYM()">走你</button>
				    </div>
					<div class="layui-inline">
						<button type="button" class="layui-btn" onclick="getSRCountByYM()">来康康赚了多少钱</button>
					</div>
					<div class="layui-inline">
						<button type="button" class="layui-btn" onclick="excelShouRuData()">导出收入数据</button>
					</div>
			  	</div>
			  	
			<div>
				<table class="layui-hide" id="test5"></table>
			</div>
			  	
			</div> 	
		</div>
			<div id="shouruEcharts" style="width:100%;height:45%;margin-top: 1%">

			</div>
		</div>

<script src="<%=basePath%>resources/layui/layui.all.js"></script>
<script src="<%=basePath%>resources/layui_exts/excel.js"></script>
<script src="<%=basePath%>resources/jquery/jquery-2.1.4.min.js"></script>
<script src="<%=basePath%>resources/echarts/echarts.js"></script>
<script src="<%=basePath%>resources/utils/utils.js"></script>

<script type="text/javascript">
	var layer = layui.layer;
	var laydate = layui.laydate;
	var table = layui.table;

	$(function() {

		let date = new Date().getFullYear() + formatDateMonth(new Date().getMonth() + 1);
		getSRDataByYM_save(date);
	});

	function getSRDataByYMD(){

		  let date =  $("#selectDateYMD").val();
		  if(date == null || date == ''){

			  layer.msg("要选择一个日期哦");
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
	};

	function getSRDataByYM(){

			let date = $("#selectDateYM").val();

			if (date == null || date == '') {

				layer.msg("要选择一个日期哦");
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
			let myChart = echarts.init(document.getElementById('shouruEcharts'));

			let echartsMoney = new Array();
			let echartsTime = new Array();
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
			let option = {
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
	};

	function getSRDataByYM_save(dateYM){

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
		let myChart = echarts.init(document.getElementById('shouruEcharts'));

		let echartsMoney = new Array();
		let echartsTime = new Array();
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
		let option = {
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
	};

	function insertSRData(){

		let insertShouRuData =  $("#insertShouRuData").val();
		let insertDATEYMD =  formatDate($("#insertDATEYMD").val());
		if(insertShouRuData == null || insertShouRuData == ''){

			layer.msg("金额是不是忘填了啊");
			return;
		}
		if(insertDATEYMD == null || insertDATEYMD == ''){

			layer.msg("要选择一个日期哦");
			return;
		}
		if(!isNumber(insertShouRuData)){
			layer.msg("金额怎么能不是数字呢");
			return;
		}

		$.post("<%=basePath%>insertShouRuData", {
			insertShouRuData : insertShouRuData,
					insertDATEYMD : insertDATEYMD
				}, function(data) {
					if(data.status == "success"){
						insertDATEYMD = insertDATEYMD.substring(0,6);
						getSRDataByYM_save(insertDATEYMD);
						$("#insertShouRuData").val("");
						$("#insertDATEYMD").val("");
						layer.msg("保存成功啦");
					}
					//当第四个参数设置为json时，不需要手动解析，而是由jquery框架帮助我们实现了解析
				}, "json");

	};

	function getSRCountByYM(){

		let date = $("#selectDateYM").val();
		if (date == null || date == '') {

			layer.msg("要选择一个日期哦");
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
					layer.msg("还没有赚到钱，哭泣~");
					return;
				}
					layer.alert(date+" "+"一共赚了"+" "+result.shouRuCount+"~~~", {
						skin: 'layui-layer-molv',//样式类名
						closeBtn: 0
					});
			},
			//请求失败，包含具体的错误信息
			error : function(e){
				console.log(e.status);
				console.log(e.responseText);
			}
		});
	};

	function excelShouRuData(){

		let date =  $("#selectDateYM").val();

		if(date == null || date == ''){

			layer.msg("要选择一个日期哦");
			return;
		}

		let loading = layer.load();
		let dateYM = formatDate(date);

		layui.config({
			base: '<%=basePath%>resources/layui_exts/',
		}).extend({
			excel: 'excel',
		});

		let excel = layui.excel;

		let params = {
			"dateYM":dateYM
		};
		$.ajax({
			//请求方式
			type : "POST",
			//请求的媒体类型
			contentType: "application/json;charset=UTF-8",
			//请求地址
			url : "<%=basePath%>getShouRuByMonthExcel",
			//数据，json字符串
			data : JSON.stringify(params),
			//请求成功
			success(res) {
				let data = res.data;
				// 重点！！！如果后端给的数据顺序和映射关系不对，请执行梳理函数后导出
				data = excel.filterExportData(data, [
					'shouru_money',
					'shouru_time'
				]);
				// 重点2！！！一般都需要加一个表头，表头的键名顺序需要与最终导出的数据一致
				data.unshift({
					shouru_money: "收入金额",
					shouru_time: "收入时间"
				});
				excel.exportExcel(data, date + " 收入明细" + ".xlsx", "xlsx");
				layer.close(loading);
				layer.msg("导出成功");
			},
			error() {
				layer.msg("导出失败");
			}
		});
	}

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
</script>
</body>
</html>
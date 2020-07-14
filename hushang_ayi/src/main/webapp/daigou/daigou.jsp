<%@ page contentType="text/html; charset=UTF-8"
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
	<title>恰饭统计</title>
	<link rel="stylesheet" href="<%=basePath%>resources/layui/css/layui.css">
	<style>
		.layui-btn{
			border-radius: 5px;
		}
		.layui-fluid{
			 padding: 10px;
		 }
		.layui-row{
			padding: 0;
		}
		.layui-col-md6{
			padding: 5px;
		}
		.layui-col-md{
			padding: 5px;
		}
		#daiGouEChartsByYearMonth{
			height:356px;
		}
		#zhichuEchartsByYM{
			height:356px;
		}
	</style>
</head>
<body>
	<div class="layui-fluid">
	<!-- 内容主体区域 -->
		<div class="layui-row layui-col-space15">
			<div class="layui-row">
				<div class="layui-col-md">
					<div class="layui-card">
						<div class="layui-card-body">
							<div class="layui-row">
								<div class="layui-col-md">
									<div class="layui-inline">
										<label class="layui-form-label">谁买的呀：</label>
										<div class="layui-input-inline">
											<input type="text" id="customerName" placeholder="谁买的呀" autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-inline">
										<label class="layui-form-label">买了什么：</label>
										<div class="layui-input-inline">
											<input type="text" id="goodsName" placeholder="买了什么呀" autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-inline">
										<label class="layui-form-label">利润金额：</label>
										<div class="layui-input-inline">
											<input type="text" id="profit" placeholder="挣了多少钱呀" autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-inline">
										<label class="layui-form-label">买的时间：</label>
										<div class="layui-inline">
											<input type="text" readonly class="layui-input" id="dateYearMonthDay" placeholder="几号买的呀" autocomplete="off">
										</div>
										<div class="layui-inline">
											<button type="button" class="layui-btn" onclick="insertByYearMonthDay()">保存</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-col-md6">
					<div class="layui-card">
						<div class="layui-card-body">
							<div class="layui-row">
								<label class="layui-form-label">选择时间：</label>
								<div class="layui-inline">
									<input type="text" readonly class="layui-input" id="dateYearMonth" placeholder="想查几月呀" autocomplete="off">
								</div>
								<div class="layui-inline">
									<button type="button" class="layui-btn getDataByYearMonth">走你</button>
								</div>
							</div>
							<div class="layui-row">
								<div>
									<table id="daiGouTableYearMonth"></table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="layui-col-md6">
					<div class="layui-card">
						<div class="layui-card-body">
							<div class="layui-row">
								<label class="layui-form-label">选择时间：</label>
								<div class="layui-inline">
									<input type="text" readonly class="layui-input" id="selectDateY" placeholder="想查哪年鸭" autocomplete="off">
								</div>
								<div class="layui-inline">
									<button type="button" class="layui-btn" onclick="getZCDataByY()">走你</button>
								</div>
								<div class="layui-inline">
									<button type="button" class="layui-btn" onclick="getZCCountByY()">合计支出</button>
								</div>
							</div>
							<div class="layui-row">
								<div>
									<table id="zhiChuTableYear"></table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-col-md6">
					<div class="layui-card">
						<div class="layui-card-body" id="daiGouEChartsByYearMonth"></div>
					</div>
				</div>
				<div class="layui-col-md6">
					<div class="layui-card">
						<div class="layui-card-body" id="zhichuEchartsByYM"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="<%=basePath%>resources/layui/layui.all.js"></script>
	<script src="<%=basePath%>resources/layui_exts/excel.js"></script>
	<script src="<%=basePath%>resources/jquery/jquery-2.1.4.min.js"></script>
	<script src="<%=basePath%>resources/echarts/echarts.js"></script>
	<script src="<%=basePath%>resources/utils/utils.js"></script>

	<script type="text/javascript">
	let layer = layui.layer;
	let table = layui.table;
	let layDate = layui.laydate;
	let maxYear = new Date().getFullYear()+"-12-31";
	let maxYearMonth = new Date().getFullYear()+"-"+(new Date().getMonth() + 1);
	let maxYearMonthDay = new Date().getFullYear()+"-"+(new Date().getMonth() + 1)+"-"+new Date().getDate();
	let username = document.cookie.split("; ")[0].split("=")[1];
	let userPower = document.cookie.split("; ")[1].split("=")[1];

	$(function() {

		let dateYearMonth = new Date().getFullYear() + formatDateMonth(new Date().getMonth() + 1);
		getDataByYearMonth(dateYearMonth);
		let dateY = new Date().getFullYear();
		//getZCDataByY_start(dateY);
	});

	$(".getDataByYearMonth").click(function (){

		let date =  $("#dateYearMonth").val();
		if(date == null || date === ''){

			layer.msg("要选择一个日期哦", {
				anim: 6
			});
			return;
		}
		let dateYearMonth = formatDate(date);
		getDataByYearMonth(dateYearMonth);
	});

	function insertByYearMonthDay(){

		if(userPower !== "0"){
			layer.msg("小伙子，看看就好，别动数据", {
				anim: 6
			});
			return;
		}
		let customerName =  $("#customerName").val();
		let goodsName =  $("#goodsName").val();
		let profit =  $("#profit").val();
		let dateYearMonthDay =  formatDate($("#dateYearMonthDay").val());
		if(customerName == null || customerName === ""){

			layer.msg("谁买的是不是忘填了啊", {
				anim: 6
			});
			return;
		}
		if(goodsName == null || goodsName === ""){

			layer.msg("买了什么是不是忘填了啊", {
				anim: 6
			});
			return;
		}
		if(profit == null || profit === ""){

			layer.msg("利润是不是忘填了啊", {
				anim: 6
			});
			return;
		}
		if(dateYearMonthDay == null || dateYearMonthDay === ""){

			layer.msg("要选择一个日期哦", {
				anim: 6
			});
			return;
		}
		if(!isNumber(profit)){
			layer.msg("利润怎么能不是数字呢", {
				anim: 6
			});
			return;
		}
		let params = {
			"customerName":customerName,
			"goodsName":goodsName,
			"profit":profit,
			"dateYearMonthDay":dateYearMonthDay
		};

		$.ajax({
			type : "POST",
			contentType: "application/json;charset=UTF-8",
			url : "<%=basePath%>insertDaiGouData",
			data : JSON.stringify(params),
			success : function(result) {
				if(result.code === 0){
					let dateYearMonth = dateYearMonthDay.substring(0,6);
					getDataByYearMonth(dateYearMonth);
					/*insertDATEYMD = insertDATEYMD.substring(0,4);
					getZCDataByY_start(insertDATEYMD);*/
					$("#customerName").val("");
					$("#goodsName").val("");
					$("#profit").val("");
					layer.msg(result.msg);
				}else if(result.code === 150){
					layer.msg(result.msg);
				}
			},
			error : function(e){
				console.log(e.status);
				console.log(e.responseText);
			}
		});
	}

	function getDataByYearMonth(dateYearMonth){

		table.render({
			elem: '#daiGouTableYearMonth',
			url: '<%=basePath%>getDaiGouTableYearMonth',
			where: {
				dateYearMonth
			},
			cellMinWidth: 80,
			height: 275,
			method: 'post',
			cols: [[
				{field:'customer_name', title: '买家微信名', align: 'center'},
				{field:'goods_name', title: '商品名称', align: 'center'},
				{field:'profit', title: '净利润', sort: true, align: 'center'},
				{field:'date', title: '购买日期', align: 'center'}
			]]
		});
		getDaiGouEChartsByYearMonth(dateYearMonth);
	}

	function getDaiGouEChartsByYearMonth(dateYearMonth) {

		let myChart = echarts.init(document.getElementById("daiGouEChartsByYearMonth"));

		let EChartsX = [];
		let EChartsY = [];
		let params = {
			"dateYearMonth": dateYearMonth
		};

		$.ajax({
			type: "POST",
			contentType: "application/json;charset=UTF-8",
			url: "<%=basePath%>getDaiGouEChartsByYearMonth",
			data:JSON.stringify(params),
			success: function(data){
				EChartsX = data.data.EChartsX;
				EChartsY = data.data.EChartsY;

				let option = {
					tooltip : {
						trigger: 'axis',
						axisPointer: {
							type: 'none'
						}
					},
					title: {
						text: '恰饭日收入',
					},
					color: ['#33ABA0'],
					xAxis: {
						type: 'category',
						data: EChartsY
					},
					yAxis: {
						type: 'value'
					},
					series: [{
						data: EChartsX,
						type: 'bar'
					}]
				};
				myChart.setOption(option);
			}
		});
	}

	function getZCDataByY(){

		let date =  $("#selectDateY").val();

		if(date == null || date === ''){

			layer.msg("要选择一个年份哦", {
				anim: 6
			});
			return;
		}

		table.render({
			elem: '#zhiChuTableYear',
			url: '<%=basePath%>getZhiChuByYear',
			where: {
				date
			},
			cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
			height: 275,
			method: 'post',
			cols: [[
				{field:'zhichu_money', title: '支出金额', sort: true, align: 'center'}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
				{field:'zhichu_time', title: '支出日期', align: 'center'},
			]]
		});
		zhiChuDataYMEcharts(date);
	}

	function zhiChuDataYMEcharts(dateY) {
		// 基于准备好的dom，初始化echarts实例
		let myChart = echarts.init(document.getElementById('zhichuEchartsByYM'));

		let echartsMoney = [];
		let echartsTime = [];
		$.ajax({
			async: false,
			type: "POST",
			url: "<%=basePath%>getZhiChuByYearEcharts",
			data:{
				"dateY":dateY
			},
			success: function(data){
				echartsMoney = data.data.echartsMoney;
				echartsTime = data.data.echartsTime;
				// 指定图表的配置项和数据
				let option = {
					tooltip : {
						trigger: 'axis',
						axisPointer: {
							type: 'none'
						}
					},
					title: {
						text: '月支出走势图',
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
		});
	}

	function getZCCountByY(){

		let date = $("#selectDateY").val();
		if (date == null || date === '') {

			layer.msg("要选择一个年份哦", {
				anim: 6
			});
			return;
		}
		let params = {
			"date":date
		};
		$.ajax({
			//请求方式
			type : "POST",
			//请求的媒体类型
			contentType: "application/json;charset=UTF-8",
			//请求地址
			url : "<%=basePath%>getZCCountByYear",
			//数据，json字符串
			data : JSON.stringify(params),
			//请求成功
			success : function(result) {
				if(result.zhiChuCount == null){
					layer.msg("还没有花钱，开心~");
					return;
				}
				layer.alert(date+"年一共支出了"+" "+result.zhiChuCount+"~", {
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
	}

	//年月日选择器
	layDate.render({
		elem: '#dateYearMonthDay',
		trigger: 'click',
		max: maxYearMonthDay
	});

	//年月选择器
	layDate.render({
		elem: '#dateYearMonth',
		trigger: 'click',
		type: 'month',
		max: maxYearMonth
	});

	//年选择器
	layDate.render({
		elem: '#selectDateY',
		trigger: 'click',
		type: 'year',
		max: maxYear
	});
	</script>
</body>
</html>
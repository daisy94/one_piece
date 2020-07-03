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
	<title>收入统计</title>
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
		#shouRuEchartsByYMD{
			height:356px;
		}
		#shouRuEchartsByYM{
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
										<label class="layui-form-label">收入金额：</label>
										<div class="layui-input-inline">
											<input type="text" id="insertShouRuData" placeholder="收入了多少钱呀" autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-inline">
										<label class="layui-form-label">收入时间：</label>
										<div class="layui-inline">
											<input type="text" readonly class="layui-input" id="insertDateYMD" placeholder="几号的收入呢" autocomplete="off">
										</div>
										<div class="layui-inline">
											<button type="button" class="layui-btn" onclick="insertSRData()">保存</button>
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
									<input type="text" readonly class="layui-input" id="selectDateYM" placeholder="想查几月鸭" autocomplete="off">
								</div>
								<div class="layui-inline">
									<button type="button" class="layui-btn" onclick="getSRDataByYM()">走你</button>
								</div>
								<div class="layui-inline">
									<button type="button" class="layui-btn" onclick="excelShouRuDataByYM()">导出月收入</button>
								</div>
							</div>
							<div class="layui-row">
								<div>
									<table id="shouRuTableMonth"></table>
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
									<button type="button" class="layui-btn" onclick="getSRDataByY()">走你</button>
								</div>
								<div class="layui-inline">
									<button type="button" class="layui-btn" onclick="getSRCountByY()">合计收入</button>
								</div>
							</div>
							<div class="layui-row">
								<div>
									<table id="shouRuTableYear"></table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-col-md6">
					<div class="layui-card">
						<div class="layui-card-body" id="shouRuEchartsByYMD"></div>
					</div>
				</div>
				<div class="layui-col-md6">
					<div class="layui-card">
						<div class="layui-card-body" id="shouRuEchartsByYM"></div>
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
		let laydate = layui.laydate;
		let maxYear = new Date().getFullYear()+"-12-31";
		let maxYearMonth = new Date().getFullYear()+"-"+(new Date().getMonth() + 1);
		let maxYearMonthDay = new Date().getFullYear()+"-"+(new Date().getMonth() + 1)+"-"+new Date().getDate();
		let username = document.cookie.split("; ")[0].split("=")[1];

		$(function() {

			let dateYM = new Date().getFullYear() + formatDateMonth(new Date().getMonth() + 1);
			getSRDataByYM_save(dateYM);
			let dateY = new Date().getFullYear();
			getSRDataByY_start(dateY);
		});

		function getSRDataByYM(){

			let date =  $("#selectDateYM").val();

			if(date == null || date == ''){

				layer.msg("要选择一个日期哦");
				return;
			}
			let dateYM = formatDate(date);

			table.render({
				elem: '#shouRuTableMonth',
				url: '<%=basePath%>getShouRuByMonth',
				where: {
					dateYM
				},
				cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
				height: 275,
				method: 'post',
				cols: [[
					{field: 'shouru_money', title: '收入金额', sort: true, align: 'center'}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
					{field: 'shouru_time', title: '收入日期', align: 'center'},
				]]
			});
			shouRuDataYMDEcharts(dateYM);
		};

		function getSRDataByYM_save(dateYM){

			table.render({
				elem: '#shouRuTableMonth',
				url: '<%=basePath%>getShouRuByMonth',
				where: {
					dateYM
				},
				cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
				height: 275,
				method: 'post',
				cols: [[
					{field: 'shouru_money', title: '收入金额', sort: true, align: 'center'}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
					{field: 'shouru_time', title: '收入日期', align: 'center'},
				]]
			});
			shouRuDataYMDEcharts(dateYM);
			let dateY = dateYM.substring(0,4);
			shouDataYMEcharts(dateY);
		};

		function getSRDataByY(){

			let date =  $("#selectDateY").val();

			if(date == null || date == ''){

				layer.msg("要选择一个年份哦");
				return;
			}

			table.render({
				elem: '#shouRuTableYear',
				url: '<%=basePath%>getShouRuByYear',
				where: {
					date
				},
				cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
				height: 275,
				method: 'post',
				cols: [[
					{field:'shouru_money', title: '收入金额', sort: true, align: 'center'}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
					{field:'shouru_time', title: '收入日期', align: 'center'},
				]]
			});
			shouDataYMEcharts(date);
		};

		function getSRDataByY_start(date){

			table.render({
				elem: '#shouRuTableYear',
				url: '<%=basePath%>getShouRuByYear',
				where: {
					date
				},
				cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
				height: 275,
				method: 'post',
				cols: [[
					{field:'shouru_money', title: '收入金额', sort: true, align: 'center'}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
					{field:'shouru_time', title: '收入日期', align: 'center'},
				]]
			});
		};

		function shouRuDataYMDEcharts(dateYM) {
			// 基于准备好的dom，初始化echarts实例
			let myChart = echarts.init(document.getElementById('shouRuEchartsByYMD'));

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
					text: '日收入走势图',
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

		function shouDataYMEcharts(dateY) {
			// 基于准备好的dom，初始化echarts实例
			let myChart = echarts.init(document.getElementById('shouRuEchartsByYM'));

			let echartsMoney = new Array();
			let echartsTime = new Array();
			$.ajax({
				async: false,
				type: "POST",
				url: "<%=basePath%>getShouRuByYearEcharts",
					data:{
					"dateY":dateY
				},
				success: function(data){
					echartsMoney = data.echartsMoney;
					echartsTime = data.echartsTime;
				}
			});

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
		};

		function insertSRData(){

			if(username !== "daisy"){
				layer.msg("小伙子，看看就好，别动数据");
				return;
			}
			let insertShouRuData =  $("#insertShouRuData").val();
			let insertDateYMD =  formatDate($("#insertDateYMD").val());
			if(insertShouRuData == null || insertShouRuData === ""){

				layer.msg("金额是不是忘填了啊");
				return;
			}
			if(insertDateYMD == null || insertDateYMD === ""){

				layer.msg("要选择一个日期哦");
				return;
			}
			if(!isNumber(insertShouRuData)){
				layer.msg("金额怎么能不是数字呢");
				return;
			}
			let params = {
				"insertShouRuData":insertShouRuData,
				"insertDateYMD":insertDateYMD
			};
			$.ajax({
				//请求方式
				type : "POST",
				//请求的媒体类型
				contentType: "application/json;charset=UTF-8",
				//请求地址
				url : "<%=basePath%>insertShouRuData",
				//数据，json字符串
				data : JSON.stringify(params),
				//请求成功
				success : function(result) {
					if(result.code === "0"){
						insertDateYMD = insertDateYMD.substring(0,6);
						getSRDataByYM_save(insertDateYMD);
						insertDateYMD = insertDateYMD.substring(0,4);
						getSRDataByY_start(insertDateYMD);
						$("#insertShouRuData").val("");
						$("#insertDateYMD").val("");
						layer.msg("保存成功啦");
					}else{
						layer.msg("保存失败了");
					}
				},
				//请求失败，包含具体的错误信息
				error : function(e){
					console.log(e.status);
					console.log(e.responseText);
				}
			});

		};

		function getSRCountByY(){

			let date = $("#selectDateY").val();
			if (date == null || date === "") {

				layer.msg("要选择一个年份哦");
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
				url : "<%=basePath%>getSRCountByYear",
				//数据，json字符串
				data : JSON.stringify(params),
				//请求成功
				success : function(result) {
					if(result.shouRuCount == null){
						layer.msg("还没有花钱，开心~");
						return;
					}
					layer.alert(date+"年"+"一共收入了"+" "+result.shouRuCount+"~", {
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

		function excelShouRuDataByYM(){

			if(username !== "daisy"){
				layer.msg("小伙子，看看就好，别动数据");
				return;
			}
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
					layer.close(loading);
					layer.msg("导出失败");
				}
			});
		};

		//年月日选择器
		laydate.render({
			elem: '#insertDateYMD',
			trigger: 'click',
			max: maxYearMonthDay
		});

		//年月选择器
		laydate.render({
			elem: '#selectDateYM',
			trigger: 'click',
			type: 'month',
			max: maxYearMonth
		});

		//年选择器
		laydate.render({
			elem: '#selectDateY',
			trigger: 'click',
			type: 'year',
			max: maxYear
		});
	</script>
</body>
</html>
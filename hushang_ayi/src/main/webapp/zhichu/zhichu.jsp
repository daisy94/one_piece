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
	<title>支出统计</title>
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
		#zhichuEchartsByYMD{
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
										<label class="layui-form-label">支出类型：</label>
										<div class="layui-input-inline">
											<input type="text" id="insertzhichuType" placeholder="支出明细是什么呀" autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-inline">
										<label class="layui-form-label">支出金额：</label>
										<div class="layui-input-inline">
											<input type="text" id="insertzhichuData" placeholder="支出了多少钱呀" autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-inline">
										<label class="layui-form-label">支出时间：</label>
										<div class="layui-inline">
											<input type="text" readonly class="layui-input" id="insertDateYMD" placeholder="几号的支出呢" autocomplete="off">
										</div>
										<div class="layui-inline">
											<button type="button" class="layui-btn" onclick="insertZCData()">保存</button>
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
									<button type="button" class="layui-btn" onclick="getZCDataByYM()">走你</button>
								</div>
								<div class="layui-inline">
									<button type="button" class="layui-btn" onclick="excelZhiChuDataByYM()">导出月支出</button>
								</div>
							</div>
							<div class="layui-row">
								<div>
									<table id="zhiChuTableMonth"></table>
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
						<div class="layui-card-body" id="zhichuEchartsByYMD"></div>
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
	let laydate = layui.laydate;
	let maxYear = new Date().getFullYear()+"-12-31";
	let maxYearMonth = new Date().getFullYear()+"-"+(new Date().getMonth() + 1);
	let maxYearMonthDay = new Date().getFullYear()+"-"+(new Date().getMonth() + 1)+"-"+new Date().getDate();
	let username = document.cookie.split("; ")[0].split("=")[1];

	$(function() {

		let dateYM = new Date().getFullYear() + formatDateMonth(new Date().getMonth() + 1);
		getZCDataByYM_save(dateYM);
		let dateY = new Date().getFullYear();
		getZCDataByY_start(dateY);
	});

	function getZCDataByYM(){

		let date =  $("#selectDateYM").val();

		if(date == null || date === ''){

			layer.msg("要选择一个日期哦", {
				anim: 6
			});
			return;
		}
		let dateYM = formatDate(date);

		table.render({
			elem: '#zhiChuTableMonth',
			url: '<%=basePath%>getZhiChuByMonth',
			where: {
				dateYM
			},
			cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
			height: 275,
			method: 'post',
			cols: [[
				{field:'zhichu_name', title: '支出类型', align: 'center'},
				{field:'zhichu_money', title: '支出金额', sort: true, align: 'center'}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
				{field:'zhichu_time', title: '支出日期', align: 'center'},
			]]
		});
		zhiChuDataYMDEcharts(dateYM);
	};

	function zhiChuDataYMDEcharts(dateYM) {
		// 基于准备好的dom，初始化echarts实例
		let myChart = echarts.init(document.getElementById('zhichuEchartsByYMD'));

		let echartsMoney = [];
		let echartsTime = [];
		$.ajax({
			async: false,
			type: "POST",
			url: "<%=basePath%>getZhiChuByMonthEcharts",
			data:{
				"dateYM":dateYM
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
				text: '日支出走势图',
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

	function getZCDataByYM_save(dateYM){

		table.render({
			elem: '#zhiChuTableMonth',
			url: '<%=basePath%>getZhiChuByMonth',
			where: {
				dateYM
			},
			cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
			height: 275,
			method: 'post',
			cols: [[
				{field:'zhichu_name', title: '支出类型', align: 'center'},
				{field:'zhichu_money', title: '支出金额', sort: true, align: 'center'}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
				{field:'zhichu_time', title: '支出日期', align: 'center'},
			]]
		});
		zhiChuDataYMDEcharts(dateYM);
		let dateY = dateYM.substring(0,4);
		zhiChuDataYMEcharts(dateY);
	};

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
	};

	function getZCDataByY_start(date){

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
	};

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

	function insertZCData(){

		if(username !== "daisy"){
			layer.msg("小伙子，看看就好，别动数据", {
				anim: 6
			});
			return;
		}
		let insertZhiChuType =  $("#insertzhichuType").val();
		let insertZhiChuData =  $("#insertzhichuData").val();
		let insertDATEYMD =  formatDate($("#insertDateYMD").val());
		if(insertZhiChuType == null || insertZhiChuType === ''){

			layer.msg("要填一个支出类型哦", {
				anim: 6
			});
			return;
		}
		if(insertZhiChuData == null || insertZhiChuData === ''){

			layer.msg("金额是不是忘填了啊", {
				anim: 6
			});
			return;
		}
		if(insertDATEYMD == null || insertDATEYMD === ''){

			layer.msg("要选择一个日期哦", {
				anim: 6
			});
			return;
		}
		if(!isNumber(insertZhiChuData)){
			layer.msg("金额怎么能不是数字呢", {
				anim: 6
			});
			return;
		}
		let params = {
			"insertZhiChuType":insertZhiChuType,
			"insertZhiChuData":insertZhiChuData,
			"insertDATEYMD":insertDATEYMD
		};
		$.ajax({
			//请求方式
			type : "POST",
			//请求的媒体类型
			contentType: "application/json;charset=UTF-8",
			//请求地址
			url : "<%=basePath%>insertZhiChuData",
			//数据，json字符串
			data : JSON.stringify(params),
			//请求成功
			success : function(result) {
				if(result.status === "success"){
					insertDATEYMD = insertDATEYMD.substring(0,6);
					getZCDataByYM_save(insertDATEYMD);
					insertDATEYMD = insertDATEYMD.substring(0,4);
					getZCDataByY_start(insertDATEYMD);
					$("#insertzhichuType").val("");
					$("#insertzhichuData").val("");
					layer.msg("保存成功啦");
				}
			},
			//请求失败，包含具体的错误信息
			error : function(e){
				console.log(e.status);
				console.log(e.responseText);
			}
		});
	};

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
	};

	function excelZhiChuDataByYM(){

		if(username !== "daisy"){
			layer.msg("小伙子，看看就好，别动数据", {
				anim: 6
			});
			return;
		}
		let date =  $("#selectDateYM").val();

		if(date == null || date === ''){

			layer.msg("要选择一个日期哦", {
				anim: 6
			});
			return;
		}
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
		let loading = layer.load();
		$.ajax({
			//请求方式
			type : "POST",
			//请求的媒体类型
			contentType: "application/json;charset=UTF-8",
			//请求地址
			url : "<%=basePath%>getZhiChuByMonthExcel",
			//数据，json字符串
			data : JSON.stringify(params),
			//请求成功
			success(res) {
				let data = res.data;
				// 重点！！！如果后端给的数据顺序和映射关系不对，请执行梳理函数后导出
				data = excel.filterExportData(data, [
					'zhichu_name',
					'zhichu_money',
					'zhichu_time',
				]);
				// 重点2！！！一般都需要加一个表头，表头的键名顺序需要与最终导出的数据一致
				data.unshift({
					zhichu_name: "支出明细",
					zhichu_money: "支出金额",
					zhichu_time: "支出时间"
				});
				excel.exportExcel(data, date + " 支出明细" + ".xlsx", "xlsx");
				layer.msg("导出成功");
				layer.close(loading);
			},
			error() {
				layer.msg("导出失败");
				layer.close(loading);
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
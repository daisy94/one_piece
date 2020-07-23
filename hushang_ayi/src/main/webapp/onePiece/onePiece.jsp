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
	<title>ONE PIECE</title>
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
		.layui-input{
			border-radius: 6px;
		}
		#onePieceEChartsByYearMonth{
			height:305px;
		}
		#onePieceEChartsByYear{
			height:305px;
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
									<table id="onePieceTableYearMonth" lay-filter="onePieceTable"></table>
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
									<input type="text" readonly class="layui-input" id="dateYear" placeholder="想查哪年呀" autocomplete="off">
								</div>
								<div class="layui-inline">
									<button type="button" class="layui-btn getDataByYear">走你</button>
								</div>
								<div class="layui-inline">
									<button type="button" class="layui-btn" onclick="getCountByYear()">合计收入</button>
								</div>
							</div>
							<div class="layui-row">
								<div>
									<table id="onePieceTableYear"></table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-col-md6">
					<div class="layui-card">
						<div class="layui-card-body" id="onePieceEChartsByYearMonth"></div>
					</div>
				</div>
				<div class="layui-col-md6">
					<div class="layui-card">
						<div class="layui-card-body" id="onePieceEChartsByYear"></div>
					</div>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-col-md">
					<div class="layui-card">
						<div class="layui-card-header"><h3><b>业绩！业绩！还是业绩！</b></h3></div>
						<div class="layui-card-body">
							<div class="layui-progress layui-progress-big" lay-filter="achievement" lay-showpercent="true">
								<div class="layui-progress-bar layui-bg-green" lay-percent=""></div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<script type="text/html" id="operationButton">
		<a class="layui-btn layui-btn-xs" lay-event="edit">改一哈</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">不要了</a>
	</script>

	<script src="<%=basePath%>resources/layui/layui.all.js"></script>
	<script src="<%=basePath%>resources/layui_exts/excel.js"></script>
	<script src="<%=basePath%>resources/jquery/jquery-2.1.4.min.js"></script>
	<script src="<%=basePath%>resources/echarts/echarts.js"></script>
	<script src="<%=basePath%>resources/utils/utils.js"></script>

	<script type="text/javascript">
		let element = layui.element;
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
			getAchievementPercentage(dateYearMonth);
			let dateYear = new Date().getFullYear();
			getDataByYear(dateYear);
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

		$(".getDataByYear").click(function (){

			let dateYear =  $("#dateYear").val();
			if(dateYear == null || dateYear === ''){

				layer.msg("要选择一个年份哦", {
					anim: 6
				});
				return;
			}
			getDataByYear(dateYear);
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
				url : "<%=basePath%>insertOnePieceData",
				data : JSON.stringify(params),
				success: function(result) {
					if(result.code === 0){
						let dateYearMonth = dateYearMonthDay.substring(0,6);
						getDataByYearMonth(dateYearMonth);
						getAchievementPercentage(dateYearMonth);
						let dateYear = dateYearMonth.substring(0,4);
						getDataByYear(dateYear);
						$("#customerName").val("");
						$("#goodsName").val("");
						$("#profit").val("");
						layer.msg(result.msg);
					}else if(result.code === 150){
						layer.msg(result.msg);
					}
				},
				error: function(e){
					console.log(e.status);
					console.log(e.responseText);
				}
			});
		}

		function deleteTableData(params, date) {

			$.ajax({
				type : "POST",
				contentType: "application/json;charset=UTF-8",
				url : "<%=basePath%>deleteOnePieceTableData",
				data : params,
				success: function(result) {
					if(result.code === 0){
						let dateYearMonth = formatDate(date).substring(0,6);
						getDataByYearMonth(dateYearMonth);
						getAchievementPercentage(dateYearMonth);
						let dateYear = dateYearMonth.substring(0,4);
						getDataByYear(dateYear);
						layer.msg(result.msg);
					}else if(result.code === 150){
						layer.msg(result.msg);
					}
				},
				error: function(e){
					console.log(e.status);
					console.log(e.responseText);
				}
			});
		}

		function updateTableData(params, date) {

			$.ajax({
				type : "POST",
				contentType: "application/json;charset=UTF-8",
				url : "<%=basePath%>updateOnePieceTableData",
				data : params,
				success: function(result) {
					if(result.code === 0){
						let dateYearMonth = formatDate(date).substring(0,6);
						getDataByYearMonth(dateYearMonth);
						getAchievementPercentage(dateYearMonth);
						let dateYear = dateYearMonth.substring(0,4);
						getDataByYear(dateYear);
						layer.msg(result.msg);
					}else if(result.code === 150){
						layer.msg(result.msg);
					}
				},
				error: function(e){
					console.log(e.status);
					console.log(e.responseText);
				}
			});
		}

		function getDataByYearMonth(dateYearMonth){

			table.render({
				elem: '#onePieceTableYearMonth',
				url: '<%=basePath%>getOnePieceTableYearMonth',
				contentType: 'application/json',
				where: {
					"dateYearMonth": dateYearMonth
				},
				cellMinWidth: 80,
				height: 235,
				method: 'post',
				cols: [[
					{field:'id', title: 'ID', hide: true},
					{field:'customer_name', title: '买家微信名', align: 'center', unresize: true, edit: 'onePieceTable'},
					{field:'goods_name', title: '买了什么', align: 'center', unresize: true, edit: 'onePieceTable'},
					{field:'profit', title: '赚了多少钱', sort: true, align: 'center', unresize: true, edit: 'onePieceTable'},
					{field:'date', title: '购买日期', align: 'center', unresize: true},
					{align:'center', title: '你要干什么', toolbar: '#operationButton'}
				]]
			});
			getOnePieceEChartsByYearMonth(dateYearMonth);
		}

		function getOnePieceEChartsByYearMonth(dateYearMonth) {

			let myChart = echarts.init(document.getElementById("onePieceEChartsByYearMonth"));

			let EChartsX = [];
			let EChartsY = [];
			let params = {
				"dateYearMonth": dateYearMonth
			};

			$.ajax({
				type: "POST",
				contentType: "application/json;charset=UTF-8",
				url: "<%=basePath%>getOnePieceEChartsByYearMonth",
				data: JSON.stringify(params),
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
							data: EChartsX
						},
						yAxis: {
							type: 'value'
						},
						series: [{
							data: EChartsY,
							type: 'bar',
							markLine: {
								symbol: "none", //去掉警戒线最后面的箭头
								label: {
									position: "end", //将警示值放在哪个位置，三个值“start”,"middle","end"  开始  中点 结束
									formatter: "200块",
									color: "#696969",
									fontSize: 12
								},
								data: [{
									silent: false, //鼠标悬停事件  true没有，false有
									lineStyle: { //警戒线的样式，虚实，颜色
										color: "#696969"
									},
									yAxis: 200 //警戒线的标注值，可以有多个yAxis，多条警示线，或者采用{type : 'average', name: '平均值'}，type值有  max  min  average，分为最大，最小，平均值
								}]
							}
						}]
					};
					myChart.setOption(option);
				},
				error: function(e){
					console.log(e.status);
					console.log(e.responseText);
				}
			});
		}

		function getDataByYear(dateYear){

			table.render({
				elem: '#onePieceTableYear',
				url: '<%=basePath%>getOnePieceTableYear',
				contentType: 'application/json',
				where: {
					"dateYear": dateYear
				},
				cellMinWidth: 80,
				height: 235,
				method: 'post',
				cols: [[
					{field:'profit', title: '净利润', sort: true, align: 'center', unresize: true},
					{field:'date', title: '统计日期', align: 'center', unresize: true},
				]]
			});
			getOnePieceEChartsByYear(dateYear);
		}

		function getOnePieceEChartsByYear(dateYear) {

			let myChart = echarts.init(document.getElementById("onePieceEChartsByYear"));

			let EChartsX = [];
			let EChartsY = [];
			let params = {
				"dateYear": dateYear
			};

			$.ajax({
				async: false,
				type: "POST",
				contentType: "application/json;charset=UTF-8",
				url: "<%=basePath%>getOnePieceEChartsByYear",
				data: JSON.stringify(params),
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
							text: '恰饭月收入',
						},
						color: ['#33ABA0'],
						xAxis: {
							type: 'category',
							data: EChartsX
						},
						yAxis: {
							type: 'value'
						},
						series: [{
							data: EChartsY,
							type: 'bar',
							markLine: {
								symbol: "none", //去掉警戒线最后面的箭头
								label: {
									position: "end", //将警示值放在哪个位置，三个值“start”,"middle","end"  开始  中点 结束
									formatter: "5000块",
									color: "#696969",
									fontSize: 12
								},
								data: [{
									silent: false, //鼠标悬停事件  true没有，false有
									lineStyle: { //警戒线的样式，虚实，颜色
										color: "#696969"
									},
									yAxis: 5000 //警戒线的标注值，可以有多个yAxis，多条警示线，或者采用{type : 'average', name: '平均值'}，type值有  max  min  average，分为最大，最小，平均值
								}]
							}
						}]
					};
					myChart.setOption(option);
				},
				error: function(e){
					console.log(e.status);
					console.log(e.responseText);
				}
			});
		}

		function getCountByYear(){

			let dateYear = $("#dateYear").val();
			if (dateYear == null || dateYear === '') {

				layer.msg("要选择一个年份哦", {
					anim: 6
				});
				return;
			}
			let params = {
				"dateYear":dateYear
			};

			$.ajax({
				type : "POST",
				contentType: "application/json;charset=UTF-8",
				url : "<%=basePath%>getOnePieceCountByYear",
				data : JSON.stringify(params),
				success: function(data) {
					if(data.data == null){
						layer.alert("还没有收入，哭泣！", {
							skin: 'layui-layer-molv',
							closeBtn: 0
						});
					}else {
						layer.alert(dateYear + "年一共赚了" + " " + data.data.profit + "块~", {
							skin: 'layui-layer-molv',
							closeBtn: 0
						});
					}
				},
				error: function(e){
					console.log(e.status);
					console.log(e.responseText);
				}
			});
		}

		function getAchievementPercentage(dateYearMonth){

			let params = {
				"dateYearMonth": dateYearMonth
			};
			$.ajax({
				type : "POST",
				contentType: "application/json;charset=UTF-8",
				url : "<%=basePath%>getAchievementPercentage",
				data : JSON.stringify(params),
				success: function(result) {
					if(result.code === 0){
						let achievementPercentage = result.data.achievementPercentage;
						element.progress("achievement", achievementPercentage);
					}
				},
				error: function(e){
					console.log(e.status);
					console.log(e.responseText);
				}
			});
		}

		table.on('tool(onePieceTable)', function(obj){
			let data = obj.data;
			let date = data.date;
			if(obj.event === 'delete'){
				layer.confirm('确定不要了吗', function(index){
					deleteTableData(JSON.stringify(data), date);
					layer.close(index);
				});
			} else if(obj.event === 'edit'){
				let customerName = data.customer_name;
				let goodsName = data.goods_name;
				let profit = data.profit;
				if(customerName === "" || goodsName === "" || profit === ""){

					layer.msg("每一个都是要填的！", {
						anim: 6
					});
					return;
				}
				layer.confirm('确定改成这样吗', function(index){
					updateTableData(JSON.stringify(data), date);
					layer.close(index);
				});
			}
		});

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
			elem: '#dateYear',
			trigger: 'click',
			type: 'year',
			max: maxYear
		});
	</script>
</body>
</html>
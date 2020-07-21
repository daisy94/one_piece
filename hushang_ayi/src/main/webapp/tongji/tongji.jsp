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
	<title>统计计算</title>
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
		#zhiChuEchartsByYM{
			height:345px;
		}
		#shouRuEchartsByYM{
			height:345px;
		}
		#gongZiEchartsByYM{
			height:345px;
		}
		#tongJiEchartsByYM{
			height:345px;
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
										<label class="layui-form-label">统计时间：</label>
										<div class="layui-inline">
											<input type="text" readonly class="layui-input selectDateYM" placeholder="想查几月鸭" autocomplete="off">
										</div>
										<div class="layui-inline">
											<button type="button" class="layui-btn" onclick="getEchartsData()">走你</button>
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
						<div class="layui-card-body" id="zhiChuEchartsByYM"></div>
					</div>
				</div>
				<div class="layui-col-md6">
					<div class="layui-card">
						<div class="layui-card-body" id="shouRuEchartsByYM"></div>
					</div>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-col-md6">
					<div class="layui-card">
						<div class="layui-card-body" id="gongZiEchartsByYM"></div>
					</div>
				</div>
				<div class="layui-col-md6">
					<div class="layui-card">
						<div class="layui-card-body" id="tongJiEchartsByYM"></div>
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
		let layDate = layui.laydate;
		let maxYearMonth = new Date().getFullYear()+"-"+(new Date().getMonth() + 1);
		let username = document.cookie.split("; ")[0].split("=")[1];
		let userPower = document.cookie.split("; ")[1].split("=")[1];

		$(function() {

			let dateYM = new Date().getFullYear() + formatDateMonth(new Date().getMonth());
			let dateYear = new Date().getFullYear();
			zhiChuDataEchartsByYM(dateYM);
			shouRuDataEchartsByYM(dateYM);
			gongZiDataEchartsByYM(dateYM);
			tongJiDataEchartsByYM(dateYear);
		});

		function getEchartsData(){

			let date =  $(".selectDateYM").val();

			if(date == null || date === ''){

				layer.msg("要选择一个日期哦", {
					anim: 6
				});
				return;
			}
			let dateYM = formatDate(date);
			zhiChuDataEchartsByYM(dateYM);
			shouRuDataEchartsByYM(dateYM);
			gongZiDataEchartsByYM(dateYM);
		}

		function zhiChuDataEchartsByYM(dateYM) {
			// 基于准备好的dom，初始化echarts实例
			let myChart = echarts.init(document.getElementById('zhiChuEchartsByYM'));

			let echartsMoney = [];
			let echartsTime = [];
			$.ajax({
				type: "POST",
				url: "<%=basePath%>getZhiChuByMonthEcharts",
				data:{
					"dateYM":dateYM
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

		function shouRuDataEchartsByYM(dateYM) {
			// 基于准备好的dom，初始化echarts实例
			let myChart = echarts.init(document.getElementById('shouRuEchartsByYM'));

			let echartsMoney = [];
			let echartsTime = [];
			$.ajax({
				type: "POST",
				url: "<%=basePath%>getShouRuByMonthEcharts",
				data: {
					"dateYM": dateYM
				},
				success: function (data) {
					echartsMoney = data.echartsMoney;
					echartsTime = data.echartsTime;

					// 指定图表的配置项和数据
					let option = {
						tooltip: {
							trigger: 'axis',
							axisPointer: {
								type: 'none'
							}
						},
						title: {
							text: '月收入走势图',
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

		function gongZiDataEchartsByYM(dateYM){
			// 基于准备好的dom，初始化echarts实例
			let myChart = echarts.init(document.getElementById('gongZiEchartsByYM'));

			let echartsRemark = [];
			let echartsData = [];
			$.ajax({
				type: "POST",
				url: "<%=basePath%>getGongZiEchartsByYM",
				data:{
					"dateYM":dateYM
				},
				success: function(data){
					echartsRemark = data.echartsRemark;
					echartsData = data.echartsData;

                    // 指定图表的配置项和数据
                    let option = {
                        title: {
                            text: '月薪资饼图',
                            left: 'center'
                        },
                        tooltip: {
                            trigger: 'item',
                            formatter: '{a} <br/>{b} : {c} ({d}%)'
                        },
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                            data: echartsRemark
                        },
                        series: [
                            {
                                name: '薪资占比',
                                type: 'pie',
                                radius: '55%',
                                hoverOffset: 5,
                                center: ['50%', '60%'],
                                data: echartsData,
                                emphasis: {
                                    itemStyle: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        ]
                    };
                    // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);
				}
			});
		}

		function tongJiDataEchartsByYM(dateYear) {
			// 基于准备好的dom，初始化echarts实例
			let myChart = echarts.init(document.getElementById('tongJiEchartsByYM'));

			let echartsMoney = [];
			let echartsTime = [];
			let params = {
				"dateYear": dateYear
			};
			$.ajax({
				type: "POST",
				contentType: "application/json;charset=UTF-8",
				url: "<%=basePath%>getTongJiEchartsDataByYear",
				data: JSON.stringify(params),
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
							text: '年净利润走势图',
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

		//年月选择器
		layDate.render({
			elem: '.selectDateYM',
			trigger: 'click',
			type: 'month',
			max: maxYearMonth
		});
	</script>
</body>
</html>
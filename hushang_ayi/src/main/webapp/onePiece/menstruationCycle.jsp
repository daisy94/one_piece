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
			padding-top: 15px;
			padding-bottom: 15px;
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
			height: 262px;
		}
		#onePieceEChartsByYear{
			height: 262px;
		}
	</style>
</head>
<body bgcolor="#F2F2F2">
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
										<label class="layui-form-label">选择时间：</label>
										<div class="layui-inline">
											<input type="text" readonly class="layui-input" id="dateYearMonthDay" placeholder="想一下开始结束时间" autocomplete="off">
										</div>
										<div class="layui-inline">
											<button type="button" class="layui-btn insertByYearMonthDay">保存</button>
										</div>
									</div>
									<div class="layui-inline">
										<label class="layui-form-label">选择时间：</label>
										<div class="layui-inline">
											<input type="text" readonly class="layui-input" id="dateYear" placeholder="想查哪一年的" autocomplete="off">
										</div>
										<div class="layui-inline">
											<button type="button" class="layui-btn selectByYear">走你</button>
										</div>
									</div>
								</div>
							</div>
							<div class="layui-row">
								<div class="layui-col-md6">
									<table id="menstruationCycleTable"></table>
								</div>
								<div class="layui-col-md6">

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="<%=basePath%>resources/layui/layui.all.js"></script>
	<script src="<%=basePath%>resources/echarts/echarts.js"></script>
	<script src="<%=basePath%>resources/utils/utils.js"></script>

	<script type="text/javascript">
		let element = layui.element;
		let $ = layui.jquery;
		let layer = layui.layer;
		let table = layui.table;
		let layDate = layui.laydate;
		let maxYear = new Date().getFullYear()+"-12-31";
		let maxYearMonthDay = new Date().getFullYear()+"-"+(new Date().getMonth() + 1)+"-"+new Date().getDate();

		$(function() {

			let dateYear = new Date().getFullYear();
			let params = {
				"dateYear": dateYear
			};
			getMenstruationCycleTable(params);
		});

		$(".insertByYearMonthDay").click(function () {

			let dateYearMonthDay = $("#dateYearMonthDay").val();
			if (dateYearMonthDay === ""){

				layer.msg("日期是不是忘选了啊", {
					anim: 6
				});
				return;
			}
			let params = {
				"dateYearMonthDayStart": formatDate(dateYearMonthDay.substring(0, 10)),
				"dateYearMonthDayEnd": formatDate(dateYearMonthDay.substring(13, 23)),
				"dateYear": formatDate(dateYearMonthDay.substring(0, 10)).substring(0,4)
			};
			insertByYearMonthDay(params);
		});

		$(".selectByYear").click(function () {

			let dateYear = $("#dateYear").val();
			if (dateYear === ""){

				layer.msg("日期是不是忘选了啊", {
					anim: 6
				});
				return;
			}
			let params = {
				"dateYear": dateYear
			};
			getMenstruationCycleTable(params);
		});

		function insertByYearMonthDay(params){

			$.ajax({
				type : "POST",
				contentType: "application/json;charset=UTF-8",
				url : "<%=basePath%>insertMenstruationCycleData",
				data : JSON.stringify(params),
				success: function(result) {
					if(result.code === 0){
						$("#dateYearMonthDay").val("");
						getMenstruationCycleTable(params);
						layer.msg(result.msg);
					}else {
						layer.msg(result.msg);
					}
				},
				error: function(e){
					console.log(e.status);
					console.log(e.responseText);
				}
			});
		}

		function getMenstruationCycleTable(params){

			table.render({
				elem: '#menstruationCycleTable',
				url: '<%=basePath%>getMenstruationCycleTable',
				contentType: 'application/json',
				where: params,
				cellMinWidth: 80,
				method: 'POST',
				cols: [[
					{field:'id', title: 'ID', hide: true},
					{field:'start_time', title: '姨妈开始时间', align: 'center', unresize: true},
					{field:'end_time', title: '姨妈结束时间', align: 'center', unresize: true},
				]]
			});
		}

		//日期范围选择器
		layDate.render({
			elem: '#dateYearMonthDay',
			range: true,
			max: maxYearMonthDay
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
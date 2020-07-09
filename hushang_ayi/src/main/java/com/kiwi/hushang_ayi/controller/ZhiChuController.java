package com.kiwi.hushang_ayi.controller;

import com.kiwi.hushang_ayi.service.ZhiChuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import utils.JsonResult;
import utils.LayUIUtil;
import utils.TypeUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//支出统计
@RestController
public class ZhiChuController {
	
	@Autowired
	ZhiChuService zhiChuService;

	//获得支出数据，按月统计
	@RequestMapping(value = "/getZhiChuByMonth", method = RequestMethod.POST)
	public LayUIUtil getZhiChuByMonth(String dateYM, Integer page, Integer size) throws Exception{
			
		int date = TypeUtil.toInt(dateYM);
		
		List<Map<String, Object>> zhiChuByMonth = zhiChuService.getZhiChuByMonth(date);
		int count = zhiChuByMonth.size();
		return LayUIUtil.data(count, zhiChuByMonth);
	}

	//获得支出数据，按年统计
	@RequestMapping(value = "/getZhiChuByYear", method = RequestMethod.POST)
	public LayUIUtil getZhiChuByYear(String date, Integer page, Integer size) throws Exception{

		int dateYear = TypeUtil.toInt(date);

		List<Map<String, Object>> zhiChuByYear = zhiChuService.getZhiChuByYear(dateYear);
		int count = zhiChuByYear.size();
		return LayUIUtil.data(count, zhiChuByYear);
	}

	//导出支出数据Excel表格，按月统计
	@RequestMapping(value = "/getZhiChuByMonthExcel", method = RequestMethod.POST)
	public JsonResult getZhiChuByMonthExcel(@RequestBody Map<String,String> requestMap) throws Exception{

		int date = TypeUtil.toInt(requestMap.get("dateYM"));

		List<Map<String, Object>> zhiChuByMonth = zhiChuService.getZhiChuByMonth(date);
        Map<String, Object> map = new HashMap<>();
        map.put("date", date);
        Map<String, Object> zcCountByYM = zhiChuService.getZCCountByYM(map);
        map.put("zhichu_name","合计");
        map.put("zhichu_money",zcCountByYM.get("zhiChuCount"));
        zhiChuByMonth.add(map);
		return new JsonResult(zhiChuByMonth);
	}

	//获得支出数据Echarts图表所需数据，按月统计
	@RequestMapping(value = "/getZhiChuByMonthEcharts", method = RequestMethod.POST)
	public JsonResult getShouRuByMonthEcharts(String dateYM) throws Exception{

		int date = TypeUtil.toInt(dateYM);

		List<Map<String, Object>> shouRuByMonth = zhiChuService.getZhiChuByMonthEcharts(date);
		List<String> echartsMoney = new ArrayList<>();
		List<String> echartsTime = new ArrayList<>();
		for (Map<String, Object> shouRuByMonthMap : shouRuByMonth){

			echartsMoney.add(TypeUtil.toString(shouRuByMonthMap.get("zhichu_money")));
			echartsTime.add(TypeUtil.toString(shouRuByMonthMap.get("zhichu_time")));
		}
		Map<String, Object> result = new HashMap<>();
		result.put("echartsMoney",echartsMoney);
		result.put("echartsTime",echartsTime);
		return new JsonResult(result);
	}

	//获得支出数据Echarts图表所需数据，按年统计
	@RequestMapping(value = "/getZhiChuByYearEcharts", method = RequestMethod.POST)
	public JsonResult getZhiChuByYearEcharts(String dateY) throws Exception{

		int date = TypeUtil.toInt(dateY);

		List<Map<String, Object>> zhiChuByYearEcharts = zhiChuService.getZhiChuByYearEcharts(date);
		List<String> echartsMoney = new ArrayList<>();
		List<String> echartsTime = new ArrayList<>();
		for (Map<String, Object> shouRuByMonthMap : zhiChuByYearEcharts){

			echartsMoney.add(TypeUtil.toString(shouRuByMonthMap.get("zhichu_money")));
			echartsTime.add(TypeUtil.toString(shouRuByMonthMap.get("zhichu_time")));
		}
		Map<String, Object> result = new HashMap<>();
		result.put("echartsMoney",echartsMoney);
		result.put("echartsTime",echartsTime);
		return new JsonResult(result);
	}

	//新增支出数据
	@RequestMapping(value = "/insertZhiChuData", method = RequestMethod.POST)
	public JsonResult insertZhiChuData(@RequestBody Map<String,String> requestMap) throws Exception{

		Double zhiChuData = TypeUtil.toDouble(requestMap.get("insertZhiChuData"));
		Long dateYMD = TypeUtil.toLong(requestMap.get("insertDATEYMD"));
		Map<String, Object> map = new HashMap<>();
		map.put("zhiChuType", requestMap.get("insertZhiChuType"));
		map.put("zhiChuData", zhiChuData);
		map.put("zhiChuTime", dateYMD);
		return zhiChuService.insertZhiChuData(map);
	}

	//计算支出总数，按年统计
	@RequestMapping(value = "/getZCCountByYear", method = RequestMethod.POST)
	public Map<String, Object> getZCCountByYear(@RequestBody Map<String,String> requestMap) throws Exception{

		Long date = TypeUtil.toLong(requestMap.get("date"));
		Map<String, Object> map = new HashMap<>();
		map.put("date", date);
		Map<String, Object> zcCountByYear = zhiChuService.getZCCountByYear(map);
		return zcCountByYear;
	}
}
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

@RestController
public class ZhiChuController {
	
	@Autowired
	private ZhiChuService zhiChuService;
	
	@RequestMapping(value = "/getZhiChuByMonth", method = RequestMethod.POST)
	public LayUIUtil getZhiChuByMonth(String dateYM, Integer page, Integer size) throws Exception{
			
		int date = TypeUtil.toInt(dateYM);
		
		List<Map<String, Object>> zhiChuByMonth = zhiChuService.getZhiChuByMonth(date);
		int count = zhiChuByMonth.size();
		
		return LayUIUtil.data(count, zhiChuByMonth);
	}

	@RequestMapping(value = "/getZhiChuByMonthExcel", method = RequestMethod.POST)
	public JsonResult getZhiChuByMonthExcel(@RequestBody Map<String,String> requestMap) throws Exception{

		int date = TypeUtil.toInt(requestMap.get("dateYM"));

		List<Map<String, Object>> zhiChuByMonth = zhiChuService.getZhiChuByMonth(date);
        Map<String, Object> map = new HashMap<>();
        map.put("dateYMD", date);
        Map<String, Object> zcCountByYM = zhiChuService.getZCCountByYM(map);
        map.put("zhichu_name","合计");
        map.put("zhichu_money",zcCountByYM.get("zhiChuCount"));
        zhiChuByMonth.add(map);
		return new JsonResult(zhiChuByMonth);
	}

	@RequestMapping(value = "/getZhiChuByMonthEcharts", method = RequestMethod.POST)
	public Map<String, Object> getShouRuByMonthEcharts(String dateYM) throws Exception{

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
		return result;
	}
	
	@RequestMapping(value = "/getZhiChuByMonthDay", method = RequestMethod.POST)
	public LayUIUtil getZhiChuByMonthDay(String dateYMD, Integer page, Integer size) throws Exception{
		
		int date = TypeUtil.toInt(dateYMD);
		
		List<Map<String,Object>> zhiChuByMonthDay = zhiChuService.getZhiChuByMonthDay(date);
		int count = zhiChuByMonthDay.size();
		
		return LayUIUtil.data(count, zhiChuByMonthDay);
	}
	
	@RequestMapping(value = "/insertZhiChuData", method = RequestMethod.POST)
	public Map<String, Object> insertZhiChuData(@RequestBody Map<String,String> requestMap) throws Exception{

		Double zhiChuData = TypeUtil.toDouble(requestMap.get("insertZhiChuData"));
		Long dateYMD = TypeUtil.toLong(requestMap.get("insertDATEYMD"));
		Map<String, Object> map = new HashMap<>();
		map.put("zhiChuType", requestMap.get("insertZhiChuType"));
		map.put("zhiChuData", zhiChuData);
		map.put("zhiChuTime", dateYMD);
		Map<String, Object> result = zhiChuService.insertZhiChuData(map);
		
		return result;
	}

	@RequestMapping(value = "/getZCCountByYM", method = RequestMethod.POST)
	public Map<String, Object> getZCCountByYM(@RequestBody Map<String,String> requestMap) throws Exception{

		Long dateYMD = TypeUtil.toLong(requestMap.get("dateYM"));
		Map<String, Object> map = new HashMap<>();
		map.put("dateYMD", dateYMD);
		Map<String, Object> zcCountByYM = zhiChuService.getZCCountByYM(map);
		return zcCountByYM;
	}
}
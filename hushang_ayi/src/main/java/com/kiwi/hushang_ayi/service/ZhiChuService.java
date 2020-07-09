package com.kiwi.hushang_ayi.service;

import utils.JsonResult;

import java.util.List;
import java.util.Map;

public interface ZhiChuService {
	
	List<Map<String, Object>> getZhiChuByMonth(Integer dateYM);

	List<Map<String, Object>> getZhiChuByYear(Integer dateYear);

	List<Map<String, Object>> getZhiChuByMonthEcharts(Integer date);

	List<Map<String, Object>> getZhiChuByYearEcharts(Integer date);

	JsonResult insertZhiChuData(Map<String, Object> map);

	Map<String, Object> getZCCountByYear(Map<String, Object> map);

	Map<String, Object> getZCCountByYM(Map<String, Object> map);
}
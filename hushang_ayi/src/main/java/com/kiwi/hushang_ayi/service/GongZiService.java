package com.kiwi.hushang_ayi.service;

import utils.JsonResult;
import utils.LayUIUtil;

import java.util.List;
import java.util.Map;

public interface GongZiService {
	
	List<Map<String, Object>> getGongZiByMonth(Integer dateYM);

	List<Map<String, Object>> getGongZiByYear(Integer dateYear);

	List<Map<String, Object>> getGongZiByMonthEcharts(Integer date);

	List<Map<String, Object>> getGongZiEchartsByYear(Integer date);

	JsonResult insertGongZiData(Map<String, Object> map);

	Map<String, Object> getGZCountByYM(Map<String, Object> map);

	Map<String, Object> getGZCountByYear(Map<String, Object> map);
}
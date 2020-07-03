package com.kiwi.hushang_ayi.service;

import utils.JsonResult;

import java.util.List;
import java.util.Map;

public interface GongZiService {
	
	List<Map<String, Object>> getGongZiByMonth(Integer dateYM);

	List<Map<String, Object>> getGongZiByMonthEcharts(Integer date);

	JsonResult insertGongZiData(Map<String, Object> map);

	Map<String, Object> getGZCountByYM(Map<String, Object> map);
}
package com.kiwi.hushang_ayi.mapper;

import org.apache.ibatis.annotations.Mapper;
import utils.JsonResult;

import java.util.List;
import java.util.Map;

@Mapper
public interface GongZiMapper {
	
	List<Map<String, Object>> getGongZiByMonth(Integer date);

	List<Map<String, Object>> getGongZiByYear(Integer date);
	
	List<Map<String, Object>> getGongZiByMonthEcharts(Integer date);

	List<Map<String, Object>> getGongZiEchartsByYear(Integer date);

	void insertGongZiData(Map<String, Object> map);

	Map<String, Object> getGZCountByYM(Map<String, Object> map);

	Map<String, Object> getGZCountByYear(Map<String, Object> map);
}
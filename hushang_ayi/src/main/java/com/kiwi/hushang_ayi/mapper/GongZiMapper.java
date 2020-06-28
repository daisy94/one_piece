package com.kiwi.hushang_ayi.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface GongZiMapper {
	
	List<Map<String, Object>> getGongZiByMonth(Integer date);
	
	/*List<Map<String, Object>> getZhiChuByMonthDay(Integer date);*/

	List<Map<String, Object>> getGongZiByMonthEcharts(Integer date);
	
	/*void insertZhiChuData(Map<String, Object> map);*/

	/*Map<String, Object> getZCCountByYM(Map<String, Object> map);*/
}
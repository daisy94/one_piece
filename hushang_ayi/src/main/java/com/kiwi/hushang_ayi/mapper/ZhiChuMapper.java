package com.kiwi.hushang_ayi.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ZhiChuMapper {
	
	List<Map<String, Object>> getZhiChuByMonth(Integer date);

	List<Map<String, Object>> getZhiChuByYear(Integer date);

	List<Map<String, Object>> getZhiChuByMonthDay(Integer date);

	List<Map<String, Object>> getZhiChuByMonthEcharts(Integer date);

	List<Map<String, Object>> getZhiChuByYearEcharts(Integer date);

	void insertZhiChuData(Map<String, Object> map);

	Map<String, Object> getZCCountByYear(Map<String, Object> map);

	Map<String, Object> getZCCountByYM(Map<String, Object> map);
}
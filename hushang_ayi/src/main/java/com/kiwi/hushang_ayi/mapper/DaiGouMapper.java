package com.kiwi.hushang_ayi.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface DaiGouMapper {

    void insertDaiGouData(Map<String, Object> params);

    List<Map<String, Object>> getDaiGouDataByYearMonth(Integer params);

    List<Map<String, Object>> getDaiGouEChartsByYearMonth(Map<String, Object> params);
}

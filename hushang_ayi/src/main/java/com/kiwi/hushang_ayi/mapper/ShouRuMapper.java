package com.kiwi.hushang_ayi.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ShouRuMapper {

    List<Map<String, Object>> getShouRuByMonth(Integer date);

    List<Map<String, Object>> getShouRuByYear(Integer date);

    List<Map<String, Object>> getShouRuByMonthDay(Integer date);

    void insertShouRuData(Map<String, Object> map);

    Map<String, Object> getSRCountByYM(Map<String, Object> map);
}

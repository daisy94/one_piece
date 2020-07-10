package com.kiwi.hushang_ayi.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface TongJiMapper {

    List<Map<String, Object>> getTongJiEchartsDataByYear(Map<String, Object> params);
}

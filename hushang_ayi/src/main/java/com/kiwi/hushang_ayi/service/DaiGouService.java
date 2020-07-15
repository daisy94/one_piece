package com.kiwi.hushang_ayi.service;

import java.util.List;
import java.util.Map;

public interface DaiGouService {

    void insertDaiGouData(Map<String, Object> params);

    List<Map<String, Object>> getDaiGouDataByYearMonth(Integer params);

    List<Map<String, Object>> getDaiGouDataByYear(Integer params);

    Map<String, Object> getDaiGouEChartsByYearMonth(Map<String, Object> params);

    Map<String, Object> getDaiGouEChartsByYear(Map<String, Object> params);

    Map<String, Object> getDaiGouCountByYear (Map<String, Object> params);
}

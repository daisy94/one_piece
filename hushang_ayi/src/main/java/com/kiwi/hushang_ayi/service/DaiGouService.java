package com.kiwi.hushang_ayi.service;

import java.util.List;
import java.util.Map;

public interface DaiGouService {

    void insertDaiGouData(Map<String, Object> params);

    List<Map<String, Object>> getDaiGouDataByYearMonth(String params);

    Map<String, Object> getDaiGouEChartsByYearMonth(Map<String, Object> params);
}

package com.kiwi.hushang_ayi.service;

import java.util.List;
import java.util.Map;

public interface OnePieceService {

    void insertOnePieceData(Map<String, Object> params);

    void deleteOnePieceTableData(Map<String, Object> params);

    void updateOnePieceTableData(Map<String, Object> params);

    List<Map<String, Object>> getOnePieceDataByYearMonth(Integer params);

    List<Map<String, Object>> getOnePieceDataByYear(Integer params);

    Map<String, Object> getOnePieceEChartsByYearMonth(Map<String, Object> params);

    Map<String, Object> getOnePieceEChartsByYear(Map<String, Object> params);

    Map<String, Object> getOnePieceCountByYear (Map<String, Object> params);

    Map<String, String> getAchievementPercentage (Map<String, Object> params);
}

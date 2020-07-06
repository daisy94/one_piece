package com.kiwi.hushang_ayi.service;

import utils.JsonResult;

import java.util.List;
import java.util.Map;

public interface ShouRuService {

    List<Map<String, Object>> getShouRuByMonth(Integer dateYM);

    List<Map<String, Object>> getShouRuByYear(Integer dateYear);

    JsonResult insertShouRuData(Map<String, Object> map);

    Map<String, Object> getSRCountByYear(Map<String, Object> map);

    Map<String, Object> getSRCountByYM(Map<String, Object> map);
}

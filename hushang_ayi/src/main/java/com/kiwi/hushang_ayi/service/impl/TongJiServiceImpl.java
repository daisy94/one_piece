package com.kiwi.hushang_ayi.service.impl;

import com.kiwi.hushang_ayi.mapper.TongJiMapper;
import com.kiwi.hushang_ayi.service.TongJiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utils.JsonResult;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TongJiServiceImpl implements TongJiService {

    @Autowired
    TongJiMapper tongJiMapper;

    @Override
    public JsonResult getTongJiEchartsDataByYear(Map<String, Object> params) {

        List<Map<String, Object>> tongJiEchartsDataByYear = tongJiMapper.getTongJiEchartsDataByYear(params);
        for (Map<String, Object> tongJiEchartsDataByYearMap : tongJiEchartsDataByYear) {

            String lirunTime = String.valueOf(tongJiEchartsDataByYearMap.get("lirun_time"));
            String year = lirunTime.substring(0, 4);
            String month = lirunTime.substring(4, 6);
            tongJiEchartsDataByYearMap.put("lirun_time", year + "-" + month);
        }
        List<String> echartsMoney = new ArrayList<>();
        List<String> echartsTime = new ArrayList<>();
        for (Map<String, Object> tongJiEchartsDataByYearMap : tongJiEchartsDataByYear){

            echartsMoney.add(String.valueOf(tongJiEchartsDataByYearMap.get("lirun_money")));
            echartsTime.add(String.valueOf(tongJiEchartsDataByYearMap.get("lirun_time")));
        }
        Map<String, Object> result = new HashMap<>();
        result.put("echartsMoney",echartsMoney);
        result.put("echartsTime",echartsTime);
        return new JsonResult(result);
    }
}

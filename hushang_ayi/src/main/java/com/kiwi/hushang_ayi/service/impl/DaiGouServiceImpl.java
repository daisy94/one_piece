package com.kiwi.hushang_ayi.service.impl;

import com.kiwi.hushang_ayi.mapper.DaiGouMapper;
import com.kiwi.hushang_ayi.service.DaiGouService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DaiGouServiceImpl implements DaiGouService {

    @Autowired
    DaiGouMapper daiGouMapper;

    @Override
    public void insertDaiGouData(Map<String, Object> params) {
        daiGouMapper.insertDaiGouData(params);
    }

    @Override
    public List<Map<String, Object>> getDaiGouDataByYearMonth(Integer params) {

        List<Map<String, Object>> daiGouDataByYearMonth = daiGouMapper.getDaiGouDataByYearMonth(params);
        return formatByYearMonthDay(daiGouDataByYearMonth);
    }

    @Override
    public Map<String, Object> getDaiGouEChartsByYearMonth(Map<String, Object> params) {

        List<Map<String, Object>> daiGouEChartsByYearMonth = daiGouMapper.getDaiGouEChartsByYearMonth(params);
        List<Map<String, Object>> maps = formatByYearMonthDay(daiGouEChartsByYearMonth);
        return formatEChartsData(maps, "profit", "date");
    }

    private List<Map<String, Object>> formatByYearMonthDay(List<Map<String, Object>> params) {

        for (Map<String, Object> Map : params) {

            String date = String.valueOf(Map.get("date"));
            String year = date.substring(0, 4);
            String month = date.substring(4, 6);
            String day = date.substring(6, 8);
            Map.put("date", year + "-" + month + "-" + day);
        }
        return params;
    }

    private Map<String, Object> formatEChartsData(List<Map<String, Object>> params, String K1, String K2) {

        List<String> XList = new ArrayList<>();
        for (Map<String, Object> map: params) {
            String s = String.valueOf(map.get(K1));
            XList.add(s);
        }
        List<String> YList = new ArrayList<>();
        for (Map<String, Object> map: params) {
            String s = String.valueOf(map.get(K2));
            YList.add(s);
        }
        Map<String, Object> formatEChartsData = new HashMap<>();
        formatEChartsData.put("EChartsX",XList);
        formatEChartsData.put("EChartsY",YList);
        return formatEChartsData;
    }
}

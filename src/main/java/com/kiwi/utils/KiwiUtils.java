package com.kiwi.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 简单工具方法
 */
public class KiwiUtils {

    /**
     * 处理ECharts柱状图所需数据格式
     */
    public static Map<String, Object> formatEChartsData(List<Map<String, Object>> params, String Key1, String Key2) {

        List<String> ListOne = new ArrayList<>();

        for (Map<String, Object> map : params) {
            String s = String.valueOf(map.get(Key1));
            ListOne.add(s);
        }
        List<String> ListTwo = new ArrayList<>();

        for (Map<String, Object> map : params) {
            String s = String.valueOf(map.get(Key2));
            ListTwo.add(s);
        }
        Map<String, Object> formatEChartsData = new HashMap<>();
        formatEChartsData.put("EChartsX", ListTwo);
        formatEChartsData.put("EChartsY", ListOne);

        return formatEChartsData;
    }

}

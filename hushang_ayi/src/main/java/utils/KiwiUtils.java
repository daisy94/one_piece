package utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description: 一些kiwi写的简单工具方法
 * @Author: kiwi
 */
public class KiwiUtils {

    /**
     * 处理日期展示格式
     * @param params
     * @param Key
     * @return
     */
    public static List<Map<String, Object>> formatDate(List<Map<String, Object>> params, String Key) {

        for (Map<String, Object> Map : params) {

            String date = String.valueOf(Map.get(Key));
            if (date.length() == 8) {
                String year = date.substring(0, 4);
                String month = date.substring(4, 6);
                String day = date.substring(6, 8);
                Map.put(Key, year + "-" + month + "-" + day);
            }else if (date.length() == 6) {
                String year = date.substring(0, 4);
                String month = date.substring(4, 6);
                Map.put(Key, year + "-" + month);
            }
        }
        return params;
    }

    /**
     * 处理ECharts柱状图所需数据格式
     * @param params
     * @param Key1
     * @param Key2
     * @return
     */
    public static Map<String, Object> formatEChartsData(List<Map<String, Object>> params, String Key1, String Key2) {

        List<String> ListOne = new ArrayList<>();
        for (Map<String, Object> map: params) {
            String s = String.valueOf(map.get(Key1));
            ListOne.add(s);
        }
        List<String> ListTwo = new ArrayList<>();
        for (Map<String, Object> map: params) {
            String s = String.valueOf(map.get(Key2));
            ListTwo.add(s);
        }
        Map<String, Object> formatEChartsData = new HashMap<>();
        formatEChartsData.put("EChartsX",ListTwo);
        formatEChartsData.put("EChartsY",ListOne);
        return formatEChartsData;
    }
}

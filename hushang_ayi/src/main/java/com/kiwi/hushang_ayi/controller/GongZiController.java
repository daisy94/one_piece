package com.kiwi.hushang_ayi.controller;

import com.kiwi.hushang_ayi.service.GongZiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import utils.JsonResult;
import utils.LayUIUtil;
import utils.TypeUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class GongZiController {

    @Autowired
    GongZiService gongZiService;

    @RequestMapping(value = "/getGongZiByMonth", method = RequestMethod.POST)
    public LayUIUtil getGongZiByMonth(String dateYM, Integer page, Integer size) throws Exception{

        int date = TypeUtil.toInt(dateYM);

        List<Map<String, Object>> gongZiByMonth = gongZiService.getGongZiByMonth(date);
        int count = gongZiByMonth.size();

        return LayUIUtil.data(count, gongZiByMonth);
    }

    @RequestMapping(value = "/getGongZiByYear", method = RequestMethod.POST)
    public LayUIUtil getGongZiByYear(String dateYear, Integer page, Integer size) throws Exception{

        int date = TypeUtil.toInt(dateYear);

        List<Map<String, Object>> gongZiByYear = gongZiService.getGongZiByYear(date);
        int count = gongZiByYear.size();

        return LayUIUtil.data(count, gongZiByYear);
    }

    @RequestMapping(value = "/getGongZiEchartsByYM", method = RequestMethod.POST)
    public Map<String, Object> getGongZiEchartsByYM(String dateYM) throws Exception{

        int date = TypeUtil.toInt(dateYM);

        List<Map<String, Object>> gongZiByMonthEcharts = gongZiService.getGongZiByMonthEcharts(date);
        List<String> echartsRemark = new ArrayList<>();
        for (Map<String, Object> gongZiByMonthEchartsMap : gongZiByMonthEcharts){
            echartsRemark.add(TypeUtil.toString(gongZiByMonthEchartsMap.get("gongzi_remark")));
        }
        List<Map<String, String>> echartsData = new ArrayList<>();
        for(Map<String, Object> gongZiByMonthEchartsMap : gongZiByMonthEcharts){
            Map<String,String> echartsDataMap = new HashMap<>();
            echartsDataMap.put("value", TypeUtil.toString(gongZiByMonthEchartsMap.get("gongzi_money")));
            echartsDataMap.put("name", TypeUtil.toString(gongZiByMonthEchartsMap.get("gongzi_remark")));
            echartsData.add(echartsDataMap);
        }
        Map<String, Object> result = new HashMap<>();
        result.put("echartsRemark",echartsRemark);
        result.put("echartsData",echartsData);
        return result;
    }

    @RequestMapping(value = "/getGongZiEchartsByYear", method = RequestMethod.POST)
    public Map<String, Object> getGongZiEchartsByYear(String dateYear) throws Exception{

        int date = TypeUtil.toInt(dateYear);

        List<Map<String, Object>> gongZiEchartsByYear = gongZiService.getGongZiEchartsByYear(date);
        List<String> echartsMoney = new ArrayList<>();
        List<String> echartsTime = new ArrayList<>();
        for (Map<String, Object> shouRuByMonthMap : gongZiEchartsByYear){

            echartsMoney.add(TypeUtil.toString(shouRuByMonthMap.get("gongzi_money")));
            echartsTime.add(TypeUtil.toString(shouRuByMonthMap.get("gongzi_time")));
        }
        Map<String, Object> result = new HashMap<>();
        result.put("echartsMoney",echartsMoney);
        result.put("echartsTime",echartsTime);
        return result;
    }

    @RequestMapping(value = "/insertGongZiData", method = RequestMethod.POST)
    public JsonResult insertGongZiData(@RequestBody Map<String,Object> requestMap) throws Exception{

        Double gongZiData = TypeUtil.toDouble(requestMap.get("insertGongZiData"));
        Long dateYMD = TypeUtil.toLong(requestMap.get("insertDateYM"));
        Map<String, Object> map = new HashMap<>();
        map.put("gongzi_name", requestMap.get("insertGongZiType"));
        map.put("gongzi_remark", requestMap.get("insertGongZiRemark"));
        map.put("gongzi_money", gongZiData);
        map.put("gongzi_time", dateYMD);

        return gongZiService.insertGongZiData(map);
    }

    @RequestMapping(value = "/getGZCountByYear", method = RequestMethod.POST)
    public JsonResult getGZCountByYear(@RequestBody Map<String,String> requestMap) throws Exception{

        Long dateYear = TypeUtil.toLong(requestMap.get("dateYear"));
        Map<String, Object> map = new HashMap<>();
        map.put("dateYear", dateYear);
        Map<String, Object> gzCountByYear = gongZiService.getGZCountByYear(map);
        return new JsonResult(gzCountByYear);
    }

    @RequestMapping(value = "/getGongZiExcelByMonth", method = RequestMethod.POST)
    public JsonResult getGongZiExcelByMonth(@RequestBody Map<String,String> requestMap) throws Exception{

        int date = TypeUtil.toInt(requestMap.get("dateYM"));

        List<Map<String, Object>> gongZiByMonth = gongZiService.getGongZiByMonth(date);
       Map<String, Object> map = new HashMap<>();
        map.put("dateYM", date);
        Map<String, Object> gzCountByYM = gongZiService.getGZCountByYM(map);
        map.put("gongzi_name","合计");
        map.put("gongzi_money",gzCountByYM.get("gongZiCount"));
        gongZiByMonth.add(map);
        return new JsonResult(gongZiByMonth);
    }
}

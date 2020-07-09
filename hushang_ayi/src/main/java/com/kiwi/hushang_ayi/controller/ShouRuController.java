package com.kiwi.hushang_ayi.controller;

import com.kiwi.hushang_ayi.service.ShouRuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import utils.JsonResult;
import utils.LayUIUtil;
import utils.TypeUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class ShouRuController {

    @Autowired
    ShouRuService shouRuService;

    @RequestMapping(value = "/getShouRuByMonth", method = RequestMethod.POST)
    public LayUIUtil getShouRuByMonth(String dateYM, Integer page, Integer size) throws Exception{

        int date = TypeUtil.toInt(dateYM);

        List<Map<String, Object>> shouRuByMonth = shouRuService.getShouRuByMonth(date);
        int count = shouRuByMonth.size();

        return LayUIUtil.data(count, shouRuByMonth);
    }

    @RequestMapping(value = "/getShouRuByYear", method = RequestMethod.POST)
    public LayUIUtil getShouRuByYear(String date, Integer page, Integer size) throws Exception{

        int dateYear = TypeUtil.toInt(date);

        List<Map<String, Object>> shouRuByYear = shouRuService.getShouRuByYear(dateYear);
        int count = shouRuByYear.size();

        return LayUIUtil.data(count, shouRuByYear);
    }

    @RequestMapping(value = "/getShouRuByMonthEcharts", method = RequestMethod.POST)
    public Map<String, Object> getShouRuByMonthEcharts(String dateYM) throws Exception{

        int date = TypeUtil.toInt(dateYM);

        List<Map<String, Object>> shouRuByMonth = shouRuService.getShouRuByMonth(date);
        List<String> echartsMoney = new ArrayList<>();
        List<String> echartsTime = new ArrayList<>();
        for (Map<String, Object> shouRuByMonthMap : shouRuByMonth){

            echartsMoney.add(TypeUtil.toString(shouRuByMonthMap.get("shouru_money")));
            echartsTime.add(TypeUtil.toString(shouRuByMonthMap.get("shouru_time")));
        }
        Map<String, Object> result = new HashMap<>();
        result.put("echartsMoney",echartsMoney);
        result.put("echartsTime",echartsTime);
        return result;
    }

    @RequestMapping(value = "/getShouRuByYearEcharts", method = RequestMethod.POST)
    public Map<String, Object> getShouRuByYearEcharts(String dateY) throws Exception{

        int date = TypeUtil.toInt(dateY);

        List<Map<String, Object>> shouRuByYear = shouRuService.getShouRuByYear(date);
        List<String> echartsMoney = new ArrayList<>();
        List<String> echartsTime = new ArrayList<>();
        for (Map<String, Object> shouRuByYearMap : shouRuByYear){

            echartsMoney.add(TypeUtil.toString(shouRuByYearMap.get("shouru_money")));
            echartsTime.add(TypeUtil.toString(shouRuByYearMap.get("shouru_time")));
        }
        Map<String, Object> result = new HashMap<>();
        result.put("echartsMoney",echartsMoney);
        result.put("echartsTime",echartsTime);
        return result;
    }

    @RequestMapping(value = "/getShouRuByMonthExcel", method = RequestMethod.POST)
    public JsonResult getShouRuByMonthExcel(@RequestBody Map<String,Object> requestMap) throws Exception{

        int date = TypeUtil.toInt(requestMap.get("dateYM"));

        List<Map<String, Object>> shouRuByMonth = shouRuService.getShouRuByMonth(date);
        Map<String, Object> map = new HashMap<>();
        map.put("dateYM", date);
        Map<String, Object> srCountByYM = shouRuService.getSRCountByYM(map);
        map.put("shouru_money","合计");
        map.put("shouru_time",srCountByYM.get("shouRuCount"));
        shouRuByMonth.add(map);
        return new JsonResult(shouRuByMonth);
    }

    @RequestMapping(value = "/insertShouRuData", method = RequestMethod.POST)
    public JsonResult insertShouRuData(@RequestBody Map<String,Object> requestMap) throws Exception{

        Double shouRuData = TypeUtil.toDouble(requestMap.get("insertShouRuData"));
        Long dateYMD = TypeUtil.toLong(requestMap.get("insertDateYMD"));
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("shouRuData", shouRuData);
        map.put("dateYMD", dateYMD);
        return shouRuService.insertShouRuData(map);
    }

    @RequestMapping(value = "/getSRCountByYear", method = RequestMethod.POST)
    public Map<String, Object> getSRCountByYear(@RequestBody Map<String,String> requestMap) throws Exception{

        int dateYear = TypeUtil.toInt(requestMap.get("date"));
        Map<String, Object> map = new HashMap<>();
        map.put("dateYear", dateYear);
        Map<String, Object> srCountByYear = shouRuService.getSRCountByYear(map);
        return srCountByYear;
    }
}

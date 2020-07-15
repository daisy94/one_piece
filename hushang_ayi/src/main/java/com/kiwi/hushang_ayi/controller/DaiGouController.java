package com.kiwi.hushang_ayi.controller;

import com.kiwi.hushang_ayi.service.DaiGouService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import utils.InfoCode;
import utils.JsonResult;
import utils.TypeUtil;

import java.util.List;
import java.util.Map;

@RestController
public class DaiGouController {

    @Autowired
    DaiGouService daiGouService;

    //新增恰饭收入数据
    @RequestMapping(value = "/insertDaiGouData", method = RequestMethod.POST)
    public JsonResult insertDaiGouData(@RequestBody Map<String, Object> params)throws Exception{

        try {
            daiGouService.insertDaiGouData(params);
            return new JsonResult(InfoCode.SAVE_SUCCESS.code, InfoCode.SAVE_SUCCESS.msg);
        }catch (Exception e){
            return new JsonResult(InfoCode.SAVE_FAIL.code, InfoCode.SAVE_FAIL.msg);
        }
    }

    //按月份查询恰饭表格所需数据
    @RequestMapping(value = "/getDaiGouTableYearMonth", method = RequestMethod.POST)
    public JsonResult<List<Map<String, Object>>> getGongZiByMonth(String dateYearMonth) throws Exception{

        List<Map<String, Object>> daiGouDataByYearMonth = daiGouService.getDaiGouDataByYearMonth(TypeUtil.toInt(dateYearMonth));
        int count = daiGouDataByYearMonth.size();
        return new JsonResult<>(daiGouDataByYearMonth, count);
    }

    //按年份查询恰饭表格所需数据
    @RequestMapping(value = "/getDaiGouTableYear", method = RequestMethod.POST)
    public JsonResult<List<Map<String, Object>>> getDaiGouTableYear(String dateYear) throws Exception{

        List<Map<String, Object>> daiGouDataByYear = daiGouService.getDaiGouDataByYear(TypeUtil.toInt(dateYear));
        int count = daiGouDataByYear.size();
        return new JsonResult<>(daiGouDataByYear, count);
    }

    //按月份查询恰饭ECharts所需数据
    @RequestMapping(value = "/getDaiGouEChartsByYearMonth", method = RequestMethod.POST)
    public JsonResult<Map<String, Object>> getDaiGouEChartsByYearMonth(@RequestBody Map<String, Object> params)throws Exception{

        Map<String, Object> daiGouEChartsByYearMonth = daiGouService.getDaiGouEChartsByYearMonth(params);
        return new JsonResult<>(daiGouEChartsByYearMonth);
    }

    //按年份查询恰饭ECharts所需数据
    @RequestMapping(value = "/getDaiGouEChartsByYear", method = RequestMethod.POST)
    public JsonResult<Map<String, Object>> getDaiGouEChartsByYear(@RequestBody Map<String, Object> params)throws Exception{

        Map<String, Object> daiGouEChartsByYear = daiGouService.getDaiGouEChartsByYear(params);
        return new JsonResult<>(daiGouEChartsByYear);
    }

    //按年份查询恰饭收入总和
    @RequestMapping(value = "/getDaiGouCountByYear", method = RequestMethod.POST)
    public JsonResult<Map<String, Object>> getDaiGouCountByYear(@RequestBody Map<String, Object> params)throws Exception{

        Map<String, Object> daiGouCountByYear = daiGouService.getDaiGouCountByYear(params);
        return new JsonResult<>(daiGouCountByYear);
    }
}

package com.kiwi.hushang_ayi.controller;

import com.kiwi.hushang_ayi.service.DaiGouService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import utils.InfoCode;
import utils.JsonResult;

import java.util.List;
import java.util.Map;

@RestController
public class DaiGouController {

    @Autowired
    DaiGouService daiGouService;

    @RequestMapping(value = "/insertDaiGouData", method = RequestMethod.POST)
    public JsonResult insertDaiGouData(@RequestBody Map<String, Object> params)throws Exception{

        try {
            daiGouService.insertDaiGouData(params);
            return new JsonResult(InfoCode.SAVE_SUCCESS.code, InfoCode.SAVE_SUCCESS.msg);
        }catch (Exception e){
            return new JsonResult(InfoCode.SAVE_FAIL.code, InfoCode.SAVE_FAIL.msg);
        }
    }

    @RequestMapping(value = "/getDaiGouTableYearMonth", method = RequestMethod.POST)
    public JsonResult<List<Map<String, Object>>> getGongZiByMonth(String dateYearMonth) throws Exception{

        List<Map<String, Object>> daiGouDataByYearMonth = daiGouService.getDaiGouDataByYearMonth(dateYearMonth);
        int count = daiGouDataByYearMonth.size();
        return new JsonResult<>(daiGouDataByYearMonth, count);
    }

    @RequestMapping(value = "/getDaiGouEChartsByYearMonth", method = RequestMethod.POST)
    public JsonResult<Map<String, Object>> getDaiGouEChartsByYearMonth(@RequestBody Map<String, Object> params)throws Exception{

        Map<String, Object> daiGouEChartsByYearMonth = daiGouService.getDaiGouEChartsByYearMonth(params);
        return new JsonResult<>(daiGouEChartsByYearMonth);
    }
}

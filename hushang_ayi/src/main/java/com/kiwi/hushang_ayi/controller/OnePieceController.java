package com.kiwi.hushang_ayi.controller;

import com.kiwi.hushang_ayi.service.OnePieceService;
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
public class OnePieceController {

    @Autowired
    OnePieceService onePieceService;

    //新增恰饭收入数据
    @RequestMapping(value = "/insertOnePieceData", method = RequestMethod.POST)
    public JsonResult insertOnePieceData(@RequestBody Map<String, Object> params)throws Exception{

        try {
            onePieceService.insertOnePieceData(params);
            return new JsonResult(InfoCode.SAVE_SUCCESS.code, InfoCode.SAVE_SUCCESS.msg);
        }catch (Exception e){
            return new JsonResult(InfoCode.SAVE_FAIL.code, InfoCode.SAVE_FAIL.msg);
        }
    }

    //按月份查询恰饭表格所需数据
    @RequestMapping(value = "/getOnePieceTableYearMonth", method = RequestMethod.POST)
    public JsonResult<List<Map<String, Object>>> getGongZiByMonth(@RequestBody Map<String, Object> params) throws Exception{

        List<Map<String, Object>> onePieceDataByYearMonth = onePieceService.getOnePieceDataByYearMonth(TypeUtil.toInt(params.get("dateYearMonth")));
        int count = onePieceDataByYearMonth.size();
        return new JsonResult<>(onePieceDataByYearMonth, count);
    }

    //按年份查询恰饭表格所需数据
    @RequestMapping(value = "/getOnePieceTableYear", method = RequestMethod.POST)
    public JsonResult<List<Map<String, Object>>> getOnePieceTableYear(@RequestBody Map<String, Object> params) throws Exception{

        List<Map<String, Object>> onePieceDataByYear = onePieceService.getOnePieceDataByYear(TypeUtil.toInt(params.get("dateYear")));
        int count = onePieceDataByYear.size();
        return new JsonResult<>(onePieceDataByYear, count);
    }

    //按月份查询恰饭ECharts所需数据
    @RequestMapping(value = "/getOnePieceEChartsByYearMonth", method = RequestMethod.POST)
    public JsonResult<Map<String, Object>> getOnePieceEChartsByYearMonth(@RequestBody Map<String, Object> params)throws Exception{

        Map<String, Object> onePieceEChartsByYearMonth = onePieceService.getOnePieceEChartsByYearMonth(params);
        return new JsonResult<>(onePieceEChartsByYearMonth);
    }

    //按年份查询恰饭ECharts所需数据
    @RequestMapping(value = "/getOnePieceEChartsByYear", method = RequestMethod.POST)
    public JsonResult<Map<String, Object>> getOnePieceEChartsByYear(@RequestBody Map<String, Object> params)throws Exception{

        Map<String, Object> onePieceEChartsByYear = onePieceService.getOnePieceEChartsByYear(params);
        return new JsonResult<>(onePieceEChartsByYear);
    }

    //按年份查询恰饭收入总和
    @RequestMapping(value = "/getOnePieceCountByYear", method = RequestMethod.POST)
    public JsonResult<Map<String, Object>> getOnePieceCountByYear(@RequestBody Map<String, Object> params)throws Exception{

        Map<String, Object> onePieceCountByYear = onePieceService.getOnePieceCountByYear(params);
        return new JsonResult<>(onePieceCountByYear);
    }
}

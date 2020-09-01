package com.kiwi.hushang_ayi.controller;

import com.kiwi.hushang_ayi.service.OnePieceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import utils.InfoCode;
import utils.JsonResult;
import utils.TypeUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class OnePieceController {

    @Autowired
    OnePieceService onePieceService;

    // 新增恰饭收入数据
    @RequestMapping(value = "/insertOnePieceData", method = RequestMethod.POST)
    public JsonResult insertOnePieceData (@RequestBody Map<String, Object> params)throws Exception{

        try {
            onePieceService.insertOnePieceData(params);
            return new JsonResult(InfoCode.SAVE_SUCCESS);
        }catch (Exception e){
            return new JsonResult(InfoCode.SAVE_FAIL);
        }
    }

    // 删除恰饭收入数据
    @RequestMapping(value = "/deleteOnePieceTableData", method = RequestMethod.POST)
    public JsonResult deleteOnePieceTableData (@RequestBody Map<String, Object> params)throws Exception{

        try {
            onePieceService.deleteOnePieceTableData(params);
            return new JsonResult(InfoCode.DELETE_SUCCESS);
        }catch (Exception e){
            return new JsonResult(InfoCode.DELETE_FAIL);
        }
    }

    // 修改恰饭收入数据
    @RequestMapping(value = "/updateOnePieceTableData", method = RequestMethod.POST)
    public JsonResult updateOnePieceTableData (@RequestBody Map<String, Object> params)throws Exception{

        try {
            onePieceService.updateOnePieceTableData(params);
            return new JsonResult(InfoCode.UPDATE_SUCCESS);
        }catch (Exception e){
            return new JsonResult(InfoCode.UPDATE_FAIL);
        }
    }

    // 按月份查询恰饭表格所需数据
    @RequestMapping(value = "/getOnePieceTableYearMonth", method = RequestMethod.POST)
    public JsonResult getGongZiByMonth (@RequestBody Map<String, Object> params) throws Exception{

        List<Map<String, Object>> onePieceDataByYearMonth = onePieceService.getOnePieceDataByYearMonth(params);
        int count = onePieceDataByYearMonth.size();
        return new JsonResult<>(onePieceDataByYearMonth, count);
    }

    // 按年份查询恰饭表格所需数据
    @RequestMapping(value = "/getOnePieceTableYear", method = RequestMethod.POST)
    public JsonResult getOnePieceTableYear (@RequestBody Map<String, Object> params) throws Exception{

        List<Map<String, Object>> onePieceDataByYear = onePieceService.getOnePieceDataByYear(TypeUtil.toInt(params.get("dateYear")));
        int count = onePieceDataByYear.size();
        return new JsonResult<>(onePieceDataByYear, count);
    }

    // 按月份查询恰饭ECharts所需数据
    @RequestMapping(value = "/getOnePieceEChartsByYearMonth", method = RequestMethod.POST)
    public JsonResult getOnePieceEChartsByYearMonth (@RequestBody Map<String, Object> params)throws Exception{

        Map<String, Object> onePieceEChartsByYearMonth = onePieceService.getOnePieceEChartsByYearMonth(params);
        return new JsonResult<>(onePieceEChartsByYearMonth);
    }

    // 按年份查询恰饭ECharts所需数据
    @RequestMapping(value = "/getOnePieceEChartsByYear", method = RequestMethod.POST)
    public JsonResult getOnePieceEChartsByYear (@RequestBody Map<String, Object> params)throws Exception{

        Map<String, Object> onePieceEChartsByYear = onePieceService.getOnePieceEChartsByYear(params);
        return new JsonResult<>(onePieceEChartsByYear);
    }

    // 按年份查询恰饭收入总和
    @RequestMapping(value = "/getOnePieceCountByYear", method = RequestMethod.POST)
    public JsonResult getOnePieceCountByYear (@RequestBody Map<String, Object> params)throws Exception{

        Map<String, Object> onePieceCountByYear = onePieceService.getOnePieceCountByYear(params);
        return new JsonResult<>(onePieceCountByYear);
    }

    // 按月份查询恰饭收入目标业绩百分比
    @RequestMapping(value = "/getAchievementPercentage", method = RequestMethod.POST)
    public JsonResult getAchievementPercentage (@RequestBody Map<String, Object> params)throws Exception{

        Map<String, Object> achievementPercentage = onePieceService.getAchievementPercentage(params);
        return new JsonResult<>(achievementPercentage);
    }

    // 新增姨妈周期数据
    @RequestMapping(value = "/insertMenstruationCycleData", method = RequestMethod.POST)
    public JsonResult insertMenstruationCycleData (@RequestBody Map<String, Object> params)throws Exception{

        try {
            onePieceService.insertMenstruationCycleData(params);
            return new JsonResult(InfoCode.SAVE_SUCCESS);
        }catch (Exception e){
            return new JsonResult(InfoCode.SAVE_FAIL);
        }
    }

    // 查询姨妈周期表格所需数据
    @RequestMapping(value = "/getMenstruationCycleTable", method = RequestMethod.POST)
    public JsonResult getMenstruationCycleTable (@RequestBody Map<String, Object> params) throws Exception{

        List<Map<String, Object>> menstruationCycleTable = onePieceService.getMenstruationCycleTable(params);
        int count = menstruationCycleTable.size();
        return new JsonResult<>(menstruationCycleTable, count);
    }

    // 修改是否已发货状态
    @RequestMapping(value = "/updateOnePieceDeliverState", method = RequestMethod.POST)
    public JsonResult updateOnePieceDeliverState (@RequestBody Map<String, Object> params)throws Exception{

        try {
            onePieceService.updateOnePieceDeliverState(params);
            return new JsonResult(InfoCode.UPDATE_SUCCESS);
        }catch (Exception e){
            return new JsonResult(InfoCode.UPDATE_FAIL);
        }
    }

    // 查询参与抽奖顾客信息
    @RequestMapping(value = "/getLuckDrawData", method = RequestMethod.POST)
    public JsonResult getLuckDrawData (@RequestBody Map<String, Object> params) throws Exception{

        try {
            Map<String, Object> luckDrawData = onePieceService.getLuckDrawData(params);
            return new JsonResult<>(luckDrawData);
        }catch (Exception e) {
            return new JsonResult<>(InfoCode.OPERATION_FAIL);
        }
    }

    // 保存图片至服务器
    @RequestMapping(value = "/savePhotoAndData", method = RequestMethod.POST)
    public JsonResult savePhotoAndData(MultipartFile file, String dateYearMonth, String remark, String photoName) throws Exception{

        if (("").equals(dateYearMonth) || ("").equals(remark) || ("").equals(photoName)){
            return new JsonResult(InfoCode.PARAMS_ERROR);
        }

        Map<String, Object> params = new HashMap<>();
        params.put("photoName", photoName);
        params.put("dateYearMonth", dateYearMonth);
        params.put("remark", remark);
        try {
            onePieceService.savePhotoAndData(file, params);
            return new JsonResult(InfoCode.SAVE_SUCCESS);
        } catch(Exception e){
            return new JsonResult<>(InfoCode.SAVE_FAIL);
        }
    }

    // 查询照片和相关信息
    @RequestMapping(value = "/getPhotoInfo", method = RequestMethod.POST)
    public JsonResult getPhotoInfo (@RequestBody Map<String, Object> params) throws Exception{

        try {
            List<Map<String, Object>> photoInfo = onePieceService.getPhotoInfo(params);
            return new JsonResult<>(photoInfo);
        }catch (Exception e) {
            return new JsonResult<>(InfoCode.OPERATION_FAIL);
        }
    }
}

package com.kiwi.hushang_ayi.service.impl;

import com.kiwi.hushang_ayi.mapper.OnePieceMapper;
import com.kiwi.hushang_ayi.service.OnePieceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utils.KiwiUtils;
import utils.TypeUtil;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OnePieceServiceImpl implements OnePieceService {

    @Autowired
    OnePieceMapper onePieceMapper;

    //新增恰饭收入数据
    @Override
    public void insertOnePieceData(Map<String, Object> params) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String updateTime = sdf.format(new Date());
        params.put("updateTime", updateTime);
        onePieceMapper.insertOnePieceData(params);
    }

    //删除恰饭收入数据
    @Override
    public void deleteOnePieceTableData(Map<String, Object> params) {
        onePieceMapper.deleteOnePieceTableData(params);
    }

    //修改恰饭收入数据
    @Override
    public void updateOnePieceTableData(Map<String, Object> params) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String updateTime = sdf.format(new Date());
        params.put("updateTime", updateTime);
        onePieceMapper.updateOnePieceTableData(params);
    }

    //按月份查询恰饭表格所需数据
    @Override
    public List<Map<String, Object>> getOnePieceDataByYearMonth(Integer params) {

        List<Map<String, Object>> onePieceDataByYearMonth = onePieceMapper.getOnePieceDataByYearMonth(params);
        return KiwiUtils.formatDate(onePieceDataByYearMonth, "date");
    }

    //按年份查询恰饭表格所需数据
    @Override
    public List<Map<String, Object>> getOnePieceDataByYear(Integer params) {

        List<Map<String, Object>> onePieceDataByYear = onePieceMapper.getOnePieceDataByYear(params);
        return KiwiUtils.formatDate(onePieceDataByYear, "date");
    }

    //按月份查询恰饭ECharts所需数据
    @Override
    public Map<String, Object> getOnePieceEChartsByYearMonth(Map<String, Object> params) {

        List<Map<String, Object>> onePieceEChartsByYearMonth = onePieceMapper.getOnePieceEChartsByYearMonth(params);
        List<Map<String, Object>> maps = KiwiUtils.formatDate(onePieceEChartsByYearMonth, "date");
        return KiwiUtils.formatEChartsData(maps, "profit", "date");
    }

    //按年份查询恰饭ECharts所需数据
    @Override
    public Map<String, Object> getOnePieceEChartsByYear(Map<String, Object> params) {

        List<Map<String, Object>> dateYear = onePieceMapper.getOnePieceDataByYear(TypeUtil.toInt(params.get("dateYear")));
        List<Map<String, Object>> maps = KiwiUtils.formatDate(dateYear, "date");
        return KiwiUtils.formatEChartsData(maps, "profit", "date");
    }

    //按年份查询恰饭收入总和
    @Override
    public Map<String, Object> getOnePieceCountByYear(Map<String, Object> params) {
        return onePieceMapper.getOnePieceCountByYear(params);
    }

    //按月份查询恰饭收入目标业绩百分比
    @Override
    public Map<String, String> getAchievementPercentage(Map<String, Object> params) {

        DecimalFormat df = new DecimalFormat("#.00");
        Map<String, Object> onePieceCountByMonth = onePieceMapper.getOnePieceCountByMonth(params);
        double profitCount = Double.parseDouble(String.valueOf(onePieceCountByMonth.get("profit")));
        double targetProfit = 5000;
        String achievementPercentage = df.format((profitCount / targetProfit * 100)) + "%";
        Map<String, String> result = new HashMap<>();
        result.put("achievementPercentage", achievementPercentage);
        return result;
    }
}

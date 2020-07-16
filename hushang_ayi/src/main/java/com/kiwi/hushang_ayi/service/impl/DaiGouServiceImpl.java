package com.kiwi.hushang_ayi.service.impl;

import com.kiwi.hushang_ayi.mapper.DaiGouMapper;
import com.kiwi.hushang_ayi.service.DaiGouService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utils.KiwiUtils;
import utils.TypeUtil;

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
        return KiwiUtils.formatDate(daiGouDataByYearMonth, "date");
    }

    @Override
    public List<Map<String, Object>> getDaiGouDataByYear(Integer params) {

        List<Map<String, Object>> daiGouDataByYear = daiGouMapper.getDaiGouDataByYear(params);
        return KiwiUtils.formatDate(daiGouDataByYear, "date");
    }

    @Override
    public Map<String, Object> getDaiGouEChartsByYearMonth(Map<String, Object> params) {

        List<Map<String, Object>> daiGouEChartsByYearMonth = daiGouMapper.getDaiGouEChartsByYearMonth(params);
        List<Map<String, Object>> maps = KiwiUtils.formatDate(daiGouEChartsByYearMonth, "date");
        return KiwiUtils.formatEChartsData(maps, "profit", "date");
    }

    @Override
    public Map<String, Object> getDaiGouEChartsByYear(Map<String, Object> params) {

        List<Map<String, Object>> dateYear = daiGouMapper.getDaiGouDataByYear(TypeUtil.toInt(params.get("dateYear")));
        List<Map<String, Object>> maps = KiwiUtils.formatDate(dateYear, "date");
        return KiwiUtils.formatEChartsData(maps, "profit", "date");
    }

    @Override
    public Map<String, Object> getDaiGouCountByYear(Map<String, Object> params) {
        return daiGouMapper.getDaiGouCountByYear(params);
    }
}

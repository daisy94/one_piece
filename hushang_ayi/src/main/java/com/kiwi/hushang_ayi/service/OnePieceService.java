package com.kiwi.hushang_ayi.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface OnePieceService {

    /**
     * 新增恰饭收入数据
     * @param params
     */
    void insertOnePieceData (Map<String, Object> params);

    /**
     * 删除恰饭收入数据
     * @param params
     */
    void deleteOnePieceTableData (Map<String, Object> params);

    /**
     * 修改恰饭收入数据
     * @param params
     */
    void updateOnePieceTableData (Map<String, Object> params);

    /**
     * 按月份查询恰饭表格所需数据
     * @param params
     * @return
     */
    List<Map<String, Object>> getOnePieceDataByYearMonth (Map<String, Object> params);

    /**
     * 按年份查询恰饭表格所需数据
     * @param params
     * @return
     */
    List<Map<String, Object>> getOnePieceDataByYear (Integer params);

    /**
     * 按月份查询恰饭ECharts所需数据
     * @param params
     * @return
     */
    Map<String, Object> getOnePieceEChartsByYearMonth (Map<String, Object> params);

    /**
     * 按年份查询恰饭ECharts所需数据
     * @param params
     * @return
     */
    Map<String, Object> getOnePieceEChartsByYear (Map<String, Object> params);

    /**
     * 按年份查询恰饭收入总和
     * @param params
     * @return
     */
    Map<String, Object> getOnePieceCountByYear (Map<String, Object> params);

    /**
     * 按月份查询恰饭收入目标业绩百分比
     * @param params
     * @return
     */
    Map<String, Object> getAchievementPercentage (Map<String, Object> params);

    /**
     * 新增姨妈周期数据
     * @param params
     */
    void insertMenstruationCycleData (Map<String, Object> params);

    /**
     * 查询姨妈周期表格所需数据
     * @param params
     * @return
     */
    List<Map<String, Object>> getMenstruationCycleTable (Map<String, Object> params);

    /**
     * 修改是否已发货状态
     * @param params
     */
    void updateOnePieceDeliverState (Map<String, Object> params);

    /**
     * 查询参与抽奖顾客信息
     * @param params
     * @return
     */
    Map<String, Object> getLuckDrawData (Map<String, Object> params);

    /**
     * 保存图片至服务器，保存照片信息至数据库
     * @param file
     * @param params
     */
    void savePhotoAndData (MultipartFile file, Map<String, Object> params) throws IOException;

    /**
     * 查询照片和相关信息
     * @param params
     * @return
     */
    List<Map<String, Object>> getPhotoInfo(Map<String, Object> params);
}

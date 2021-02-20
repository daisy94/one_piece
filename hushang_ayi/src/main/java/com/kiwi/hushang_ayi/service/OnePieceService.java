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
    void insertOrder (Map<String, Object> params);

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
     * 保存照片至服务器，保存照片信息至数据库
     * @param file
     * @param params
     */
    void savePhotoAndData (MultipartFile file, Map<String, Object> params) throws IOException;

    /**
     * 保存相册封面至服务器，保存相册封面信息至数据库
     * @param file
     * @param params
     */
    void savePhotoCover (MultipartFile file, Map<String, Object> params) throws IOException;

    /**
     * @Author: fujianhao
     * @Description: 查询该月份相册是否已经存在
     * @Date: 2021/2/19
     * @Param: [params]
     * @Return: int
     */
    int queryPhotoAlbum(Map<String, Object> params);

    /**
     * 查询相册和相关信息
     * @param params
     * @return
     */
    List<Map<String, Object>> getPhotoAlbumInfo(Map<String, Object> params);

    /**
     * 查询照片和相关信息
     * @param params
     * @return
     */
    List<Map<String, Object>> getPhotoInfo(Map<String, Object> params);

    /**
     * 新增顾客信息
     * @param params
     */
    void insertCustomer(Map<String, Object> params);

    /**
     * @Author: fujianhao
     * @Description: 查询顾客信息
     * @Date: 2021/1/17
     * @Param: [params]
     * @Return: java.util.List<java.util.Map<java.lang.String,java.lang.Object>>
     */
    List<Map<String, Object>> getCustomerTable(Map<String, Object> params);

    /**
     * @Author: fujianhao
     * @Description: 删除顾客信息
     * @Date: 2021/1/17
     * @Param: [params]
     * @Return: java.util.List<java.util.Map<java.lang.String,java.lang.Object>>
     */
    void deleteCustomer(Map<String, Object> params);

    /**
     * @Author: fujianhao
     * @Description: 修改顾客信息
     * @Date: 2021/1/17
     * @Param: [params]
     * @Return: java.util.List<java.util.Map<java.lang.String,java.lang.Object>>
     */
    void updateCustomer(Map<String, Object> params);

    /**
     * @Author: fujianhao
     * @Description: 新增商品信息
     * @Date: 2021/1/17
     * @Param: [params]
     * @Return: void
     */
    void insertProduct(Map<String, Object> params);

    /**
     * @Author: fujianhao
     * @Description: 删除商品信息
     * @Date: 2021/1/18
     * @Param: [params]
     * @Return: void
     */
    void deleteProduct(Map<String, Object> params);

    /**
     * @Author: fujianhao
     * @Description: 修改商品信息
     * @Date: 2021/1/18
     * @Param: [params]
     * @Return: void
     */
    void updateProduct(Map<String, Object> params);

    /**
     * @Author: fujianhao
     * @Description: 查询商品信息
     * @Date: 2021/1/17
     * @Param: [params]
     * @Return: java.util.List<java.util.Map<java.lang.String,java.lang.Object>>
     */
    List<Map<String, Object>> getProductTable(Map<String, Object> params);

    /**
     * @Author: fujianhao
     * @Description: 获取下拉框列表
     * @Date: 2021/1/19
     * @Param: [params]
     * @Return: java.util.Map<java.lang.String,java.lang.Object>
     */
    Map<String, Object> getDropDownList();
}

package com.kiwi.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface OnePieceMapper {

    /**
     * 新增恰饭收入数据
     *
     * @param params
     */
    void insertOrder(Map<String, Object> params);

    /**
     * 删除恰饭收入数据
     *
     * @param params
     */
    void deleteOnePieceTableData(Map<String, Object> params);

    /**
     * 修改恰饭收入数据
     *
     * @param params
     */
    void updateOnePieceTableData(Map<String, Object> params);

    /**
     * 按月份查询恰饭表格所需数据
     *
     * @param params
     * @return
     */
    List<Map<String, Object>> getOnePieceDataByYearMonth(Map<String, Object> params);

    /**
     * 按月份查询恰饭ECharts所需数据
     *
     * @param params
     * @return
     */
    List<Map<String, Object>> getOnePieceEChartsByYearMonth(Map<String, Object> params);

    /**
     * 按年份查询恰饭收入总和
     *
     * @param params
     * @return
     */
    Map<String, Object> getOnePieceCountByYear(Map<String, Object> params);

    /**
     * 按月份查询恰饭收入总和
     *
     * @param params
     * @return
     */
    Map<String, Object> getOnePieceCountByMonth(Map<String, Object> params);

    /**
     * 新增姨妈周期数据
     *
     * @param params
     */
    void insertMenstruationCycleData(Map<String, Object> params);

    /**
     * 查询姨妈周期表格所需数据
     *
     * @param params
     * @return
     */
    List<Map<String, Object>> getMenstruationCycleTable(Map<String, Object> params);

    /**
     * 修改是否已发货状态
     *
     * @param params
     */
    void updateOnePieceDeliverState(Map<String, Object> params);

    /**
     * 查询参与抽奖顾客信息
     *
     * @param params
     * @return
     */
    List<Map<String, Object>> getLuckDrawData(Map<String, Object> params);

    /**
     * 新增照片信息
     *
     * @param params
     */
    void insertPhotoInfo(Map<String, Object> params);

    /**
     * @Author: fujianhao
     * @Description: 新增原始照片信息
     * @Date: 2021/2/20
     * @Param: [params]
     * @Return: void
     */
    void insertPhotoOriginal(Map<String, Object> params);

    /**
     * @Author: fujianhao
     * @Description: 查询照片缩略图ID
     * @Date: 2021/2/20
     * @Param: [params]
     * @Return: int
     */
    int queryPhotoThumbnailId(Map<String, Object> params);

    /**
     * @Author: fujianhao
     * @Description: 查询该月份相册是否已经存在
     * @Date: 2021/2/19
     * @Param: [params]
     * @Return: int
     */
    int queryPhotoAlbum(Map<String, Object> params);

    /**
     * 新增相册信息
     *
     * @param params
     */
    void insertPhotoAlbumInfo(Map<String, Object> params);

    /**
     * 查询相册和相关信息
     *
     * @param params
     * @return
     */
    List<Map<String, Object>> getPhotoAlbumInfo(Map<String, Object> params);

    /**
     * 查询照片和相关信息
     *
     * @param params
     * @return
     */
    List<Map<String, Object>> getPhotoInfo(Map<String, Object> params);

    /**
     * 新增顾客信息
     *
     * @param params
     */
    void insertCustomer(Map<String, Object> params);

    /**
     * @Author: fujianhao
     * @Description: 查询顾客信息
     * @Date: 2021/1/17
     * @Param: [params]
     * @Return: java.util.List<java.util.Map < java.lang.String, java.lang.Object>>
     */
    List<Map<String, Object>> getCustomerTable(Map<String, Object> params);

    /**
     * @Author: fujianhao
     * @Description: 删除顾客信息
     * @Date: 2021/1/17
     * @Param: [params]
     * @Return: java.util.List<java.util.Map < java.lang.String, java.lang.Object>>
     */
    void deleteCustomer(Map<String, Object> params);

    /**
     * @Author: fujianhao
     * @Description: 修改顾客信息
     * @Date: 2021/1/17
     * @Param: [params]
     * @Return: java.util.List<java.util.Map < java.lang.String, java.lang.Object>>
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
     * @Return: java.util.List<java.util.Map < java.lang.String, java.lang.Object>>
     */
    List<Map<String, Object>> getProductTable(Map<String, Object> params);
}

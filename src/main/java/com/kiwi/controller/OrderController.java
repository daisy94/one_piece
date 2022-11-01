package com.kiwi.controller;

import com.kiwi.controller.base.BaseController;
import com.kiwi.pojo.dto.OrderDto;
import com.kiwi.pojo.po.OrderPo;
import com.kiwi.service.OnePieceService;
import com.kiwi.service.OrderService;
import com.kiwi.utils.InfoCode;
import com.kiwi.utils.JsonResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/order")
public class OrderController extends BaseController {

    @Resource
    private OnePieceService onePieceService;

    @Resource
    private OrderService orderService;

    /**
     * 新增订单信息
     */
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public JsonResult insert(OrderPo orderPo) {

        try {
            orderService.save(orderPo);
            log.info("\n==================== 新增订单信息成功 ====================");
            return JsonResult.success(InfoCode.SAVE_SUCCESS.msg);
        } catch (Exception e) {
            log.error("\n==================== 新增订单信息失败 ====================", e);
            return JsonResult.fail(InfoCode.SAVE_FAIL);
        }
    }

    /**
     * 删除订单信息
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public JsonResult delete(OrderPo orderPo) {

        try {
            orderService.removeById(orderPo);
            log.info("\n==================== 删除订单信息成功 ====================");
            return JsonResult.success();
        } catch (Exception e) {
            log.error("\n==================== 删除订单信息失败 ====================", e);
            return JsonResult.fail(InfoCode.DELETE_FAIL);
        }
    }

    /**
     * 修改订单信息
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public JsonResult update(OrderPo orderPo) {

        try {
            orderService.updateById(orderPo);
            log.info("\n==================== 修改订单信息成功 ====================");
            return JsonResult.success();
        } catch (Exception e) {
            log.error("\n==================== 修改订单信息失败 ====================", e);
            return JsonResult.fail(InfoCode.UPDATE_FAIL);
        }
    }

    /**
     * 查询订单信息
     */
    @RequestMapping(value = "/select", method = RequestMethod.POST)
    public JsonResult select(OrderDto orderDto) {

        try {
            List<OrderPo> orderPoList = orderService.selectByOrderVo(orderDto);
            log.info("\n==================== 查询订单信息成功 ====================");
            return JsonResult.layUITable(orderPoList, orderPoList.size());
        } catch (Exception e) {
            log.error("\n==================== 查询订单信息失败 ====================", e);
            return JsonResult.fail(InfoCode.SELECT_FAIL);
        }
    }

    /**
     * 查询未发货订单信息
     */
    @RequestMapping(value = "/selectUndelivered", method = RequestMethod.POST)
    public JsonResult selectUndelivered() {

        try {
            List<OrderPo> orderPoList = orderService.selectUndelivered();
            log.info("\n==================== 查询未发货订单信息成功 ====================");
            return JsonResult.layUITable(orderPoList, orderPoList.size());
        } catch (Exception e) {
            log.error("\n==================== 查询未发货订单信息失败 ====================", e);
            return JsonResult.fail(InfoCode.SELECT_FAIL);
        }
    }

    /**
     * 按年份查询订单收入总计
     */
    @RequestMapping(value = "/selectMonthData", method = RequestMethod.POST)
    public JsonResult selectMonthData(OrderDto orderDto) {

        try {
            List<Map<String, Object>> orderMonthData = orderService.selectMonthDataByOrderVo(orderDto);
            log.info("\n==================== 按年份查询订单收入总计成功 ====================");
            return JsonResult.layUITable(orderMonthData, orderMonthData.size());
        } catch (Exception e) {
            log.error("\n==================== 按年份查询订单收入总计失败 ====================", e);
            return JsonResult.fail(InfoCode.SELECT_FAIL);
        }
    }

    /**
     * 按月份查询订单ECharts数据
     */
    @RequestMapping(value = "/getOrderEChartsByMonth", method = RequestMethod.POST)
    public JsonResult getOrderEChartsByMonth(OrderDto orderDto) {

        try {
            Map<String, Object> orderEChartsByMonth = orderService.getOrderEChartsByMonth(orderDto);
            log.info("\n==================== 按月份查询订单ECharts数据成功 ====================");
            return JsonResult.success(orderEChartsByMonth);
        } catch (Exception e) {
            log.error("\n==================== 按月份查询订单ECharts数据失败 ====================", e);
            return JsonResult.fail(InfoCode.SELECT_FAIL);
        }
    }

    /**
     * 按年份查询恰饭ECharts数据
     */
    @RequestMapping(value = "/getOrderEChartsByYear", method = RequestMethod.POST)
    public JsonResult getOrderEChartsByYear(OrderDto orderDto) {

        try {
            Map<String, Object> orderEChartsByYear = orderService.getOrderEChartsByYear(orderDto);
            log.info("\n==================== 按年份查询恰饭ECharts数据成功 ====================");
            return JsonResult.success(orderEChartsByYear);
        } catch (Exception e) {
            log.error("\n==================== 按年份查询恰饭ECharts数据失败 ====================", e);
            return JsonResult.fail(InfoCode.SELECT_FAIL);
        }
    }

    // 按年份查询恰饭收入总和
    @RequestMapping(value = "/getOnePieceCountByYear", method = RequestMethod.POST)
    public JsonResult getOnePieceCountByYear(@RequestBody Map<String, Object> params) {

        Map<String, Object> onePieceCountByYear = onePieceService.getOnePieceCountByYear(params);
        return new JsonResult(onePieceCountByYear);
    }

    // 新增姨妈周期数据
    @RequestMapping(value = "/insertMenstruationCycleData", method = RequestMethod.POST)
    public JsonResult insertMenstruationCycleData(@RequestBody Map<String, Object> params) {

        try {
            onePieceService.insertMenstruationCycleData(params);
            return new JsonResult(InfoCode.SAVE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult(InfoCode.SAVE_FAIL);
        }
    }

    // 查询姨妈周期表格所需数据
    @RequestMapping(value = "/getMenstruationCycleTable", method = RequestMethod.POST)
    public JsonResult getMenstruationCycleTable(@RequestBody Map<String, Object> params) {

        List<Map<String, Object>> menstruationCycleTable = onePieceService.getMenstruationCycleTable(params);
        int count = menstruationCycleTable.size();
        return new JsonResult(menstruationCycleTable, count);
    }

    // 保存照片至服务器，保存照片信息至数据库
    @RequestMapping(value = "/savePhotoAndData", method = RequestMethod.POST)
    public JsonResult savePhotoAndData(MultipartFile file, String photoName, String remark, String photoAlbumName, String photoAlbumId) {

        if (("").equals(photoAlbumName) || ("").equals(photoName) || ("").equals(photoAlbumId)) {
            return new JsonResult(InfoCode.PHOTO_PARAMS_ERROR);
        }

        Map<String, Object> params = new HashMap<>();
        params.put("photoName", photoName);
        params.put("remark", remark);
        params.put("photoAlbumName", photoAlbumName);
        params.put("photoAlbumId", photoAlbumId);
        try {
            onePieceService.savePhotoAndData(file, params);
            return new JsonResult(InfoCode.SAVE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult(InfoCode.SAVE_FAIL);
        }
    }

    // 保存相册封面至服务器，保存相册封面信息至数据库
    @RequestMapping(value = "/savePhotoCover", method = RequestMethod.POST)
    public JsonResult savePhotoCover(MultipartFile file, String dateYearMonth) {

        if (("").equals(dateYearMonth)) {
            return new JsonResult(InfoCode.PHOTO_ALBUM_PARAMS_ERROR);
        }
        Map<String, Object> params = new HashMap<>();
        params.put("dateYearMonth", dateYearMonth);

        try {
            int count = onePieceService.queryPhotoAlbum(params);
            if (count > 0) {
                return new JsonResult(InfoCode.PHOTO_ALBUM_ERROR);
            } else {
                onePieceService.savePhotoCover(file, params);
                return new JsonResult(InfoCode.SAVE_SUCCESS);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult(InfoCode.SAVE_FAIL);
        }
    }

    // 查询相册和相关信息
    @RequestMapping(value = "/getPhotoAlbumInfo", method = RequestMethod.POST)
    public JsonResult getPhotoAlbumInfo(@RequestBody Map<String, Object> params) {

        try {
            List<Map<String, Object>> photoAlbumInfo = onePieceService.getPhotoAlbumInfo(params);
            return new JsonResult(photoAlbumInfo);
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult(InfoCode.OPERATION_FAIL);
        }
    }

    // 查询照片和相关信息
    @RequestMapping(value = "/getPhotoInfo", method = RequestMethod.POST)
    public JsonResult getPhotoInfo(@RequestBody Map<String, Object> params) {

        try {
            List<Map<String, Object>> photoInfo = onePieceService.getPhotoInfo(params);
            return new JsonResult(photoInfo);
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult(InfoCode.OPERATION_FAIL);
        }
    }

}

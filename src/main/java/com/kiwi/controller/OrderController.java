package com.kiwi.controller;

import com.kiwi.controller.base.BaseController;
import com.kiwi.pojo.dto.OrderDto;
import com.kiwi.pojo.po.OrderPo;
import com.kiwi.service.OrderService;
import com.kiwi.utils.InfoCode;
import com.kiwi.utils.JsonResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 订单 控制
 *
 * @author FuJH
 */
@RestController
@RequestMapping("/order")
public class OrderController extends BaseController {

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

}

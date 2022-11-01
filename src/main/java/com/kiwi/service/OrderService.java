package com.kiwi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.kiwi.pojo.dto.OrderDto;
import com.kiwi.pojo.po.OrderPo;

import java.util.List;
import java.util.Map;

/**
 * 订单信息 服务类
 */
public interface OrderService extends IService<OrderPo> {

    /**
     * 查询订单信息
     */
    List<OrderPo> selectByOrderVo(OrderDto orderDto);

    /**
     * 查询未发货订单信息
     */
    List<OrderPo> selectUndelivered();

    /**
     * 查询月收入总计
     */
    List<Map<String, Object>> selectMonthDataByOrderVo(OrderDto orderDto);

    /**
     * 按月份查询订单ECharts数据
     */
    Map<String, Object> getOrderEChartsByMonth(OrderDto orderDto);

    /**
     * 按年份查询订单ECharts数据
     */
    Map<String, Object> getOrderEChartsByYear(OrderDto orderDto);

}

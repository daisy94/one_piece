package com.kiwi.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.kiwi.mapper.OrderMapper;
import com.kiwi.pojo.dto.OrderDto;
import com.kiwi.pojo.po.OrderPo;
import com.kiwi.service.OrderService;
import com.kiwi.utils.KiwiUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 订单信息 服务实现类
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, OrderPo> implements OrderService {

    @Resource
    private OrderMapper orderMapper;

    @Override
    public List<OrderPo> selectByOrderVo(OrderDto orderDto) {
        return orderMapper.selectByOrderVo(orderDto);
    }

    @Override
    public List<Map<String, Object>> selectMonthDataByOrderVo(OrderDto orderDto) {
        return orderMapper.selectMonthDataByOrderVo(orderDto);
    }

    @Override
    public List<OrderPo> selectUndelivered() {
        return orderMapper.selectUndelivered();
    }

    @Override
    public Map<String, Object> getOrderEChartsByMonth(OrderDto orderDto) {
        List<Map<String, Object>> orderEChartsByMonth = orderMapper.getOrderEChartsByMonth(orderDto);
        return KiwiUtils.formatEChartsData(orderEChartsByMonth, "profit", "date");
    }

    @Override
    public Map<String, Object> getOrderEChartsByYear(OrderDto orderDto) {
        List<Map<String, Object>> orderEChartsByMonth = orderMapper.getOrderEChartsByYear(orderDto);
        return KiwiUtils.formatEChartsData(orderEChartsByMonth, "profit", "date");
    }
}

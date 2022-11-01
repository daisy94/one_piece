package com.kiwi.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.kiwi.pojo.dto.OrderDto;
import com.kiwi.pojo.po.OrderPo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 订单信息 Mapper 接口
 */
@Mapper
public interface OrderMapper extends BaseMapper<OrderPo> {

    List<OrderPo> selectByOrderVo(@Param("orderVo") OrderDto orderDto);

    List<OrderPo> selectUndelivered();

    List<Map<String, Object>> selectMonthDataByOrderVo(@Param("orderVo") OrderDto orderDto);

    List<Map<String, Object>> getOrderEChartsByMonth(@Param("orderVo") OrderDto orderDto);

    List<Map<String, Object>> getOrderEChartsByYear(@Param("orderVo") OrderDto orderDto);

}

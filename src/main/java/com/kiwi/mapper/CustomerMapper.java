package com.kiwi.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.kiwi.pojo.dto.CustomerDto;
import com.kiwi.pojo.po.CustomerPo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 顾客信息 Mapper 接口
 */
@Mapper
public interface CustomerMapper extends BaseMapper<CustomerPo> {

    List<CustomerPo> selectByCustomerVo(@Param("customerVo") CustomerDto customerDto);

}

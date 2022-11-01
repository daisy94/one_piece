package com.kiwi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.kiwi.pojo.dto.CustomerDto;
import com.kiwi.pojo.po.CustomerPo;

import java.util.List;

/**
 * 顾客信息 服务类
 */
public interface CustomerService extends IService<CustomerPo> {

    /**
     * 查询顾客信息
     */
    List<CustomerPo> selectByCustomerVo(CustomerDto customerDto);

}

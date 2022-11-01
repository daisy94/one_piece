package com.kiwi.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.kiwi.mapper.CustomerMapper;
import com.kiwi.pojo.dto.CustomerDto;
import com.kiwi.pojo.po.CustomerPo;
import com.kiwi.service.CustomerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 顾客信息 服务实现类
 */
@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, CustomerPo> implements CustomerService {

    @Resource
    private CustomerMapper customerMapper;

    @Override
    public List<CustomerPo> selectByCustomerVo(CustomerDto customerDto) {
        return customerMapper.selectByCustomerVo(customerDto);
    }
}

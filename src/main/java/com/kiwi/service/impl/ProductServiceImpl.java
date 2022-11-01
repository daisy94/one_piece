package com.kiwi.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.kiwi.mapper.ProductMapper;
import com.kiwi.pojo.dto.ProductDto;
import com.kiwi.pojo.po.ProductPo;
import com.kiwi.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 商品信息 服务实现类
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, ProductPo> implements ProductService {

    @Resource
    private ProductMapper productMapper;

    @Override
    public List<ProductPo> selectByProductVo(ProductDto productDto) {
        return productMapper.selectByProductVo(productDto);
    }
}

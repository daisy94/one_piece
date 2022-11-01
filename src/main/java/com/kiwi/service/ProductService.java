package com.kiwi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.kiwi.pojo.dto.ProductDto;
import com.kiwi.pojo.po.ProductPo;

import java.util.List;

/**
 * 商品信息 服务类
 */
public interface ProductService extends IService<ProductPo> {

    /**
     * 查询商品信息
     */
    List<ProductPo> selectByProductVo(ProductDto productDto);

}

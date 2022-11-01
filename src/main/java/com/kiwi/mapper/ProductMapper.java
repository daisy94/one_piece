package com.kiwi.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.kiwi.pojo.dto.ProductDto;
import com.kiwi.pojo.po.ProductPo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 商品信息 Mapper 接口
 */
@Mapper
public interface ProductMapper extends BaseMapper<ProductPo> {

    List<ProductPo> selectByProductVo(@Param("productVo") ProductDto productDto);

}

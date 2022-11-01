package com.kiwi.controller;

import com.kiwi.controller.base.BaseController;
import com.kiwi.pojo.dto.ProductDto;
import com.kiwi.pojo.po.ProductPo;
import com.kiwi.service.ProductService;
import com.kiwi.utils.InfoCode;
import com.kiwi.utils.JsonResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/product")
public class ProductController extends BaseController {

    @Resource
    private ProductService productService;

    /**
     * 查询商品信息
     */
    @RequestMapping(value = "/select", method = RequestMethod.POST)
    public JsonResult select(ProductDto productDto) {

        try {
            List<ProductPo> productPoList = productService.selectByProductVo(productDto);
            log.info("\n==================== 查询商品信息成功 ====================");
            return JsonResult.layUITable(productPoList, productPoList.size());
        } catch (Exception e) {
            log.error("\n==================== 查询商品信息失败 ====================", e);
            return JsonResult.fail(InfoCode.SELECT_FAIL);
        }
    }

    /**
     * 新增商品信息
     */
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public JsonResult insert(ProductPo productPo) {

        try {
            productService.save(productPo);
            log.info("\n==================== 新增商品信息成功 ====================");
            return JsonResult.success(InfoCode.SAVE_SUCCESS.msg);
        } catch (Exception e) {
            log.error("\n==================== 新增商品信息失败 ====================", e);
            return JsonResult.fail(InfoCode.SAVE_FAIL);
        }
    }

    /**
     * 删除商品信息
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public JsonResult delete(ProductPo productPo) {

        try {
            productService.removeById(productPo);
            log.info("\n==================== 删除商品信息成功 ====================");
            return JsonResult.success(InfoCode.DELETE_SUCCESS.msg);
        } catch (Exception e) {
            log.error("\n==================== 删除商品信息失败 ====================", e);
            return JsonResult.fail(InfoCode.DELETE_FAIL);
        }
    }

    /**
     * 修改商品信息
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public JsonResult update(ProductPo productPo) {

        try {
            productService.updateById(productPo);
            log.info("\n==================== 修改商品信息成功 ====================");
            return JsonResult.success(InfoCode.UPDATE_SUCCESS.msg);
        } catch (Exception e) {
            log.error("\n==================== 修改商品信息失败 ====================", e);
            return JsonResult.fail(InfoCode.UPDATE_FAIL);
        }
    }

}

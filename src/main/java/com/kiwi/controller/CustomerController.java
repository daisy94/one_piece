package com.kiwi.controller;

import com.kiwi.controller.base.BaseController;
import com.kiwi.pojo.dto.CustomerDto;
import com.kiwi.pojo.po.CustomerPo;
import com.kiwi.service.CustomerService;
import com.kiwi.utils.InfoCode;
import com.kiwi.utils.JsonResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * 顾客 控制器
 *
 * @author FuJH
 */
@RestController
@RequestMapping("/customer")
public class CustomerController extends BaseController {

    @Resource
    private CustomerService customerService;

    /**
     * 查询顾客信息
     */
    @RequestMapping(value = "/select", method = RequestMethod.POST)
    public JsonResult select(CustomerDto customerDto) {

        try {
            List<CustomerPo> customerPoList = customerService.selectByCustomerVo(customerDto);
            log.info("\n==================== 查询顾客信息成功 ====================");
            return JsonResult.layUITable(customerPoList, customerPoList.size());
        } catch (Exception e) {
            log.error("\n==================== 查询顾客信息失败 ====================", e);
            return JsonResult.fail(InfoCode.SELECT_FAIL);
        }
    }

    /**
     * 新增顾客信息
     */
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public JsonResult insert(CustomerPo customerPo) {

        try {
            customerService.save(customerPo);
            log.info("\n==================== 新增顾客信息成功 ====================");
            return JsonResult.success(InfoCode.SAVE_SUCCESS.msg);
        } catch (Exception e) {
            log.error("\n==================== 新增顾客信息失败 ====================", e);
            return JsonResult.fail(InfoCode.SAVE_FAIL);
        }
    }

    /**
     * 删除顾客信息
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public JsonResult delete(CustomerPo customerPo) {

        try {
            customerService.removeById(customerPo);
            log.info("\n==================== 删除顾客信息成功 ====================");
            return JsonResult.success(InfoCode.DELETE_SUCCESS.msg);
        } catch (Exception e) {
            log.error("\n==================== 删除顾客信息失败 ====================", e);
            return JsonResult.fail(InfoCode.DELETE_FAIL);
        }
    }

    /**
     * 修改顾客信息
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public JsonResult update(CustomerPo customerPo) {

        try {
            customerService.updateById(customerPo);
            log.info("\n==================== 修改顾客信息成功 ====================");
            return JsonResult.success(InfoCode.UPDATE_SUCCESS.msg);
        } catch (Exception e) {
            log.error("\n==================== 修改顾客信息失败 ====================", e);
            return JsonResult.fail(InfoCode.UPDATE_FAIL);
        }
    }
}

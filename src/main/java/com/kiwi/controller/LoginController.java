package com.kiwi.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.kiwi.controller.base.BaseController;
import com.kiwi.pojo.po.UserPo;
import com.kiwi.service.UserService;
import com.kiwi.utils.InfoCode;
import com.kiwi.utils.JsonResult;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@RestController
public class LoginController extends BaseController {

    @Resource
    UserService userService;

    /**
     * 首页跳转
     */
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView home(Model model) throws Exception {

        try {
            model.addAttribute("user", StpUtil.getSession().get("user"));
            return new ModelAndView("home");
        } catch (Exception e) {
            throw new Exception("获取用户信息失败", e);
        }
    }

    /**
     * 订单页跳转
     */
    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public ModelAndView order() {
        return new ModelAndView("order/order");
    }

    /**
     * 登录
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public JsonResult login(UserPo userPo) {

        try {
            if (userService.userLogin(userPo)) {
                log.info("\n==================== 登录成功 ====================");
                return JsonResult.success();
            } else {
                return JsonResult.fail(InfoCode.LOGIN_FAIL);
            }
        } catch (Exception e) {
            log.error("\n==================== 登录失败 ====================", e);
            return JsonResult.fail(InfoCode.LOGIN_ERROR);
        }
    }

    /**
     * 退出
     */
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public JsonResult logout() {

        try {
            StpUtil.logout();
            log.info("\n==================== 退出成功 ====================");
            return JsonResult.success();
        } catch (Exception e) {
            log.error("\n==================== 退出失败 ====================", e);
            return JsonResult.fail(InfoCode.LOGIN_ERROR);
        }
    }

}
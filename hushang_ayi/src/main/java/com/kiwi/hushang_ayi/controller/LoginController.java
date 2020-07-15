package com.kiwi.hushang_ayi.controller;

import com.alibaba.fastjson.JSONObject;
import com.kiwi.hushang_ayi.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import utils.InfoCode;
import utils.JsonResult;
import utils.MD5Util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@RestController
public class LoginController {

    @Autowired
    LoginService loginService;

    //登录
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public JsonResult login(@RequestBody JSONObject params, HttpSession session, HttpServletResponse response) throws Exception{

        String password = MD5Util.getMD5String(String.valueOf(params.get("password")));
        params.put("password", password);
        Map<String, Object> user = loginService.getUser(params);
        if(user != null){
            String userName = String.valueOf(user.get("user_name"));
            String userPower = String.valueOf(user.get("user_power"));
            Cookie userInfoName = new Cookie("userName", userName);
            Cookie userInfoPower = new Cookie("userPower", userPower);
            response.addCookie(userInfoName);
            response.addCookie(userInfoPower);
            session.setAttribute("user", userName);
            return new JsonResult();
        }
        return new JsonResult(InfoCode.LOGIN_FAIL.code, InfoCode.LOGIN_FAIL.msg);
    }
}
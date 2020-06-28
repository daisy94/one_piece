package com.kiwi.hushang_ayi.controller;

import com.alibaba.fastjson.JSONObject;
import com.kiwi.hushang_ayi.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import utils.JsonResult;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//登录Controller
@RestController
public class LoginController {

    @Autowired
    LoginService loginService;

    //登录
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public JsonResult login(@RequestBody JSONObject resultMap, HttpSession session) throws Exception{

        int user = loginService.getUser(resultMap);
        JsonResult jsonResult = new JsonResult();
        if(user != 0){
            session.setAttribute("user", "OK");
            return jsonResult;
        }
        jsonResult = new JsonResult("500","用户名或密码错误啦！");
        return jsonResult;
    }
}

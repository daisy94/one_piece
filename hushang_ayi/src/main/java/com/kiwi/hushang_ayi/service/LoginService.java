package com.kiwi.hushang_ayi.service;

import com.alibaba.fastjson.JSONObject;
import com.kiwi.hushang_ayi.mapper.LoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    LoginMapper loginMapper;

    public Integer getUser(JSONObject resultMap){

        int user = loginMapper.getUser(resultMap);
        return user;
    }
}

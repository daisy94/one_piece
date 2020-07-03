package com.kiwi.hushang_ayi.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.kiwi.hushang_ayi.mapper.LoginMapper;
import com.kiwi.hushang_ayi.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    LoginMapper loginMapper;

    @Override
    public Integer getUser(JSONObject resultMap){

        int user = loginMapper.getUser(resultMap);
        return user;
    }
}

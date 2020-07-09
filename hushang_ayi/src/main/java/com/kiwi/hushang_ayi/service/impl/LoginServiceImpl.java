package com.kiwi.hushang_ayi.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.kiwi.hushang_ayi.mapper.LoginMapper;
import com.kiwi.hushang_ayi.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    LoginMapper loginMapper;

    @Override
    public Map<String, Object> getUser(JSONObject resultMap){

        Map<String, Object> user = loginMapper.getUser(resultMap);
        return user;
    }
}

package com.kiwi.hushang_ayi.service;

import com.alibaba.fastjson.JSONObject;

import java.util.Map;

public interface LoginService {

    Map<String, Object> getUser(JSONObject resultMap);
}

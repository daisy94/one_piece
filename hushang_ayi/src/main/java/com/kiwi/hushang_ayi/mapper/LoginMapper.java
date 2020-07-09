package com.kiwi.hushang_ayi.mapper;

import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface LoginMapper {

    Map<String, Object> getUser(JSONObject resultMap);
}

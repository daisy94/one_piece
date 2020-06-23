package com.kiwi.hushang_ayi.mapper;

import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {

    int getUser(JSONObject resultMap);
}

package com.kiwi.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.kiwi.pojo.po.UserPo;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户信息 Mapper 接口
 */
@Mapper
public interface UserMapper extends BaseMapper<UserPo> {

}

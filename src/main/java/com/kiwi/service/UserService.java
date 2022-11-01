package com.kiwi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.kiwi.pojo.po.UserPo;

/**
 * 用户信息 服务类
 */
public interface UserService extends IService<UserPo> {

    Boolean userLogin(UserPo userPo);

}

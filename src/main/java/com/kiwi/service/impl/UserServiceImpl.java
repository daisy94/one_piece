package com.kiwi.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.kiwi.mapper.UserMapper;
import com.kiwi.pojo.po.UserPo;
import com.kiwi.service.UserService;
import com.kiwi.utils.MD5Util;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 用户信息 服务实现类
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, UserPo> implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public Boolean userLogin(UserPo userPo) {

        String password = MD5Util.getMD5String(userPo.getPassword());
        UserPo user = userMapper.selectOne(new QueryWrapper<UserPo>()
                .eq("account", userPo.getAccount())
                .eq("password", password));

        if (user != null) {
            StpUtil.login(user.getId());
            // 缓存user对象
            StpUtil.getSession().set("user", user);
            return true;
        } else {
            return false;
        }
    }

}

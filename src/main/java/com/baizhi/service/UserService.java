package com.baizhi.service;

import com.baizhi.entity.User;

public interface UserService {
    //根据账号查询
    User login(User user);
    //注册用户
    void register(User user);
}

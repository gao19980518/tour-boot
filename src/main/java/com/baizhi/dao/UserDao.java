package com.baizhi.dao;

import com.baizhi.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    //根据账号查询
    User queryByUsername(@Param("username") String username);
    //注册用户
    void add(User user);
}

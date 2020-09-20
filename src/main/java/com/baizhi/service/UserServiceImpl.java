package com.baizhi.service;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * @ClassName UserServiceImpl
 * @Author wyy
 * @Date 2020/7/29 16:57
 * @Description TOOO
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public User login(User user) {
        User user1 =null;
        try{
            user1 = userDao.queryByUsername(user.getUsername());
            if(user1==null){
                throw new RuntimeException("该账号不存在");
            }
            if(!user1.getPassword().equals(user.getPassword())){
                throw new RuntimeException("密码错误");
            }
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return user1;
    }
    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void register(User user) {
        try {
            User user1 = userDao.queryByUsername(user.getUsername());
            if (user1!= null) {
                throw new RuntimeException("该账户已存在");
            }
            userDao.add(user);
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
    }
}

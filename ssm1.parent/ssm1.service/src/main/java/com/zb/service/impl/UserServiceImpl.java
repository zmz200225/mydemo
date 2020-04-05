package com.zb.service.impl;

import com.zb.entity.User;
import com.zb.mapper.UserMapper;
import com.zb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;


    @Override
    public User findUserLogin(String username, String userPassword) {
        return userMapper.findUserLogin(username, userPassword);
    }

    @Override
    public int insertUser(User user) {
        return userMapper.insertUser(user);
    }
}

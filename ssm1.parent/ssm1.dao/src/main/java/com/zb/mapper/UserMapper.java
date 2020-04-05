package com.zb.mapper;

import com.zb.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    public User findUserLogin(@Param("user") String username, @Param("pwd") String userPassword);

    public int insertUser(User user);
}

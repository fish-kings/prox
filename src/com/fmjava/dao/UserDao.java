package com.fmjava.dao;

import com.fmjava.domain.User;
/*Dao操作数据库*/
public interface UserDao {
    User selectUser(User user);
    void updateUser(User user,String password);
}

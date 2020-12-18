package com.fmjava.ServiceImpl;

import com.fmjava.DaoImpl.UserDaoImpl;
import com.fmjava.dao.UserDao;
import com.fmjava.domain.User;
import com.fmjava.service.UserService;

public class UserServiceImpl implements UserService {
    @Override
    public User getUser(User user) {
        UserDao userDao = new UserDaoImpl();
        return userDao.selectUser(user);
    }
    @Override
    public void updateUser(User user, String password) {
        UserDao userDao = new UserDaoImpl();
        userDao.updateUser(user, password);
    }
}

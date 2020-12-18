package com.fmjava.service;

import com.fmjava.domain.User;

public interface UserService {
    User getUser(User user);
    void updateUser(User user,String password);
}

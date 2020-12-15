package com.fmjava.dao;

import com.fmjava.domain.User;

import java.util.List;

public interface EmployeeDao {
    public List<User> getAllEmployeeUsers();
    public void  deleteEmployeeUsers(String id);
    public User getOneEmployeeUser(String id);
    public  void updateEmployeeUser(User user);
    public  void addEmployeeUser(User user);
}

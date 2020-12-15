package com.fmjava.ServiceImpl;

import com.fmjava.DaoImpl.EmployeeDaoImpl;
import com.fmjava.dao.EmployeeDao;
import com.fmjava.domain.User;
import com.fmjava.service.EmployeeService;

import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {
    @Override
    public List<User> getAllEmployeeUsers() {
        EmployeeDao employeeDao=new EmployeeDaoImpl();
        return employeeDao.getAllEmployeeUsers();
    }

    @Override
    public void deleteEmployeeUsers(String id) {
        EmployeeDao employeeDao=new EmployeeDaoImpl();
        employeeDao.deleteEmployeeUsers(id);

    }

    @Override
    public User getOneEmployeeUser(String id) {
        EmployeeDao employeeDao=new EmployeeDaoImpl();
        return employeeDao.getOneEmployeeUser(id);
    }

    @Override
    public void updateEmployeeUser(User user) {
        EmployeeDao employeeDao=new EmployeeDaoImpl();
            employeeDao.updateEmployeeUser(user);

    }

    @Override
    public void addEmployeeUser(User user) {
        EmployeeDao employeeDao=new EmployeeDaoImpl();
        employeeDao.addEmployeeUser(user);
    }
}

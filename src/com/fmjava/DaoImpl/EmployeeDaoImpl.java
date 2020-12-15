package com.fmjava.DaoImpl;

import com.fmjava.dao.EmployeeDao;
import com.fmjava.domain.User;
import com.fmjava.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class EmployeeDaoImpl implements EmployeeDao {
    QueryRunner queryRunner= JDBCUtils.getQueryRunner();
    @Override
    public List<User> getAllEmployeeUsers() {
        String sql="select * from core_user ";
        List<User> ListUsers = null;
        try {
            ListUsers=queryRunner.query(sql,new BeanListHandler<>(User.class));
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return ListUsers;
    }

    @Override
    public void deleteEmployeeUsers(String id) {
        String sql="delete from core_user where id=?";
        try {
            queryRunner.update(sql,id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public User getOneEmployeeUser(String id) {
        String sql="select * from core_user where id=?";
        User user = null;
        try {
            user=queryRunner.query(sql, new BeanHandler<>(User.class),id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    @Override
    public void updateEmployeeUser(User user) {
        String sql  = "update core_user set username=?,age=?,realname=?,sex=?,email=?,brief=?,profile=?,avatar=?,deployment=? where id=?";
        try {
            queryRunner.update(sql,user.getUsername(),
                    user.getAge(),user.getRealname(),
                    user.getSex(),user.getEmail(),
                    user.getBrief(),
                    user.getProfile(),
                    user.getAvatar(),
                    user.getDeployment(),
                    user.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void addEmployeeUser(User user) {
        String sql = "insert into core_user(username,age,realname,sex,email,brief,profile,avatar,deployment,time_reg) value(?,?,?,?,?,?,?,?,?,?)";
        try {
            queryRunner.update(sql,user.getUsername(),
                    user.getAge(),user.getRealname(),
                    user.getSex(),
                    user.getEmail(),
                    user.getBrief(),
                    user.getProfile(),
                    user.getAvatar(),
                    user.getDeployment(),
                    user.getTime_reg());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

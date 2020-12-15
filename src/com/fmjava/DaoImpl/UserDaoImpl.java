package com.fmjava.DaoImpl;

import com.fmjava.dao.UserDao;
import com.fmjava.domain.User;
import com.fmjava.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

public class UserDaoImpl implements UserDao {
    @Override
    public User selectUser(User user) {
        QueryRunner queryRunner= JDBCUtils.getQueryRunner();
        String sql="select * from core_user where username=? and password=?";
        User user1=null;
        try {
          user1=queryRunner.query(sql,new BeanHandler<>(User.class),user.getUsername(),user.getPassword());
        }catch (Exception e) {
            e.printStackTrace();
        }
        return user1;
    }
}

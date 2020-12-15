package com.fmjava.DaoImpl;

import com.fmjava.dao.FocusDao;
import com.fmjava.domain.Focus;
import com.fmjava.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class FocusDaoImpl implements FocusDao {
    private QueryRunner queryRunner= JDBCUtils.getQueryRunner();

    @Override
    public List<Focus> getAllFocus() {
        List<Focus> allFocus=null;
        String sql="select * from focus";
        try {
            allFocus=queryRunner.query(sql,new BeanListHandler<>(Focus.class));

        }catch (Exception e) {
            e.printStackTrace();
        }
        return allFocus;
    }

    @Override
    public void deletelelelocus(String id) {
        String sql="delete from focus where id=?";
        try {
            queryRunner.update(sql,id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void addFocus(Focus focus) {
        String sql="insert into focus(linkurl,img) value(?,?)";
        try {
            queryRunner.update(sql, focus.getLinkurl(),focus.getImg());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public Focus getOneFocus(String id) {
        Focus focus = null;
        String sql="select * from focus where id=?";

        try {
            focus= queryRunner.query(sql,new BeanHandler<>(Focus.class),id);//一个对象用BeanHandler<>(Focus.class) 多个加上List
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }

        return focus;
    }

    @Override
    public void updataFoucs(Focus focus) {
        String sql  = "update focus set linkurl=?,img=? where id = ?";
        try {
            queryRunner.update(sql,focus.getLinkurl(),focus.getImg(),focus.getId());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}

package com.fmjava.DaoImpl;

import com.fmjava.dao.NewsDao;
import com.fmjava.domain.News;
import com.fmjava.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class NewsDaoImpl implements NewsDao {
    QueryRunner queryRunner = JDBCUtils.getQueryRunner();
    @Override
    public List<News> getNewsWithCategory(String categoryId) {
        String sql = "select * from  core_page where cate = ?";
        List<News> allNews = null;
        try {
            allNews = queryRunner.query(sql, new BeanListHandler<>(News.class),categoryId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allNews;
    }

    @Override
    public void deleteNews(String id) {
        String sql = "delete from core_page where id = ?";
        try {
            queryRunner.update(sql,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void addNews(News news) {
        String sql = "insert into core_page(title,cover,body,create_time,cate,news_img) value(?,?,?,?,?,?)";
        try {
            queryRunner.update(sql,news.getTitle(),news.getCover(),news.getBody(),news.getCreate_time(),news.getCate(),news.getNews_img());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateNews(News news) {
        String sql  = "update core_page set title=?,cover=?,body=?,news_img=?,create_time=? where id = ?";
        try {
            queryRunner.update(sql, news.getTitle(),news.getCover(),news.getBody(),news.getNews_img(),news.getCreate_time(),news.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public News getOneNews(String id) {
        String sql = "select * from core_page where id = ?";
        News news = null;
        try {
            news = queryRunner.query(sql, new BeanHandler<>(News.class),id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return news;
    }

    @Override
    public Long getNewsCount(String categoryId) {
        String sql="select count(*) from core_page where cate=?";//count（*）查询总的记录数
        Long query= null;
        try {
            query = (Long)queryRunner.query(sql,new ScalarHandler(), categoryId);//返回一个数据
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return query;
    }

    @Override
    public List getPageData(Integer index, Integer valueOf, String categoryId) {
        String sql="select* from core_page where cate=? limit ?,?";
        List query=null;
        try {
       query = queryRunner.query(sql, new BeanListHandler<>(News.class), categoryId, index, valueOf);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return query;
    }
}

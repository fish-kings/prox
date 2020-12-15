package com.fmjava.dao;

import com.fmjava.domain.News;

import java.util.List;

public interface NewsDao {
    /**根据分类id获取列表信息*/
    List<News> getNewsWithCategory(String categoryId);
    void deleteNews(String id);
    void addNews(News news);
    void updateNews(News news);
    News getOneNews(String id);

    Long getNewsCount(String categoryId);

    List getPageData(Integer index, Integer valueOf, String categoryId);
}



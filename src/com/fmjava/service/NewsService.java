package com.fmjava.service;

import com.fmjava.domain.News;
import com.fmjava.domain.PageBean;

import java.util.List;

public interface NewsService {
    List<News> getNewsWithCategory(String categoryId);
    void deleteNews(String id);
    void addNews(News news);
    void updateNews(News news);
    News getOneNews(String id);
    PageBean getPageBean(String currenPage,String pageSize, String categoryId);
}


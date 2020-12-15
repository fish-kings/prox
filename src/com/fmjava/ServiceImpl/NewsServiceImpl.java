package com.fmjava.ServiceImpl;

import com.fmjava.DaoImpl.NewsDaoImpl;
import com.fmjava.dao.NewsDao;
import com.fmjava.domain.News;
import com.fmjava.domain.PageBean;
import com.fmjava.service.NewsService;

import java.util.List;

public class NewsServiceImpl implements NewsService {
    NewsDao newsDao=new NewsDaoImpl();
    @Override
    public List<News> getNewsWithCategory(String categoryId) {
        return newsDao.getNewsWithCategory(categoryId);
    }

    @Override
    public void deleteNews(String id) {
      newsDao.deleteNews(id);
    }

    @Override
    public void addNews(News news) {
   newsDao.addNews(news);
    }

    @Override
    public void updateNews(News news) {
            newsDao.updateNews(news);
    }

    @Override
    public News getOneNews(String id) {
        return newsDao.getOneNews(id);
    }

    @Override
    public PageBean getPageBean(String currenPage, String pageSize, String categoryId) {

        PageBean pageBean=new PageBean();
        pageBean.setCurrentPage(Integer.valueOf(currenPage));//类型转换 当前页

        //数据库中查询总记录数
        Long sumcount=newsDao.getNewsCount(categoryId);
        pageBean.setTotalCount(sumcount);
        //依据总的记录数设置总的页数
        double ceil = Math.ceil(1.0*pageBean.getTotalCount() /Integer.valueOf( pageSize));//对结果向上取整
        pageBean.setTotalPage((int)ceil);

        //设置当前页的数据
        Integer index=(pageBean.getCurrentPage()-1)*Integer.valueOf( pageSize);//设置每次查询角标
        List pageData=newsDao.getPageData(index,Integer.valueOf(pageSize),categoryId);
        pageBean.setDataList(pageData);
        return pageBean;
    }
}

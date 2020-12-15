package com.fmjava.controller;

import com.fmjava.ServiceImpl.NewsServiceImpl;
import com.fmjava.domain.News;
import com.fmjava.service.NewsService;
import com.fmjava.utils.HTMLUtils;
import com.fmjava.utils.NEWSArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/DeleteNewsServlet")
public class DeleteNewsServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String id=request.getParameter("id");
            String cover=request.getParameter("cover");
          String categoryId=request.getParameter("cate");
        NewsService newsService=new NewsServiceImpl();
        News news=newsService.getOneNews(id);
        newsService.deleteNews(id);
        String path=this.getServletContext().getRealPath(cover);
      if (path != null) {
          File file = new File(path);
          if (file.exists()) {
              file.delete();
          }
      }
      String news_img=news.getNews_img();
    if (news_img != null&&!news_img.equals("[]")) {
          ArrayList<String> Newslist= NEWSArray.toListArray(news_img);//工具类
          Object object=(Object)Newslist;
          /*设置null是会产生空指针异常*/
          HTMLUtils.deleteTempFile(HTMLUtils.getSrc(""),object,this.getServletContext());

      }
        request.setAttribute("categoryId",request.getParameter("cate"));
       request.getRequestDispatcher("/newListServlet?categoryId="+categoryId).forward(request, response);
    }
}

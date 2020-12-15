package com.fmjava.controller;

import com.fmjava.ServiceImpl.NewsServiceImpl;
import com.fmjava.domain.News;
import com.fmjava.service.NewsService;
import com.fmjava.utils.NEWSArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/EditNewsServlet")
public class EditNewsServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId=request.getParameter("cate");
        String id=request.getParameter("id");
        NewsService newsService=new NewsServiceImpl();

        News news=newsService.getOneNews(id);
        request.setAttribute("categoryId",categoryId);
        request.setAttribute("id",3);
        request.setAttribute("news",news);
        String news_img=news.getNews_img();
       List newfileNames=NEWSArray.toListArray(news_img);
        request.getSession().setAttribute("newfileNames",newfileNames);
        request.getRequestDispatcher("/WEB-INF/admin_add.jsp").forward(request, response);

    }
}

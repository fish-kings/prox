package com.fmjava.controller;

import com.fmjava.ServiceImpl.NewsServiceImpl;
import com.fmjava.domain.News;
import com.fmjava.domain.PageBean;
import com.fmjava.service.NewsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/newListServlet")
public class newListServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        request.setAttribute("categoryId",request.getParameter("categoryId"));
        request.setAttribute("id",3);//防指js出错
        String cacheKey=request.getParameter("categoryId");
        //取数据
        NewsService newService=new NewsServiceImpl();

        //处理分页操作
        String currentPage=request.getParameter("currentPage");//获取当前页数
        String pageSize = request.getParameter("pageSize");
        if (currentPage == null||"".equals(currentPage)) {
            currentPage="1";//默认显示第一页
        }
        if (pageSize == null ||"".equals(pageSize) ){
            pageSize="3";//默认显示前3行数据
        }

       // List<News> newsList=newService.getNewsWithCategory(cacheKey);
        PageBean pageBean = newService.getPageBean(currentPage, pageSize, request.getParameter("categoryId"));
        request.setAttribute("pageBean",pageBean);

        request.getRequestDispatcher("/WEB-INF/admin_list.jsp").forward(request, response);

    }
}

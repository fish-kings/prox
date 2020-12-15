package com.fmjava.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/*添加资源*/
@WebServlet("/locationServlet")
public class locationServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.setAttribute("id",request.getParameter("id"));
       request.setAttribute("categoryId",request.getParameter("categoryId"));//记录从什么位置来 到什么位置去

        String location = request.getParameter("location");//资源跳转路径
     if (location != null) {
         request.getRequestDispatcher("/WEB-INF/"+location).forward(request,response);
     }
    }
}

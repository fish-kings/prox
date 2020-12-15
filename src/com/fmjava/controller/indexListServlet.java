package com.fmjava.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/indexListServlet")
public class indexListServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("id",request.getParameter("id"));
        request.getRequestDispatcher("/WEB-INF/admin_main.jsp").forward(request, response);
    }
}

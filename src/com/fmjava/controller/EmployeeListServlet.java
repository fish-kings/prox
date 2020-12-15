package com.fmjava.controller;

import com.fmjava.ServiceImpl.EmployeeServiceImpl;
import com.fmjava.service.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EmployeeListServlet")
public class EmployeeListServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id=request.getParameter("id");
    if(id!=null){
        request.setAttribute("id",id);//代码高亮处理
        //数据库中取数据
        EmployeeService employeeService=new EmployeeServiceImpl();
        request.setAttribute("employees",employeeService.getAllEmployeeUsers());

        request.getRequestDispatcher("/WEB-INF/admin_employee_list.jsp").forward(request, response);
            }

    }
}

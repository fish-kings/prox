package com.fmjava.controller;

import com.fmjava.ServiceImpl.EmployeeServiceImpl;
import com.fmjava.service.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@WebServlet("/DeleteEmployeServlet")
public class DeleteEmployeServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        String img=request.getParameter("avatar");
        System.out.println(img);
        EmployeeService employeeService=new EmployeeServiceImpl();
        employeeService.deleteEmployeeUsers(id);
        String realpath=this.getServletContext().getRealPath(img);//同时删除本地文件
        File file = new File(realpath);
        if(file.exists()){
            file.delete();
        }
        request.getRequestDispatcher("/EmployeeListServlet").forward(request, response);
    }
}

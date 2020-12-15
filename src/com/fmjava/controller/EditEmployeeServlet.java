package com.fmjava.controller;

import com.fmjava.ServiceImpl.EmployeeServiceImpl;
import com.fmjava.domain.User;
import com.fmjava.service.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditEmployeeServlet")
public class EditEmployeeServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String id = request.getParameter("id");
        EmployeeService employeeService=new EmployeeServiceImpl();
        User employee=new User();
        employee=employeeService.getOneEmployeeUser(id);
        System.out.println(employee.getDeployment());
        request.setAttribute("id",4);
        request.setAttribute("employee",employee);
        request.getRequestDispatcher("/WEB-INF/admin_employee_add.jsp").forward(request, response);

    }
}

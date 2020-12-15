package com.fmjava.controller;

import com.fmjava.ServiceImpl.FocusserviceImpl;
import com.fmjava.domain.Focus;
import com.fmjava.service.Focusservice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/FocusListServlet")
public class FocusListServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");//高亮显示列表处理
        request.setAttribute("id",id);

        Focusservice focusservice=new FocusserviceImpl();
        List<Focus> focus=focusservice.getAllFocus();
        request.setAttribute("focus",focus);


        request.getRequestDispatcher("/WEB-INF/admin_focusList.jsp").forward(request,response);
    }
}

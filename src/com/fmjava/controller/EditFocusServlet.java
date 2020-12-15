package com.fmjava.controller;

import com.fmjava.ServiceImpl.FocusserviceImpl;
import com.fmjava.domain.Focus;
import com.fmjava.service.Focusservice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditServlet")
public class EditFocusServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        request.setAttribute("id",2);//高亮显示
        Focus focus=new Focus();
        Focusservice focusservice=new FocusserviceImpl();
        focus=focusservice.getOneFocus(id);

        request.setAttribute("focus",focus);
        request.getRequestDispatcher("/WEB-INF/admin_focusAdd.jsp").forward(request, response);//跳转到回显页面 进行信息修改

    }
}

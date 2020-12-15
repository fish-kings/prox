package com.fmjava.controller;

import com.fmjava.ServiceImpl.FocusserviceImpl;
import com.fmjava.service.Focusservice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@WebServlet("/DeletelServlet")
public class DeletelFocusServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id =request.getParameter("id");
        String imgs=request.getParameter("img");
        Focusservice focusservice=new FocusserviceImpl();
        focusservice.deletelFocus(id);
        String realpath=this.getServletContext().getRealPath(imgs );//同时删除本地文件
        File file = new File(realpath);
        if(file.exists()){
            file.delete();
        }
        request.getRequestDispatcher("/FocusListServlet").forward(request, response);//刷新新的界面

    }
}

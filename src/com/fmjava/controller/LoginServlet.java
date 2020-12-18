package com.fmjava.controller;

import com.fmjava.ServiceImpl.UserServiceImpl;
import com.fmjava.domain.User;
import com.fmjava.service.UserService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*接受用户名和密码,并把参数封装成User对象*/
        Map<String, String[]> uMap=request.getParameterMap();
        User user=new User();
        try {
            BeanUtils.populate(user,uMap);

        }catch (Exception e) {
            e.printStackTrace();
        }
        UserService userService=new UserServiceImpl();
        User u=userService.getUser(user);
        if (u != null) {
            HttpSession session = request.getSession();//将用户信息存储在session中
            session.setAttribute("user",u);
           request.setAttribute("id",1);//通过1判断此处是首页
            request.getRequestDispatcher("/WEB-INF/admin_main.jsp").forward(request,response);//跳转到欢迎页
        }
        else {
                request.setAttribute("loginInfo","用户名或密码错误");
                request.getRequestDispatcher("/admin_login.jsp").forward(request,response);//重新跳转到登录页
        }
    }
}

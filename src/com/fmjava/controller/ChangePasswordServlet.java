package com.fmjava.controller;

import com.fmjava.ServiceImpl.UserServiceImpl;
import com.fmjava.domain.User;
import com.fmjava.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         //以前的密码
        String passwordbefore=request.getParameter("passwordbefore");

         //第一次输入密码
         String password1 = request.getParameter("password1");
         //第二次输入密码
         String password2 = request.getParameter("password2");
        //获取session中当前登录用户的对象
         HttpSession session = request.getSession();
         User user =(User)session.getAttribute("user");

         if(password1.equals(password2)&&passwordbefore.equals(user.getPassword()))
         {

             UserService userService=new UserServiceImpl();
             userService.updateUser(user,password1);

             //提示消息修改成功(需要刷新当前页面)
             request.setAttribute("changRight","密码修改成功！即将重新登录");

             //跳转刷新当前页面
             session.setAttribute("changinformation","true");
             request.getRequestDispatcher("/WEB-INF/admin_chang_password.jsp").forward(request,response);



         }
         else {//提示两次密码输入不一致或者原来密码错误 提示重新输入
             request.setAttribute("changError","输入信息有错误，请重新输入！");
             request.getRequestDispatcher("/WEB-INF/admin_chang_password.jsp").forward(request,response);
         }


        //修改成功页面刷新完成 退出重新登录
        if("true".equals(session.getAttribute("changinformation")))
        {
            try {//当前线程停止2s 显示提示重新登录信息
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            session.invalidate();
            response.sendRedirect(request.getContextPath()+"/admin_login.jsp");
        }
    }

}

package com.fmjava.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(value = "/WEB-INF/*",dispatcherTypes =DispatcherType.FORWARD)//没有登录所有进入web-inf的请求都要被拦截
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //未登录不允许访问
        HttpServletRequest request=(HttpServletRequest) req;//类型转换
        HttpSession session=request.getSession();
        Object user=session.getAttribute("user");
        if(user != null){
            chain.doFilter(req, resp);
        }
        else {
            HttpServletResponse response = (HttpServletResponse) resp;
            response.sendRedirect(request.getContextPath()+"/admin_login.jsp");//重定向
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}

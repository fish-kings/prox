package com.fmjava.controller;

import com.fmjava.ServiceImpl.FocusserviceImpl;
import com.fmjava.domain.Focus;
import com.fmjava.service.Focusservice;
import com.fmjava.utils.UploadUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.Map;

@WebServlet("/addFocusServlet")
@MultipartConfig//说明该Servlet处理的是multipart/form-data类型的请求
public class addFocusServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String,String[]> paramextermap=request.getParameterMap();//已经获取前端传来的全部上传信息 hidden或者from表单中的其中一个中的全部信息
        String upload=this.getServletContext().getRealPath("/upload/image");
        Focusservice focusservice=new FocusserviceImpl();
        Focus focus = new Focus();
        try {
            BeanUtils.populate(focus,paramextermap);//把获取来的信息封装成focus对象

            if(0==focus.getId()||"".equals(focus.getId())||null == focus.getId()){//满足这些条件 则全为添加新的焦点图操作
                  /* //上传到服务器中的位置 要获取带盘符的
            不能使用getContextPath() 因为该函数获取的是当前工程名称*/
                String realName= UploadUtils.Upload(request,upload);//调用工具类
                focus.setImg("/upload/image/"+realName);//修改focus中的image信息

                focusservice.addFocus(focus);
                /*使用重定向更新地址栏*/
           }
            else {//更新操作
                Part file=request.getPart("file");//获取文件组件 如果文件size==0 则没有上传新的图片 否则上传了新的图片()
                if(file.getSize()>0){//上传了新的图片 就要删除原来的图片
                    String realpath=this.getServletContext().getRealPath(focus.getImg());
                    File files=new File(realpath);
                    System.out.println(realpath);
                    if (files.exists()) {
                        files.delete();
                    }

                    String realName= UploadUtils.Upload(request,upload);//调用工具类
                    focus.setImg("/upload/image/"+realName);
                }
                focusservice.updataFoucs(focus);//没有上传新的文件直接更新信息 linkurl
            }
            response.sendRedirect(this.getServletContext().getContextPath()+"/FocusListServlet?id=2");//获取当前工程名称 +要跳转地址
        } catch (Exception e) {
            e.printStackTrace();
        }



    }
}

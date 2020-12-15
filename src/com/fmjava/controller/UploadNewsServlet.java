package com.fmjava.controller;

import com.fmjava.utils.UploadUtils;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

/*处理富文本编辑器上传图片*/
@WebServlet("/UploadNewsServlet")
@MultipartConfig
public class UploadNewsServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
         form 表单同步的 会产生线程阻塞
         $.ajax 提交异步的 不会阻塞线程  数据返回后存在success 对象中*/
       //获取上传文件存放的绝对位置
        String realPath=this.getServletContext().getRealPath("/upload/image/news");//返回带盘符的文件路径
        try {
            String realFileName= UploadUtils.Upload(request,realPath);//调用工具类上传文件（返回的是图片文件名）
            String path = "http://localhost:8080"+this.getServletContext().getContextPath()+"/upload/image/news/"+realFileName;//不能使用 this.getServletContext().getRealPath("/upload/image/news") 因为加入了http协议 直接从工程中获取文件

            /*将临时文件路径存放在Session域对象中  便于删除没有真正上传的临时文件*/
            HttpSession session = request.getSession();
            ArrayList<String> newfileNames=(ArrayList<String>)session.getAttribute("newfileNames");//判断以前的session中是否存有图片路径
            if(newfileNames==null){
                newfileNames = new ArrayList<String>();
            }
            newfileNames.add(path);
            session.setAttribute("newfileNames",newfileNames);//重新设置session中的对象


        //设置编码格式 json 数据形式 Key Value
        response.setCharacterEncoding("utf-8");
        response.setContentType(" application/json;charset=utf-8");//json 一种 key value 数据格式
        //将文件路径返回富文本编辑器 在上面显示(加上 http 协议 )

        HashMap<Object,Object> hashMap=new HashMap<> ();//Object 所有类型的父类
        hashMap.put("status",1);
        hashMap.put("data",path);

        //使用json 包装好后返回给前端
        JSONObject jsonObject=JSONObject.fromObject(hashMap);
        response.getWriter().write(jsonObject.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
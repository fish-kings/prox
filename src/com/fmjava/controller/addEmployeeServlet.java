package com.fmjava.controller;

import com.fmjava.ServiceImpl.EmployeeServiceImpl;
import com.fmjava.ServiceImpl.FocusserviceImpl;
import com.fmjava.domain.Focus;
import com.fmjava.domain.User;
import com.fmjava.service.EmployeeService;
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
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@WebServlet("/addEmployeeServlet")
@MultipartConfig
public class addEmployeeServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       /*处理编码*/
       request.setCharacterEncoding("utf-8");
        Map<String, String[]> paramextermap = request.getParameterMap();//已经获取前端传来的全部上传信息 hidden或者from表单中的其中一个中的全部信息
        String upload = this.getServletContext().getRealPath("/upload/image");
        EmployeeService employeeService=new EmployeeServiceImpl();
        User user = new User();
        Date date = new Date();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//日期格式化器
        String formatted=simpleDateFormat.format(date);

        try {
            BeanUtils.populate(user, paramextermap);//把获取来的信息封装成focus对象
            if (0 == user.getId() || "".equals(user.getId()) || null == user.getId()) {//满足这些条件 则全为添加新的焦点图操作
               //设置注册时间

                user.setTime_reg(formatted);
                String realName= UploadUtils.Upload(request,upload);//调用工具类
                user.setAvatar("/upload/image/"+realName);//修改focus中的image信息

               employeeService.addEmployeeUser(user);
            }
            else {//更新操作
                Part file=request.getPart("file");//获取文件组件 如果文件size==0 则没有上传新的图片 否则上传了新的图片()
                if(file.getSize()>0){//上传了新的图片 就要删除原来的图片
                    String realpath=this.getServletContext().getRealPath(user.getAvatar());
                    File files=new File(realpath);
                    if (files.exists()) {
                        files.delete();
                    }

                    String realName= UploadUtils.Upload(request,upload);//调用工具类
                    user.setAvatar("/upload/image/"+realName);
                    user.setTime_reg(formatted);//更新时间

                }
                employeeService.updateEmployeeUser(user);//没有上传新的文件直接更新信息 linkurl
            }
            request.getRequestDispatcher("/EmployeeListServlet?id=4").forward(request,response);
        } catch(Exception e){
                e.printStackTrace();
            }


        }
    }
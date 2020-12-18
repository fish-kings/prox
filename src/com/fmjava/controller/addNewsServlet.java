package com.fmjava.controller;

import com.fmjava.ServiceImpl.NewsServiceImpl;
import com.fmjava.domain.News;
import com.fmjava.service.NewsService;
import com.fmjava.utils.HTMLUtils;
import com.fmjava.utils.UploadUtils;
import org.apache.commons.beanutils.BeanUtils;
import sun.invoke.empty.Empty;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@WebServlet("/addNewsServlet")
@MultipartConfig
public class addNewsServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*使用Ajax提交 页面无法直接跳转*/
        NewsService newsService=new NewsServiceImpl();
        request.setCharacterEncoding("utf-8");//设置写入编码格式
        News news=new News();
        String realPath=this.getServletContext().getRealPath("/upload/image");
        Map<String,String[]> newsMap=request.getParameterMap();
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String format=sdf.format(date);
        //获取真正上传的图片名称

        try {
            BeanUtils.populate(news,newsMap);
            List src= HTMLUtils.getSrc(news.getBody());
            news.setNews_img(src.toString());

            if("".equals(news.getId())||0==news.getId()||null==news.getId()){//添加新的内容
                String realName= UploadUtils.Upload(request,realPath);//封面图片
                news.setCover("/upload/image/"+realName);

                //设置上传时间

                System.out.println(format);
                news.setCreate_time(format);
                news.setNews_img(src.toString());

                //添加到数据库中
                newsService.addNews(news);
                System.out.println("添加成功");
            }
            else {//修改新的内容
                Part file=request.getPart("file");
                if(file.getSize()>0){
                    String path=this.getServletContext().getRealPath(news.getCover());
                    File files = new File(path);
                    if (files.exists()) {
                        files.delete();
                    }

                    String newPathName=UploadUtils.Upload(request,this.getServletContext().getRealPath("/upload/image"));
                    news.setCover("/upload/image/"+newPathName);
                    news.setCreate_time(format);
                }
                newsService.updateNews(news);
            }
            //获取session中存放的临时文件 此处有bog(已解决）
            Object object=request.getSession().getAttribute("newfileNames");

            System.out.println(object);
            if(object!=null&&!object.equals("")){
                HTMLUtils.deleteTempFile(src,object,this.getServletContext());
                request.getSession().removeAttribute("newfileNames");//清空session
            }

            //让浏览器自己解析
            response.getWriter().write(this.getServletContext().getContextPath()+"/newListServlet?categoryId="+news.getCate());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

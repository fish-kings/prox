package com.fmjava.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Random;

public class UploadUtils {
    private UploadUtils() { };
    public static String Upload(HttpServletRequest request,String upload)throws Exception{
        Part part=request.getPart("file");//获取上传文件组件
        String fileName=part.getSubmittedFileName();//获取文件名称
        String type=fileName.substring(fileName.lastIndexOf("."));//文件类型
        String realName="fm_"+System.currentTimeMillis()+new Random().nextInt(9999)+type;//存在服务器中新的文件名字
            /* //上传到服务器中的位置 要获取带盘符的
            不能使用getContextPath() 因为该函数获取的是当前工程名称*/
       // String upload=this.getServletContext().getRealPath("/upload/image");

        File file = new File(upload);
        if (!file.exists()) {//判断文件是否存在
            file.mkdirs();
        }

        String realFileName=file+"/"+realName;//文件真实路径

        InputStream inputStream=part.getInputStream();//获取组件输入流
        FileOutputStream fos = new FileOutputStream(realFileName);//获取网络输出流
        byte[] bytes = new byte[1024];
        int length=0;
        while ((length = inputStream.read(bytes))!=-1){
            fos.write(bytes, 0, length);
        }
        fos.close();
        part.delete();
        return realName;
    }
}

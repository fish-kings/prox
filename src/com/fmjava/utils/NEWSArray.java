package com.fmjava.utils;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class NEWSArray {
     private NEWSArray(){};
     public static ArrayList toListArray(String src) {
         if (src != null) {


             String s = src.substring(1,src.length() - 1);//从第一个字符截取 最后一个 不包括最后一个
             System.out.println(s);
             String [] arrayList=s.split(",");//将所有图片信息存储在 String 数组中
             System.out.println(arrayList[0]);
             ArrayList<String> stringList= new ArrayList<String>(Arrays.asList(arrayList));//将数组转为Array List集合
            return stringList;
         }
         else {
             return  null;
         }
     }



}

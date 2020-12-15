package com.fmjava.domain;

import java.util.ArrayList;
import java.util.List;

public class PageBean {
    //记录当前页
    private Integer currentPage;
    //记录共多少页
    private  Integer totalPage;
    //共多少条数据
    private Long totalCount;
    private List dataList=new ArrayList();

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public Long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Long totalCount) {
        this.totalCount = totalCount;
    }

    public List getDataList() {
        return dataList;
    }

    public void setDataList(List dataList) {
        this.dataList = dataList;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "currentPage=" + currentPage +
                ", totalPage=" + totalPage +
                ", totalCount=" + totalCount +
                ", dataLast=" + dataList +
                '}';
    }
}

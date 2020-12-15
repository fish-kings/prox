package com.fmjava.domain;

public class Focus {
    private Integer id;
    private String img;
    private String linkurl;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getLinkurl() {
        return linkurl;
    }

    public void setLinkurl(String linkurl) {
        this.linkurl = linkurl;
    }

    @Override
    public String toString() {
        return "focus{" +
                "id=" + id +
                ", img='" + img + '\'' +
                ", linkurl='" + linkurl + '\'' +
                '}';
    }
}

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/index.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/custom.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/bootstrap/dist/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/page/pageStyle.css">
    <style>
        body{
            background:url("${pageContext.servletContext.contextPath}/images/backpic04.jpg") no-repeat;
            height:100%;
            width:100%;
            /*overflow: hidden;*/
            background-size:cover;
        }
        .main_left{
            width: 10.5%;
            height: 100%;
            float: left;

        }
        .main_right{
            width: 89.5%;
           height: 100%;
            float: left;
            background: url(${pageContext.servletContext.contextPath}/images/backpic04.jpg) no-repeat;/*自动平铺*/
        }
    </style>
</head>
<body>
<div class="main_left">
    <jsp:include page="admin_aside.jsp"></jsp:include>
</div>
<div class="main_right">
    <div class="main">
        <div class="container-fluid">
            <!-- 客户列表 -->
            <div class="body course-list">
                <!-- 面包屑 -->
                <ol class="breadcrumb" style="margin-bottom: 0;height: 50px">
                    <li><a href="javascript:;">资源管理</a></li>
                    <li class="active">资源列表</li>
                    <a id="source_add" href="${pageContext.servletContext.contextPath}/locationServlet?location=admin_add.jsp&categoryId=${categoryId}&id=3" class="btn btn-danger btn-sm pull-right">添加资源</a>
                </ol>
                <div id="courses" class="courses">
                    <c:forEach items="${pageBean.dataList}" var="news">
                        <div class="course">
                            <div class="pic">
                                <img src="${pageContext.servletContext.contextPath}/${news.cover}" alt="" style="width: 150px;">
                            </div>
                            <div class="info">
                                <a href="javascipt:;">${news.title}</a>
                                <ul class="list-unstyled">
                                    <li>

                                        <span>类别：
                                            <c:if test="${news.cate == 1}">新闻速览</c:if>
                                            <c:if test="${news.cate == 2}">会议公告</c:if>
                                            <c:if test="${news.cate == 3}">综合信息</c:if>
                                        </span>
                                        <span>作者 ：没得感情的码农</span>
                                    </li>
                                    <li>
                                        <span>发布日期:</span>
                                        <span>${news.create_time}</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="pull-right">
                                <a  href="${pageContext.servletContext.contextPath}/EditNewsServlet?id=${news.id}&cate=${news.cate}" class="btn btn-primary btn-xs article_edit">编辑</a>
                                <a  href="${pageContext.servletContext.contextPath}/DeleteNewsServlet?id=${news.id}&cover=${news.cover}&cate=${news.cate}" class="btn btn-danger btn-xs article_del">删除</a>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <!-- 分页 -->
                <div id="page" class="page_div" style="height: 80px; padding-top: 20px; text-align: right;">

                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script src="${pageContext.servletContext.contextPath}/js/page/paging.js"></script>
<script>
    $(function () {
        //分页
        $("#page").paging({
            pageNo:${pageBean.currentPage},      /**当前页*/
            totalPage:${pageBean.totalPage} , /**每页显示的记录数*/
            totalSize: ${pageBean.totalCount}, /**共多少条数据*/
            callback: function(num) {  /**num为当前点击的页面*/
            alert(num);
            window.location.href="${pageContext.servletContext.contextPath}/newListServlet?currentPage="+num+"&categoryId=${categoryId}&pageSize=3"
            }
        });
    });
</script>
</html>
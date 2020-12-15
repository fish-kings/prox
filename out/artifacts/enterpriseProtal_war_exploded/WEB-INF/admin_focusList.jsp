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
    <style>
        body{

            height:100%;
            width:100%;
            background-size:cover;
        }
        .container-fluid {
            padding-right: 15px;
            padding-left: 0px;
            margin-right: auto;
            margin-left: auto;
            background: white;
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
            background: url(${pageContext.servletContext.contextPath}/images/backpic04.jpg) no-repeat;
        }
    </style>
</head>
<body>

<%--跳转到列表页 往列表面当中 传递数据  在来到此页面之前一定要获取数据--%>
<div class="main_left">
    <jsp:include page="admin_aside.jsp"></jsp:include>
</div>

<div class="main_right">
    <div class="main">
        <div class="container-fluid"   style="margin-bottom: 80px; margin-top: 20px">
            <div class="body advert">
                <ol class="breadcrumb" style="margin-bottom: 0;height: 50px; border: none; margin-top: 20px;">
                    <li><a href="javascript:;">焦点图管理</a></li>
                    <li class="active">焦点图列表</li>
                    <a style="padding-right: 10px; padding-left: 10px;padding-bottom: 2px;padding-top: 2px" href="${pageContext.servletContext.contextPath}/locationServlet?location=admin_focusAdd.jsp&id=2" class="btn btn-danger btn-default pull-right">添加焦点图</a>
                </ol>

                <div style="overflow:hidden;">
                    <table class="table table-borderless table-hover" style="table-layout: fixed">
                        <thead>
                        <tr style="font-weight: bold;">
                            <th scope="col" width="300px" height="50px" style="font-weight: bolder;font-size:15px">图片</th>
                            <th scope="col" width="150px" style="font-weight: bolder;font-size:15px">链接地址</th>
                            <th scope="col" width="300px" style="font-weight: bolder;font-size:15px">编辑操作</th>
                        </tr>
                        </thead>
                        <tbody  class="person-list">
                        <c:forEach items="${focus}" var="fo">
                            <tr>
                                <td>
                                    <a href="${fo.linkurl}" target="_blank">
                                        <img src="${pageContext.servletContext.contextPath}/${fo.img}" alt="" style="width: 150px;">
                                    </a>
                                </td>
                                <td>${fo.linkurl}</td>
                                <td>
                                    <%--获取id 寻找要编辑的信息--%>
                                    <a href="${pageContext.servletContext.contextPath}/EditServlet?id=${fo.id}" class="btn btn-primary btn-default person-edit">编辑</a>
                                    <a href="${pageContext.servletContext.contextPath}/DeletelServlet?id=${fo.id}&img=${fo.img}" class="btn btn-danger btn-default person-del">删除</a>
                                </td>
                            </tr>
                        </c:forEach>



                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>


</body>

</html>
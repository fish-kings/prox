<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/custom.css">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="js/bootstrap/dist/css/bootstrap.css">
    <style>
        body{
            background:url("${pageContext.servletContext.contextPath}/images/backpic04.jpg") no-repeat;
            height:100%;
            width:100%;
            /*overflow: hidden;*/
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

<div class="main_left">
    <jsp:include page="admin_aside.jsp"></jsp:include>
</div>
<div class="main_right">
    <div class="main">
        <div class="container-fluid"   style="margin-bottom: 80px; margin-top: 20px">
            <div class="body advert">
                <ol class="breadcrumb" style="margin-bottom: 0;height: 50px">
                    <li><a href="javascript:;">风采展示人员管理</a></li>
                    <li class="active">风采展示人员列表</li>
                    <a style="padding-right: 10px; padding-left: 10px;padding-bottom: 2px;padding-top: 2px" href="${pageContext.servletContext.contextPath}/locationServlet?location=admin_employee_add.jsp&id=4" class="btn btn-danger btn-default pull-right">添加风采展示人员信息</a>
                </ol>
                <div style="overflow:hidden;">
                    <table class="table table-borderless table-hover" style="table-layout: fixed">
                        <thead>
                        <tr style="font-weight: bold;">
                            <th scope="col" width="300px" height="50px" style="font-weight: bolder;font-size:15px">头像</th>
                            <th scope="col" width="150px" style="font-weight: bolder;font-size:15px">姓名</th>
                            <th scope="col" width="150px" style="font-weight: bolder;font-size:15px">性别</th>
                            <th scope="col" width="300px" style="font-weight: bolder;font-size:15px">邮箱</th>
                            <th scope="col" style="font-weight: bolder;font-size:15px">部门</th>
                            <th scope="col" width="300px" style="font-weight: bolder;font-size:15px">编辑操作</th>
                        </tr>
                        </thead>
                        <tbody  class="person-list">
                        <c:forEach items="${employees}" var="em">


                            <tr>
                                <td>
                                    <a href="/upload/image/1" target="_blank">
                                        <img src="${pageContext.servletContext.contextPath}/${em.avatar}" alt="" style="width: 150px;">
                                    </a>
                                </td>
                                <td>${em.username}</td>
                                <td>${em.sex}</td>
                                <td>${em.email}</td>
                                <td>${em.deployment}</td>
                                <td>
                                    <a href="${pageContext.servletContext.contextPath}/EditEmployeeServlet?id=${em.id}" class="btn btn-primary btn-default person-edit">编辑</a>
                                    <a href="${pageContext.servletContext.contextPath}/DeleteEmployeServlet?id=${em.id}&avatar=${em.avatar}" class="btn btn-danger btn-default person-del">删除</a>
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

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <style>
        body{
            background-image: url(${pageContext.servletContext.contextPath}/images/backpic04.jpg);

        }
        .main .body a{text-decoration: none; color: #fff;text-align: center;}
        .container-fluid{
            display: flex;
        }
        .f1{
            flex: 1;
            display: block;
            justify-items: center;
            align-items: center;
            /*background-color: #EED3D7;*/
            height:80%;
            line-height: 80%;
            text-align: center;
            vertical-align: center;
        }

        .f1 a img{
            margin-top: 150px;
            width:350px;
            height: 350px;
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
            background: url(${pageContext.servletContext.contextPath}/images/backpic04.jpg) /*no-repeat*/;
        }
    </style>
</head>
<body>

<div class="main_left">
    <jsp:include page="admin_aside.jsp"></jsp:include>
</div>

<div class="main_right">
    <div  class="container-fluid">
        <div class="f1">
            <a href="${pageContext.servletContext.contextPath}/FocusListServlet?id=2"><img src="${pageContext.servletContext.contextPath}/images/xinxi.png"/></a>
        </div>
        <div class="f1">
            <a href="${pageContext.servletContext.contextPath}/newListServlet?categoryId=2"><img src="${pageContext.servletContext.contextPath}/images/xuexiziliao.png"/></a>
        </div>
        <div class="f1">
            <a href="${pageContext.servletContext.contextPath}/EmployeeListServlet?id=4"><img src="${pageContext.servletContext.contextPath}/images/fengcai.png"/></a>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.servletContext.contextPath}/js/jquery.js"></script>
<script>
    $(function () {
        $(".f1 a img").hover(function () {/**鼠标移入---》放大*/
            $(this).animate({
                width:400,
                height:400
            });
        },function () { /**鼠标移出  ---》缩小*/
            $(this).animate({
                width:350,
                height:350
            });
        });

    });
</script>
</html>
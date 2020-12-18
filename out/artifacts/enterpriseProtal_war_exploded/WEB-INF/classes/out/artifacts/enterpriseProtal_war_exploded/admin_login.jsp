<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>没有感情的码农</title>
    <link rel="shortcut icon"herf="${pageContext.servletContext.contextPath}/assets/img/logo3.ico">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/index.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/custom.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/bootstrap/dist/css/bootstrap.css">
    <style>
        body{
            background:url("${pageContext.servletContext.contextPath}/images/backpic03.jpg") no-repeat;
            height:100%;
            width:100%;
            overflow: hidden;
            background-size:cover;
        }
    </style>
</head>

<body>

    <!-- 登录 -->
    <div class="login" style="
    background: none;">

        <div class="login-wrap">
            <h1 style="font-family: 等线;font-weight: bolder;color: #5e5e5e;margin-top: 40px" align="center">小花水产管理系统</h1>
            <%--域当中有没有错误信息  如果有错误信息 把错误信息进行显示--%>
            <c:if test="${!empty loginInfo}">
                <h1 style="font-weight: normal;font-size: 20px; color: red;margin-top: 20px" align="center">${loginInfo}</h1>
            </c:if>

            <div class="avatar2">
                <img src="${pageContext.servletContext.contextPath}/assets/img/logo3.png"  class="img-circle" alt="">
            </div>
            <form id="login_form" action="${pageContext.servletContext.contextPath}/LoginServlet" method="post" class="col-md-offset-1 col-md-10">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon">
                        <i class="fa fa-id-card-o"></i>
                    </span>
                    <label for="user_name"></label>
                    <%--用户名--%>
                    <input id="user_name" name="username" type="text" class="form-control" placeholder="管理员账号">
                </div>
                <div class="input-group input-group-lg">
                    <span class="input-group-addon">
                        <i class="fa fa-key"></i>
                    </span>
                    <label for="user_pwd"></label>
                    <%--密码--%>
                    <input id="user_pwd" name="password" type="password" class="form-control" placeholder="管理员密码">
                </div>
                <%--登录--%>
                <input type="submit" value="登录" class="btn btn-lg btn-danger btn-block">
            </form>
        </div>
    </div>


    <a href=""></a>
</body>
</html>
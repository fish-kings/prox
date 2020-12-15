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

</head>
<body>

<!-- 侧边栏 -->
<div class="aside">
    <!-- 个人资料 -->
    <div id="user_info" class="profile">
        <div class="avatars">
            <img width="100" height="80" src="./images/logo.png" alt="">
        </div>
        <div>
            <br/>
            <h4 style="font-family: 等线;">企业官网管理系统</h4>
            <h4  style="font-family:等线;">后台管理系统</h4>
        </div>
    </div>
    <!-- 导航菜单 -->
    <div class="navs" id="aside_navs">
        <ul>
            <li class="nav_one">
                <a href="${pageContext.servletContext.contextPath}/indexListServlet?id=1"><%--id表示当前是什么页面--%>
                    <i class="fa fa-list"></i>
                    首页
                </a>
            </li>

            <li class="nav_two" >
                <a href="${pageContext.servletContext.contextPath}/FocusListServlet?id=2">
                    <i class="fa fa-users"></i>
                    资源链接管理
                </a>
            </li>

            <li class="nav_three">
                <a class="message_title">
                    <i class="fa fa-object-group"></i>
                    信息公告管理
                    <i class="arrow fa fa-angle-right"></i>
                </a>
                <ul class="news">
                    <li >
                        <a href="${pageContext.servletContext.contextPath}/newListServlet?categoryId=1">
                            新闻速览
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.servletContext.contextPath}/newListServlet?categoryId=2">
                            会议公告
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.servletContext.contextPath}/newListServlet?categoryId=3">
                            综合信息
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav_four" >
                <a href="${pageContext.servletContext.contextPath}/EmployeeListServlet?id=4" >
                    <i class="fa fa-users"></i>
                    员工风采
                </a>
            </li>
            <li  class="nav_five" style="margin-top: 250px">
                <a href="/back/reset_pwd" class="reset_pwd"><i class="fa fa-cog"></i>修改密码</a>
            </li>
            <li  class="nav_six">
                <a href="${pageContext.servletContext.contextPath}/LogoutServlet" class="logout01"><i class="fa fa-sign-out"></i>退出登录</a>
            </li>
            <li>
                <a href="" target="_blank"><i class="fa fa-paper-plane"></i>前台首页 </a>
            </li>
        </ul>
    </div>
</div>
<script src="js/jquery.js"></script>
<script>
    $(function () {/*处理选中状态 */
        if(!${empty id}){//若为空，则后续js无法执行
            var id=${id};
            if(id==1){
                $(".nav_one a").addClass("active");
            }else if(id==2){
                $(".nav_two a").addClass("active")
            }
            else if(id==4){
                $(" .nav_four a").addClass("active");
            }

        }
        $(".message_title").click(function () {/*点击 message——title 将news标签展开收起*/
            $(".news").slideToggle();/*将列表展开合起*/
        });

        /*处理信息公告栏状态*/
        if(!${empty categoryId}){
            $(".news").show();/*//展开*/
            $(".news li:nth-child(${categoryId})").addClass("active").siblings().removeClass("active");/*子标签选中状态*/
        }
    });
</script>


</body>
</html>
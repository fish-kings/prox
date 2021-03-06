<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    request.getAttribute("focus");
%>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>小花水产</title>

    <!-- Stylesheet -->
    <link rel="icon" href="${pageContext.servletContext.contextPath}/assets/img/logo3.ico">
    <link rel="stylesheet" href="assets/css/vendor.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/responsive.css">

</head>
<body>

<!-- preloader area start -->
<div class="preloader" id="preloader">
    <div class="preloader-inner">
        <div class="spinner">
            <div class="dot1"></div>
            <div class="dot2"></div>
        </div>
    </div>
</div>
<!-- preloader area end -->

<!-- search popup start-->
<div class="body-overlay" id="body-overlay"></div>
<div class="td-search-popup" id="td-search-popup">
    <form action="index.html" class="search-form">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search.....">
        </div>
        <button type="submit" class="submit-btn"><i class="fa fa-search"></i></button>
    </form>
</div>
<!-- search popup end-->

<!-- log-in popup start-->
<div class="td-log-in-popup" id="td-log-in-popup">
    <div class="container">
        <div class="row justify-content-center no-gutters">
            <div class="col-lg-5">
                <div class="log-in-wrap">
                    <div class="thumb">
                        <img src="assets/img/logo2.png" alt="img">
                    </div>
                </div>
            </div>
            <div class="col-xl-6 col-lg-7">
                <div class="log-in-form" id="login_form" action="${pageContext.servletContext.contextPath}/LoginServlet"
                     method="post">
                    <!--  <button type="button" class="close">
                         <span>&times;</span>
                     </button> -->
                    <ul class="nav nav-pills">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="pill" href="#pills-home">登录</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="pill" href="#pills-profile">注册</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="pills-home">
                            <form action="${pageContext.servletContext.contextPath}/LoginServlet" method="post">
                                <div class="form-group">
                                    <label>账号</label>
                                    <input type="text" id="user_name" name="username" class="form-control"
                                           placeholder="请输入您的账号">
                                </div>
                                <div class="form-group">
                                    <label>密码</label>
                                    <input type="password" id="user_pwd" name="password" class="form-control">
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input">
                                    <label class="form-check-label">记住登录</label>
                                </div>
                                <a class="lost-password" href="#">忘记密码?</a>
                                <button type="submit" class="btn btn-base w-100">登录</button>
                                <div class="other-log-in-area text-center">
                                    <h6>OR LOGIN WITH</h6>
                                    <a class="btn btn-fb" href="#"><i class="fa fa-facebook"></i>FACEBOOK</a>
                                    <a class="btn btn-google" href="#"><i class="fa fa-google"></i>GOOGLE</a>
                                </div>
                            </form>
                        </div>
                        <div class="tab-pane fade" id="pills-profile">
                            <form>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Full Name</label>
                                            <input type="text" class="form-control" placeholder="Full Name">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>User or email*</label>
                                            <input type="text" class="form-control" placeholder="Email">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" class="form-control" placeholder="password">
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input">
                                    <label class="form-check-label">Remember me</label>
                                </div>
                                <a class="lost-password" href="#">Lost your password?</a>
                                <button type="submit" class="btn btn-base w-100">登录</button>
                                <div class="other-log-in-area text-center">
                                    <h6>OR LOGIN WITH</h6>
                                    <a class="btn btn-fb" href="#"><i class="fa fa-facebook"></i>FACEBOOK</a>
                                    <a class="btn btn-google" href="#"><i class="fa fa-google"></i>GOOGLE</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- log-in popup end-->

<!-- 导航栏navbar start -->
<div class="navbar-area navbar-area-1">
    <nav class="navbar navbar-expand-lg">
        <div class="container nav-container">
            <div class="responsive-mobile-menu">
                <button class="menu toggle-btn d-block d-lg-none" data-target="#themefie_main_menu"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-left"></span>
                    <span class="icon-right"></span>
                </button>
            </div>
            <div class="logo">
                <a class="main-logo" href="index.html"><img src="assets/img/logo.png" alt="img"></a>
            </div>
            <div class="nav-right-part nav-right-part-mobile">
                <a class="search" href="#"><i class="fa fa-search"></i></a>
                <a class="btn btn-base log-in" href="#">Login</a>
            </div>
            <div class="collapse navbar-collapse" id="themefie_main_menu">
                <ul class="navbar-nav menu-open text-left pl-lg-5">
                    <li><a href="contact.html">新闻速览</a></li>
                    <li><a href="contact.html">会议公告</a></li>
                    <li><a href="contact.html">综合信息</a></li>

                </ul>
            </div>
            <div class="nav-right-part nav-right-part-desktop">
                <a class="btn btn-white log-in" href="#">登录</a>
            </div>
        </div>
    </nav>
</div>
<!-- 导航栏navbar end -->

<!-- 轮播图banner start -->
<%--<div class="banner-area">--%>
<%--    <div class="container">--%>
<%--        <div class="banner-area-inner" style="background-image:url('assets/img/banner/1.png')">--%>
<%--            <div class="row">--%>
<%--                <div class="col-xl-5 col-lg-7 col-md-10">--%>
<%--                    <div class="banner-inner">--%>
<%--                        <h2>小花水产，啥都能摸</h2>--%>
<%--                        <p>咸鱼的价格是九磅十五便士，我们的实力，引领绿色健康的品质生活！</p>--%>
<%--                        <div class="main-search-inner">--%>
<%--                            <i class="fa fa-search"></i>--%>
<%--                            <input type="text" placeholder="Search">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>



<%--测试--%>
<div class="banner-area">
    <div class="container">
        <div class="exp-slider owl-carousel">
            <div class="banner-area-inner" style="background-image:url('assets/img/banner/1.png')">
                <div class="col-xl-5 col-lg-7 col-md-10">
                <div class="banner-inner">
                    <h2>小花水产，啥都能摸</h2>
                    <p>咸鱼的价格是九磅十五便士，我们的实力，引领绿色健康的品质生活！</p>
                </div>
                </div>
            </div>

            <c:forEach items="${focus}" var="fo">
                <div class="banner-area-inner" style="background-image:url('${pageContext.servletContext.contextPath}/${fo.img}')">
                    <div class="col-xl-5 col-lg-7 col-md-10">
                        <div class="banner-inner">
                            <h2>小花水产，啥都能摸</h2>
                            <p>咸鱼的价格是九磅十五便士，我们的实力，引领绿色健康的品质生活！</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>
</div>
<!-- 轮播图banner end -->

<!-- 公告latest-course start -->
<div class="latest-course-area pd-top-140">
    <div class="container">
        <div class="section-title text-center">
            <h2>-小花水产的公告-</h2>
        </div>
        <div class="dmne-tab-inner text-center">
            <ul class="nav nav-tabs" id="ex1" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="ex1-tab-1" data-toggle="pill" href="#ex1-tabs-1" role="tab"
                       aria-controls="pills-1" aria-selected="true">新闻速览</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="ex1-tab-2" data-toggle="pill" href="#ex1-tabs-2" role="tab"
                       aria-controls="pills-2" aria-selected="false">会议公告</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="ex1-tab-3" data-toggle="pill" href="#ex1-tabs-3" role="tab"
                       aria-controls="pills-3" aria-selected="false">综合信息</a>
                </li>
            </ul>
        </div>
        <div class="tab-content" id="ex1-content">
            <div class="tab-pane fade show active" id="ex1-tabs-1" role="tabpanel">
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/1.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/2.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/3.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="ex1-tabs-2" role="tabpanel">
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/4.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/5.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/6.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="ex1-tabs-3" role="tabpanel">
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/3.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/4.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/5.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="ex1-tabs-4" role="tabpanel">
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/2.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/3.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/4.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="ex1-tabs-5" role="tabpanel">
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/6.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/5.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/4.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="ex1-tabs-6" role="tabpanel">
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/3.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/2.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/1.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="ex1-tabs-7" role="tabpanel">
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/2.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/3.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-course-inner">
                            <div class="thumb">
                                <img src="assets/img/course/4.png" alt="img">
                                <div class="rating">4.9/5 <i class="fa fa-star"></i></div>
                                <a href="#" class="bookmark"><i class="fa fa-bookmark-o"></i></a>
                            </div>
                            <div class="details">
                                <div class="meta">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>5,957 students</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <p>01h 49m</p>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="#">Motion Graphics: Create a Nice Typography Animation</a></h5>
                                <div class="price-inner">
                                    <div class="row">
                                        <div class="col-6">
                                            <p>$33.99</p>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 公告latest-course end -->

<!-- 荣誉intro-area start -->
<div class="intro-area pd-top-120 pd-bottom-110">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-7 col-lg-8">
                <div class="section-title text-center">
                    <h2>-小花水产的荣誉-</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur elit, sed do eiusmod tempor incididunt ut labore et
                        dolore magna aliqua. Quis ipsum ultrices </p>
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6">
                <div class="single-intro-inner text-center">
                    <div class="thumb">
                        <img src="assets/img/icon/1.png" alt="img">
                    </div>
                    <div class="details">
                        <h5>Practical skills</h5>
                        <p>Learn proven methods, processes, and best practices - and apply them to your work
                            immediately.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single-intro-inner text-center">
                    <div class="thumb">
                        <img src="assets/img/icon/2.png" alt="img">
                    </div>
                    <div class="details">
                        <h5>Practical skills</h5>
                        <p>Learn proven methods, processes, and best practices - and apply them to your work
                            immediately.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single-intro-inner text-center">
                    <div class="thumb">
                        <img src="assets/img/icon/3.png" alt="img">
                    </div>
                    <div class="details">
                        <h5>Practical skills</h5>
                        <p>Learn proven methods, processes, and best practices - and apply them to your work
                            immediately.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 荣誉intro-area end -->


<!-- 员工feedback area start -->
<div class="feedback-intro-area pd-bottom-110">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-7 col-lg-8">
                <div class="section-title text-center">
                    <h2 class="title">-小花水产员工-</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur elit, sed do eiusmod tempor incididunt ut labore et
                        dolore magna aliqua. Quis ipsum ultrices </p>
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-7">
                <div class="testimonial-thumbnail-carousel">
                    <div class="single-thumbnail-item">
                        <img src="assets/img/team/1.png" alt="shop">
                        <a href="https://www.youtube.com/watch?v=WwvNiN2_Jlk"
                           class="video-btn video-play-btn mfp-iframe" tabindex="0"><i class="fa fa-play"></i></a>
                    </div>
                    <div class="single-thumbnail-item">
                        <img src="assets/img/team/2.png" alt="shop">
                        <a href="https://www.youtube.com/watch?v=WwvNiN2_Jlk"
                           class="video-btn video-play-btn mfp-iframe" tabindex="0"><i class="fa fa-play"></i></a>
                    </div>
                    <div class="single-thumbnail-item">
                        <img src="assets/img/team/3.png" alt="shop">
                        <a href="https://www.youtube.com/watch?v=WwvNiN2_Jlk"
                           class="video-btn video-play-btn mfp-iframe" tabindex="0"><i class="fa fa-play"></i></a>
                    </div>
                    <div class="single-thumbnail-item">
                        <img src="assets/img/team/4.png" alt="shop">
                        <a href="https://www.youtube.com/watch?v=WwvNiN2_Jlk"
                           class="video-btn video-play-btn mfp-iframe" tabindex="0"><i class="fa fa-play"></i></a>
                    </div>
                    <div class="single-thumbnail-item">
                        <img src="assets/img/team/5.png" alt="shop">
                        <a href="https://www.youtube.com/watch?v=WwvNiN2_Jlk"
                           class="video-btn video-play-btn mfp-iframe" tabindex="0"><i class="fa fa-play"></i></a>
                    </div>
                    <div class="single-thumbnail-item">
                        <img src="assets/img/team/6.png" alt="shop">
                        <a href="https://www.youtube.com/watch?v=WwvNiN2_Jlk"
                           class="video-btn video-play-btn mfp-iframe" tabindex="0"><i class="fa fa-play"></i></a>
                    </div>
                    <div class="single-thumbnail-item">
                        <img src="assets/img/team/7.png" alt="shop">
                        <a href="https://www.youtube.com/watch?v=WwvNiN2_Jlk"
                           class="video-btn video-play-btn mfp-iframe" tabindex="0"><i class="fa fa-play"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="testimonial-thumbnail-slider">
                    <div class="slider-item text-center">
                        <h5>Ramjan Ali Anik</h5>
                        <span>Bostsolf.co</span>
                        <p>One ipsum dolor sit amet, elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Quis
                            ipsum ultrices gravida. Risus dolore magna aliqua. Quis ipsum ultrices gravida.</p>
                    </div>
                    <div class="slider-item text-center">
                        <h5>Sobuj Anik</h5>
                        <span>Bostsolf.co</span>
                        <p>Lorem ipsum dolor sit amet, elit, sed do eiusmod tempor ut labore et dolore magna aliqua.
                            Quis ipsum ultrices gravida. Risus dolore magna aliqua. Quis ipsum ultrices gravida.</p>
                    </div>
                    <div class="slider-item text-center">
                        <h5>John Doe</h5>
                        <span>Bostsolf.co</span>
                        <p>ipsum dolor sit amet, elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Quis
                            ipsum ultrices gravida. Risus dolore magna aliqua. Quis ipsum ultrices gravida.</p>
                    </div>
                    <div class="slider-item text-center">
                        <h5>Wilson mat</h5>
                        <span>Bostsolf.co</span>
                        <p>Lorem dolor sit amet, elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Quis
                            ipsum ultrices gravida. Risus dolore magna aliqua. Quis ipsum ultrices gravida.</p>
                    </div>
                    <div class="slider-item text-center">
                        <h5>Jonathan Jac</h5>
                        <span>Bostsolf.co</span>
                        <p>elit Lorem ipsum dolor sit amet, sed do eiusmod tempor ut labore et dolore magna aliqua. Quis
                            ipsum ultrices gravida. Risus dolore magna aliqua. Quis ipsum ultrices gravida.</p>
                    </div>
                    <div class="slider-item text-center">
                        <h5>Ramjan Ali Anik</h5>
                        <span>Bostsolf.co</span>
                        <p>dolor Lorem ipsum sit amet, elit, sed do eiusmod tempor ut labore et dolore magna aliqua.
                            Quis ipsum ultrices gravida. Risus dolore magna aliqua. Quis ipsum ultrices gravida.</p>
                    </div>
                    <div class="slider-item text-center">
                        <h5>Jonathan Jac</h5>
                        <span>Bostsolf.co</span>
                        <p>Lorem ipsum dolor sit amet, elit, sed do eiusmod tempor ut labore et dolore magna aliqua.
                            Quis ipsum ultrices gravida. Risus dolore magna aliqua. Quis ipsum ultrices gravida.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 员工feedback area end -->

<!-- 各种链接client area Start -->
<div class="client-area pd-top-120">
    <div class="container">
        <div class="row">
            <div class="client-slider owl-carousel owl-theme">
                <div class="item">
                    <div class="thumb">
                        <img src="assets/img/client/1.png" alt="img">
                    </div>
                </div>
                <div class="item">
                    <div class="thumb">
                        <img src="assets/img/client/2.png" alt="img">
                    </div>
                </div>
                <div class="item">
                    <div class="thumb">
                        <img src="assets/img/client/3.png" alt="img">
                    </div>
                </div>
                <div class="item">
                    <div class="thumb">
                        <img src="assets/img/client/4.png" alt="img">
                    </div>
                </div>
                <div class="item">
                    <div class="thumb">
                        <img src="assets/img/client/5.png" alt="img">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 各种链接client area End -->

<!-- 底部footer area start -->
<footer class="footer-area pd-top-140">
    <div class="container">
        <div class="footer-top text-center">
            <div class="row justify-content-center">
                <div class="col-xl-6 col-lg-8">
                    <h2>-加入小花水产吧！-</h2>
                    <p>Small team with big ideas! We provide UI/UX Design, Development, premium WordPress themes,
                        plugins</p>
                    <div class="subscribe-inner-wrap">
                        <input type="text" placeholder="Enter Your Email">
                        <button class="btn btn-base">Subscribe</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-sm-6">
                <h4 class="widget-title">Categories</h4>
                <div class="widget_nav_menu">
                    <ul>
                        <li><a href="#">All Courses</a></li>
                        <li><a href="#">Digital Marketing</a></li>
                        <li><a href="#">Design & Branding</a></li>
                        <li><a href="#">Adobe Creative Cloud</a></li>
                        <li><a href="#">Storytelling & Voice Over</a></li>
                        <li><a href="#">Web & SEO</a></li>
                        <li><a href="#">Programs</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <h4 class="widget-title">Community</h4>
                <div class="widget_nav_menu">
                    <ul>
                        <li><a href="#">Go Premium</a></li>
                        <li><a href="#">Team Plans</a></li>
                        <li><a href="#">Refer a Friend</a></li>
                        <li><a href="#">Gift Cards</a></li>
                        <li><a href="#">Scholarships</a></li>
                        <li><a href="#">Free Classes</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <h4 class="widget-title">Teaching</h4>
                <div class="widget_nav_menu">
                    <ul>
                        <li><a href="#">Become a Teacher</a></li>
                        <li><a href="#">Teaching Academy</a></li>
                        <li><a href="#">Teacher Handbook</a></li>
                        <li><a href="#">Partnerships</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <h4 class="widget-title">Support</h4>
                <div class="widget_nav_menu mb-5">
                    <ul>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Contact Support</a></li>
                        <li><a href="#">Forum</a></li>
                    </ul>
                </div>
                <h4 class="widget-title">Follow Us On</h4>
                <ul class="social-area mb-5 mb-lg-0">
                    <li>
                        <a href="#"><i class="fa fa-facebook"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-behance"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-linkedin"></i></a>
                    </li>
                </ul>
            </div>
        </div>
        <!--底部商标-->
        <div class="footer-bottom">
            <div class="row">
                <div class="col-md-6">
                    <div class="thumb">
                        <img src="assets/img/logo.png" alt="img">
                    </div>
                </div>
                <div class="col-md-6 text-md-right mt-3 mt-md-0 align-self-center">
                    <p>Copyright &copy; 2020.Company name All rights reserved.</p>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- 底部footer area end -->

<!-- back to top area start -->
<div class="back-to-top">
    <span class="back-top"><i class="fa fa-angle-up"></i></span>
</div>
<!-- back to top area end -->


<!-- all plugins here -->
<script src="assets/js/vendor.js"></script>
<!-- main js  -->
<script src="assets/js/main.js"></script>
</body>
</html>
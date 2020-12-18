<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/index.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/custom.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/bootstrap/dist/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/wangEditor/wangEditor.css">
    <style>
        .preview {
            width: 480px;
            height: 270px;
            padding: 0;
            margin-left: 15px;
            overflow: hidden;
            position: relative;
        }

        .preview:hover .cover {
            background-color: rgba(0, 0, 0, 0.4);
        }

        .preview:hover .fa-upload {
            color: rgba(240, 240, 240, 0.8);
        }

        #upfile {
            position: absolute;
            left: 0;
            top: 0;
            z-index: 9;
            width: 100%;
            height: 100%;
            opacity: 0;
        }

        .cover {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            text-align: center;
            line-height: 270px;
            font-size: 40px;
            background-color: rgba(0, 0, 0, 0);
            transition: all 0.3s;
        }

        .fa-upload {
            color: rgba(240, 240, 240, 0);
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
    <div class="container-fluid"  style="margin-bottom: 80px; width: 1620px; padding-bottom: 200px; margin-top: 100px;  background: white;">
        <div class="body advert" style="padding-top: 20px;">
            <!-- 面包屑 -->
            <ol class="breadcrumb"  style="margin-bottom: 0;height: 50px; font-size: 15px; padding-top: 15px;">
                <li>资源列表</li>
                <li class="active">添加资源</li>
            </ol>
            <div class="advert-add" style="overflow:hidden; margin-top: 20px;">
                <form id="source_form" action=" ${pageContext.servletContext.contextPath}/addFocusServlet" method="post" class="form-horizontal" enctype="multipart/form-data">
                    <%--隐式的把当前要编辑修改的ID传给服务器  有id进行编辑操作
                    如果没有id 则表示进行添加操作 hidden隐藏字段属性，不会在字面上显示
                    --%>  <input type="hidden" name="img" value="${focus.img}"><%--没有新上传在这里获取img属性--%>
              <input type="hidden" value="${focus.id}" name="id">
                    <div class="form-group">
                        <label for="title" class="col-md-3 control-label">链接地址</label>
                        <div class="col-md-5">
                            <input id="title" value="${focus.linkurl}" name="linkurl" type="text" class="form-control input-sm"
                                   placeholder="请填写链接地址" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">焦点图</label>
                        <div class="col-md-2 preview">
                            <%--编辑和添加时使用的同一个界面
                            判断有没有域对象 如果 有 则显示
                            如果没有 进行添加操作 显示默认图片
                            --%>
                            <img id="image_url"
                                <c:if test="${!empty focus}"> src="${pageContext.servletContext.contextPath}/${focus.img}" </c:if><%--回显操作--%>
                                 <c:if test="${empty focus}"> src="./images/course.jpg" </c:if>
                                 style="border: 1px solid #e0e0e0;">
                            <input type="file" id="upfile" name="file"<%-- required--%>><%--文件选择器 required 属性规定必需在提交之前填写输入字段。--%>  <%--新上传 通过servlet 在part中获取img 属性--%>
                            <div class="cover">
                                <i class="fa fa-upload"></i>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="padding-left: 140px;">
                        <div class="col-md-3" >
                            <input type="submit" style="margin-left: 50px" class="btn btn-danger btn-sm pull-right" value="添加资源">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>



<script src="./js/jquery.js"></script>
<script>//处理图片本地显示
    $(function () {
   var on=$("#upfile").on('change',function () {
       var imageFlie=this.files[0];//读取本地文件
       console.log(imageFlie);
       var fileReader=new FileReader();//文件阅读器
       fileReader.readAsDataURL(imageFlie);//把文件转成对应的url

       fileReader.onloadend=function (ev) {
        $("#image_url").attr("src",this.result);//更改文件路径
       }

   });
    });
</script>
</html>
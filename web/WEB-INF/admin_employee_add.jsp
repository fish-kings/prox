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
        .preview {
            width: 120px;
            height: 130px;
            padding: 0;
            margin-left: 15px;
            /*overflow: hidden;*/
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
            line-height: 90px;
            font-size: 40px;
            background-color: rgba(0, 0, 0, 0);
            transition: all 0.3s;
        }

        .fa-upload {
            color: rgba(240, 240, 240, 0);
        }
        textarea{
            height: 100px;
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
            background: white;
        }


    </style>
</head>
<body>

<div class="main_left">
    <jsp:include page="admin_aside.jsp"></jsp:include>
</div>

<div class="main_right">
    <div class="container-fluid"   style="margin-bottom: 80px; margin-top: 20px">
        <div class="body advert">
            <!-- 面包屑 -->
            <ol class="breadcrumb" style="border:none;margin-bottom: 0;height: 50px;">
                <li style="color: ghostwhite"><a href="/back/philosophy_list">风采展示人员列表</a></li>
                <li class="active">添加风采展示人员</li>
            </ol>
            <div class="advert-add" style="margin-top: 20px;">
                <form id="sowing_form" action="${pageContext.servletContext.contextPath}/addEmployeeServlet" method="post" class="form-horizontal" enctype="multipart/form-data">
                      <%--添加隐藏属性 判断是修改还是添加--%>
                        <input type="hidden" value="${employee.id}" name="id" >
                      <input type="hidden" value="${employee.avatar}" name="avatar" >


                    <div class="form-group">
                        <label for="person_name" class="col-md-3 control-label">姓名</label>
                        <div class="col-md-5">
                            <input id="person_name" name="username" type="text" value="${employee.username}" class="form-control input-sm" placeholder="请填写姓名" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="person_name" class="col-md-3 control-label">性别</label>
                        <div class="col-md-5">
                            <label class="checkbox-inline">
                                <input name="sex" type="radio" value="男" <c:if test="${employee.sex=='男'}"> checked</c:if>> 男<%--test表示条件--%>
                            </label>
                            <label class="checkbox-inline">
                                <input name="sex" type="radio" value="女" <c:if test="${employee.sex=='女'}"> checked</c:if>> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">头像</label>
                        <div class="col-md-2 preview">
                            <img id="image_url"
                                 <c:if test="${!empty employee}"> src="${pageContext.servletContext.contextPath}/${employee.avatar}" </c:if>
                                 <c:if test="${empty employee}"> src="images/none.jpg" </c:if>

                                 style=" width:120px; height:130px; border: 1px solid #e0e0e0;">
                            <input name="file" type="file" id="upfile">
                            <div class="cover">
                                <i class="fa fa-upload"></i>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="person_deploy" class="col-md-3 control-label">部门</label>
                        <div class="col-md-5">
                            <input id="person_deploy"  value="${employee.deployment}" name="deployment" type="text" class="form-control input-sm" placeholder="请填写部门" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="person_email" class="col-md-3 control-label">邮箱</label>
                        <div class="col-md-5">
                            <input id="person_email"  value="${employee.email} " name="email" type="text" class="form-control input-sm" placeholder="请填写邮箱" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="person_brief" class="col-md-3 control-label">职称</label>
                        <div class="col-md-5">
                            <input id="person_brief" value="${employee.brief}" name="brief" type="text" class="form-control input-sm" placeholder="请填写职称" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="person_profile" class="col-md-3 control-label">个人简介/履历</label>
                        <div class="col-md-5">
                            <%--</textarea>   https://www.runoob.com/tags/att-textarea-maxlength.html--%>
                            <textarea id="person_profile" name="profile"  class="form-control input-sm" placeholder="请填写个人简介/履历" required> ${employee.profile}</textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-8">
                            <input type="submit" class="btn btn-danger btn-sm pull-right" value="添加【风采展示人员】">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script>
    $(function () {
        // 1. 处理图片的本地展示
        $('#upfile').on('change', function () {
            // console.log($(this)[0].files);
            // 1.1 取出本地的文件
            var imgFile = $(this)[0].files[0];
            // 1.2 文件阅读对象
            var fileReader = new FileReader();
            fileReader.readAsDataURL(imgFile);
            // 1.3 文件读取完毕
            fileReader.onloadend = function () {
                // console.log(this.result);
                $('#image_url').attr('src', this.result);
            }
        });

      });
</script>
</body>
</html>
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
            background: white;
        }
        /*更改富文本编辑器样式 width height*/
        .w-e-toolbar {
            width: 800px;
        }
        .w-e-text-container {
            width: 800px;
            height: 330px !important;/*设置权重 */
        }
    </style>
</head>

<body>
<div class="main_left">
    <jsp:include page="admin_aside.jsp"></jsp:include>
</div>
<div class="main_right">

    <div class="container-fluid"  style="margin-bottom: 80px; margin-top: 20px">
        <div class="body advert">
            <ol class="breadcrumb"  style="margin-bottom: 0;height: 50px; padding-top: 15px;">
                <li>资源列表</li>
                <li class="active">添加资源</li>
            </ol>
            <div class="advert-add" style="overflow:hidden; margin-top: 20px;">
                <form id="source_form" action="${pageContext.servletContext.contextPath}/addNewsServlet" method="post" class="form-horizontal"
                      enctype="multipart/form-data">
                  <input type="hidden" name="id" value="${news.id}"><%--//添加时没有--%>
                  <input type="hidden" name="cover" value="${news.cover}"><%--//添加时保留原有图片的值 没有为null--%>
                    <input type="hidden" name="cate" value="${categoryId}"><%--//locationSevlet 中设置--%>
                    <div class="form-group">
                        <label for="title" class="col-md-3 control-label">标题</label>
                        <div class="col-md-5">
                            <input id="title" value="${news.title}" name="title" type="text" class="form-control input-sm"
                                   placeholder="请填写文章标题" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">封面</label>
                        <div class="col-md-2 preview">
                            <c:if test="${!empty news}"><img id="image_url" src="${pageContext.servletContext.contextPath}/${news.cover}" style="border: 1px solid #e0e0e0;"></c:if>
                            <c:if test="${empty news}"> <img id="image_url" src="./images/course.jpg" style="border: 1px solid #e0e0e0;"></c:if>

                            <input type="file" id="upfile" name="file">
                            <div class="cover">
                                <i class="fa fa-upload"></i>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">内容</label>
                        <div class="col-md-8" id="editor"></div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-8">
                            <input type="submit" class="btn btn-danger btn-sm pull-right" value="添加资源">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
<script src="./js/jquery.js"></script>
<script src="./js/wangEditor/wangEditor.js"></script>
<script>
    $(function () {
        // 1. 生成一个富文本编辑器
        var E = window.wangEditor;
        var editor = new E('#editor');
        editor.customConfig.uploadVideoMaxSize = 100 * 1024 * 1024;
        editor.customConfig.showLinkImg = false;
        /**配置图片上传  调用函数  当我们选择了图片之后会自动调用此方法
         * 一个是本地选择文件
         * insert 要插入到富文本当中图片地址  要自己进行设置
         * */
        editor.customConfig.customUploadImg = function (files, insert) {
            // 2. 获取文件
            var imgFile = files[0];
            // 3. 上传图片
            if (files.length > 0) {
                // 4. 生成formData对象
                var formData = new FormData();
                formData.append('file', imgFile);
                $.ajax({
                    url: '${pageContext.servletContext.contextPath}/UploadNewsServlet',
                    type: 'post',
                    processData: false, // 不要处理转化成一个查询字符串
                    contentType: false,
                    data: formData,
                    success: function (result) {  /**异步*/
                        if (result.status === 1) {
                            insert(result.data);
                        } else {
                            alert('插入图片失败!');
                        }
                    }
                });
            }
        };

        // 定制视频上传函数，只有定义该函数，才会显示上传视频按钮
        editor.customConfig.customUploadVideo = function (media, insert) {
            var videoFile = media[0];
            // 3. 上传视频
            if (media.length > 0) {
                // 4. 生成formData对象
                var formData = new FormData();
                formData.append('file', videoFile);
                $.ajax({
                    url: '${pageContext.servletContext.contextPath}/UploadNewsServlet',
                    type: 'post',
                    processData: false, // 不要处理转化成一个查询字符串
                    contentType: false,
                    data: formData,
                    success: function (result) {
                        if (result.status === 1) {
                            insert(result.data);
                        } else {
                            alert('插入视频失败!');
                        }
                    }
                });
            }
        };
        /** 要在创建 之前设置文件的上传*/
        editor.create();
        editor.txt.html('${news.body}');//回显body中的内容

        /*封面图片本地展示*/
        $('#upfile').on('change', function () {
            // 1.1 取出本地的文件
            var imgFile = this.files[0];
            console.log(imgFile);
            // 1.2 文件阅读对象
            var fileReader = new FileReader();
            fileReader.readAsDataURL(imgFile);
            // 1.3 文件读取完毕
            fileReader.onloadend = function () {
                $('#image_url').attr('src', this.result);
            }
        });

        /* <label class="col-md-3 control-label">内容</label>
            <div class="col-md-8" id="editor"></div>
            上面 的内容在div（富文本编辑器）中 无法直接通过form表单提交获取其中的内容 所以通过Ajax 提交 用js解析获取
            */

        $('#source_form').submit(function () {
            // 2.1 创建FormData对象
            var formData = new FormData(this);
            // 2.3 取出文章内容
            formData.append('body', editor.txt.html());
            // 2.3 发起请求
            $.ajax({
                url: $(this).attr('action'), //form 中的action
                type: $(this).attr('method'),
                processData: false, // 不需要序列化数据处理数据
                contentType: false,
                data: formData,
                success: function (result) {
                    window.location.href = result;
                }
            });
            // 阻止默认提交
            return false;
        });
    });




</script>
</html>
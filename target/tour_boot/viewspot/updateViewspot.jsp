<%--
  Created by IntelliJ IDEA.
  User: wyy
  Date: 2020/7/29
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        form{
            width:270px;
        }
        input{
            width: 64%;
            background: #eee;
        }
        input:focus{
            background: #fff;
        }
        form{
            padding: 0 12px 12px;
        }
        label{
            display: block;
            padding-bottom:12px;
        }
        .label-text{
            width: 36%;
            float: left;
        }
        #img-show{
            width: 135px;
            height: 135px;
            display: block;
            margin: 0 auto;
            object-fit: cover;
        }
    </style>
    <script>
        function imgfileChange() {
            var img_show = document.getElementById("img-show");
            var imgfile = document.getElementById("imgfile");

            var freader = new FileReader();
            freader.readAsDataURL(imgfile.files[0]);
            freader.onload = function (e) {
                img_show.src = e.target.result;
            };
        }
    </script>
</head>
<body>
<div id="wrap">
    <div id="header">
        <div style="float: right;padding-top: 24px">2009/11/20</div>
        <h1>旅游信息管理系统</h1>
    </div>
    <div id="header-bar"></div>
    <div id="content" style="height: 410px">
        <img src="${pageContext.request.contextPath}/img/timg.jpg" style="float: right;height: 320px">
        <h2>修改景点</h2>
        <form action="${pageContext.request.contextPath}/view/update" method="post" enctype="multipart/form-data">
            <label>
                <div class="label-text">景&emsp;&emsp;点：</div>
                <input type="hidden" name="vid"  value="${requestScope.view.vid}"/>
                <input type="text" name="vname" value="${requestScope.view.vname}">
            </label>
            <label>
                <div class="label-text">印象图片：</div>
                <div style="text-align: center;padding-left: 36%">
                    <img src="${pageContext.request.contextPath}/img/${requestScope.view.picture}" alt="" id="img-show">
                    <input type="file"  name="file" id="imgfile" style="display: none" onchange="imgfileChange()">
                </div>
            </label>
            <label>
                <div class="label-text">旺季时间：</div>
                <input type="text" name="hottime" value="${requestScope.view.hottime}">
            </label>
            <label>
                <div class="label-text">旺季门票：</div>
                <input type="text" name="hotprice" value="${requestScope.view.hotprice}">
            </label>
            <label>
                <div class="label-text">淡季门票：</div>
                <input type="text" name="normalprice" value="${requestScope.view.normalprice}">
                <input type="hidden" name="synopsis" value="${requestScope.view.synopsis}">
            </label>
            <label>
                <div class="label-text">所属省份：</div>
                <select name="province.pid">
                    <c:forEach var="p" items="${requestScope.list}">
                        <option value="${p.pid }" ${requestScope.view.province.pid==p.pid? "selected":""}>${p.pname}</option>
                    </c:forEach>
                </select>
            </label>
            <button type="submit">提 交</button>&emsp;
            <a href="#" onclick="history.go(-1);">返回</a>
        </form>
    </div>
    <div id="footer">
        ABC@126.com
    </div>
</div>
</body>
</html>

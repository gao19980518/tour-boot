<%--
  Created by IntelliJ IDEA.
  User: wyy
  Date: 2020/7/29
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            width: 70%;
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
            width: 30%;
            float: left;
        }
    </style>
</head>
<body>
<div id="wrap">
    <div id="header">
        <div style="float: right;padding-top: 24px">2009/11/20</div>
        <h1>旅游信息管理系统</h1>
    </div>
    <div id="header-bar"></div>
    <div id="content" style="height: 360px">
        <img src="${pageContext.request.contextPath}/img/timg.jpg" style="float: right;height: 320px">
        <h2>修改省份</h2>
        <form action="${pageContext.request.contextPath}/province/update" method="post">
            <label>
                <div class="label-text">省&emsp;份：</div>
                <input type="text" name="pname" value="${requestScope.province.pname}">
                <input type="hidden" name="pid" value="${requestScope.province.pid}">
            </label>
            <label>
                <div class="label-text">标&emsp;签：</div>
                <input type="text" name="ptag" value="${requestScope.province.ptag}">
                <input type="hidden" name="count" value="${requestScope.province.count}">
            </label>
            <button type="submit">提 交</button>&emsp;
            <a href="${pageContext.request.contextPath}/province/queryPage">返回</a>
        </form>
    </div>
    <div id="footer">
        ABC@126.com
    </div>
</div>
</body>
</html>

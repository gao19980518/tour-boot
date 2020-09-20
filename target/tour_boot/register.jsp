<%--
  Created by IntelliJ IDEA.
  User: wyy
  Date: 2020/7/29
  Time: 15:18
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
        #img-vcode{
            width: 56px;
            height: 21px;
            float:right;
            position: relative;
            top:2px;
            left:-6px
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
        <h2>注册</h2><span style="color: crimson">${requestScope.message}</span>
        <form action="${pageContext.request.contextPath}/user/register" method="post">
            <label>
                <div class="label-text">账&emsp;号：</div>
                <input type="text" name="username">
            </label>
            <label>
                <div class="label-text">密&emsp;码：</div>
                <input type="password" name="password">
            </label>
            <label>
                <div class="label-text">邮&emsp;箱：</div>
                <input type="text" name="email">
            </label>
            <label>
                <div class="label-text">验证码：</div>
                <input type="text" name="validate" style="width: 100px"><img src="${pageContext.request.contextPath}/code/code" width="70px" height="30px"/>
            </label>
            <button type="submit">提 交</button>&emsp;
            <a href="${pageContext.request.contextPath}/login.jsp">去登录</a>
        </form>
    </div>
    <div id="footer">
        ABC@126.com
    </div>
</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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

        .modal.in{
             top:200px;
        }

    </style>
    <script type="text/javascript" >
        function test() {
            alert("1111111");
            $("#imgvcode").prop("src","${pageContext.request.contextPath}/code/code?r="+Math.random());
        }
        <!--错误信息模态框处理-->
        $(function () {
            <!--加载页面后获取错误信息-->
            var message = "${requestScope.message}";
            if(message != null && message != "") {
                $("#Imodal").modal("show");
            }
        });
        <!--页面定时时钟-->
        function ss() {
            setInterval(function () {
                $("#date").html("<fmt:formatDate value= '<%= new Date()%>' pattern='yyyy-MM-dd HH:mm:ss'/>");
            },2000)
        }
    </script>
</head>
<body onload="ss()">
<div id="wrap">
    <div id="header">
        <div style="float: right;padding-top: 29px" id="date">
            <fmt:formatDate value= '<%= new Date()%>' pattern='yyyy-MM-dd HH:mm:ss' />
        </div>
        <h1>旅游信息管理系统</h1>
    </div>
    <div id="header-bar"></div>
    <div id="content" style="height: 360px">
        <img src="${pageContext.request.contextPath}/img/timg.jpg" style="float: right;height: 320px">
        <h2>登录</h2><span style="color: crimson">${requestScope.message}</span>
        <form action="${pageContext.request.contextPath}/user/login" method="post">
        <br/>
            <label>
                <label>
                    <div class="label-text">账&emsp;号：</div>
                    <input type="text" name="username">
                </label>
                <label>
                    <div class="label-text">密&emsp;码：</div>
                    <input type="password" name="password">
                </label>
                <label>
                    <div class="label-text">验证码：</div>
                    <input type="text" name="validate" style="width: 100px"><img id="imgvcode" src="${pageContext.request.contextPath}/code/code" onclick="changeImage()" width="60px" height="30px"/>
                </label>
            <div class="btn-toolbar" role="toolbar">
                <div class="btn-group">
                    <a href="${pageContext.request.contextPath}/register.jsp">
                        <button type="button">去注册</button>
                    </a>&emsp;
                    <button type="submit">登陆</button>&emsp;
                </div>
            </div>
            </label>
        </form>
    </div>
    <div id="footer">
        ABC@126.com
    </div>
</div>

<!-- 错误信息模态框-->
<div id = "Imodal" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <div class="modal-body">
                <p>${requestScope.message}&hellip;</p>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>

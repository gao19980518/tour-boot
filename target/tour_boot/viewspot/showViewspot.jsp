<%--
  Created by IntelliJ IDEA.
  User: wyy
  Date: 2020/7/29
  Time: 15:17
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
        table{
            width: 100%;
            margin-bottom: 15px;
            border-collapse: collapse;
            table-layout: fixed;
        }
        th,td{
            border: 1px solid #CBD6DE;
            padding-left: 10px;
            line-height: 28px;
        }
        th{
            text-align: left;
            background: linear-gradient(#edf2f5,#dce9f2,#edf2f5);
            color:#467aa7;
        }
        tbody tr:nth-child(4n),tbody tr:nth-child(4n-1){
            background: #f2f2f2;
        }
        #pages{
            text-align: center;
            padding: 8px 0;
        }
        .page{
            min-width: 50px;
            display: inline-block;
        }
        .viewspotimg{
            width: 135px;
            height: 135px;
            margin-left: -10px;
            display: block;
            object-fit: cover;
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.3.min.js"></script>
    <script>
        function deleteV() {
            var msg="确认删除吗？";
            if(confirm(msg)==true){
                return true;
            }else{
                return false;
            }
        }
    </script>
</head>
<body>
<div id="wrap">
    <div id="header">
        <div style="float: right;padding-top: 24px">
            您好:${sessionScope.user.username}!&emsp;
            <a href="${pageContext.request.contextPath}/user/safeOut" style="color:#fff;float: right">安全退出</a>
        </div>
        <h1>旅游信息管理系统</h1>
    </div>
    <div id="header-bar"></div>
    <div id="content">
        <h2>景点列表</h2>
        <table>
            <thead>
            <tr>
                <th width="14%">ID</th>
                <th width="20%">景点</th>
                <th width="12%">印象图</th>
                <th width="16%">旺季时间</th>
                <th width="10%">旺季门票</th>
                <th width="10%">淡季门票</th>
                <th width="18%">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="v" items="${requestScope.list}">

                <tr>
                    <td rowspan="2">${v.vid}</td>
                    <td rowspan="2">${v.vname}</td>
                    <td><img src="${pageContext.request.contextPath}/img/${v.picture}" class="viewspotimg"></td>
                    <td>${v.hottime}</td>
                    <td>￥${v.hotprice}</td>
                    <td>￥${v.normalprice}</td>
                    <td style="text-align: center">
                        <a href="${pageContext.request.contextPath}/view/delete?vid=${v.vid}&pid=${v.province.pid}" onclick="return deleteV()">删除景点</a><br>
                        <a href="${pageContext.request.contextPath}/view/queryOne?vid=${v.vid}">修改景点</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div style="height: 56px;font-size: 14px;line-height: normal">
                            <b style="color:#467aa7">简介：</b>${v.synopsis}
                        </div>
                    </td>
                </tr>

            </c:forEach>
        </table>
        <a href="${pageContext.request.contextPath}/province/queryAll"><button type="button">添加景点</button></a>&emsp;
        <a href="${pageContext.request.contextPath}/province/queryPage">返回省份列表</a>
        <div id="pages">
            <c:choose>
                <c:when test="${requestScope.currentPage>1}">
                    <a href="${pageContext.request.contextPath}/view/queryPage?currentPage=${requestScope.currentPage-1}&pid=${sessionScope.pid}" class="page">&lt;上一页</a>
                </c:when>
                <c:otherwise>
                    <a href="javascript:void(0)"> 上一页</a>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="1" end="${requestScope.totalPage}" var="i">
                <c:choose>
                    <c:when test="${requestScope.currentPage==i}">
                        <a href="${pageContext.request.contextPath}/view/queryPage?currentPage=${i}&pid=${sessionScope.pid}" class="page"><span style="color: crimson">${i}</span></a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/view/queryPage?currentPage=${i}&pid=${sessionScope.pid}" class="page">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${requestScope.currentPage<totalPage}">
                    <a href="${pageContext.request.contextPath}/view/queryPage?currentPage=${requestScope.currentPage+1}&pid=${sessionScope.pid}" class="page">下一页&gt;</a>
                </c:when>
                <c:otherwise>
                    <a href="javascript:void(0)">下一页</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <div id="footer">
        ABC@126.com
    </div>
</div>
</body>
</html>

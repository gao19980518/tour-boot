<%--
  Created by IntelliJ IDEA.
  User: wyy
  Date: 2020/7/29
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
        tbody tr:nth-child(even){
            background: #f2f2f2;
        }
        #pages{
            text-align: center;
            padding-top: 8px;
        }
        .page{
            min-width: 50px;
            display: inline-block;
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.3.min.js"></script>
    <script>
        function deleteP(){
            var msg = "您真的确定要删除吗？";
            if (confirm(msg)==true){
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
    <div id="content" style="height: 360px">
        <h2>省份列表</h2>
        <table>
            <thead>
            <tr>
                <th width="15%">ID</th>
                <th width="20%">省份</th>
                <th width="25%">标签</th>
                <th width="15%">景点个数</th>
                <th width="25%">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="p" items="${requestScope.list}">
                <tr>
                    <td>${p.pid}</td>
                    <td>${p.pname}</td>
                    <td>${p.ptag}</td>
                    <td>${p.count}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/province/delete?pid=${p.pid}"  onclick="return deleteP()">删除省份</a>
                        <a href="${pageContext.request.contextPath}/view/queryPage?pid=${p.pid}">景点列表</a>
                        <a href="${pageContext.request.contextPath}/province/queryOne?pid=${p.pid}">修改省份</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/province/addProvince.jsp">
            <button type="button">添加省份</button>
        </a>
        <div id="pages">
            <c:choose>
                <c:when test="${requestScope.currentPage>1}">
                    <a href="${pageContext.request.contextPath}/province/queryPage?currentPage=${requestScope.currentPage-1}" class="page">&lt;上一页</a>
                </c:when>
                <c:otherwise>
                    <a href="javascript:void(0)"> 上一页</a>
                </c:otherwise>
            </c:choose>
                <c:forEach begin="1" end="${requestScope.totalPage}" var="i">
                    <c:choose>
                        <c:when test="${requestScope.currentPage==i}">
                            <a href="${pageContext.request.contextPath}/province/queryPage?currentPage=${i}" class="page"><span style="color: crimson">${i}</span></a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/province/queryPage?currentPage=${i}" class="page">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${requestScope.currentPage<totalPage}">
                        <a href="${pageContext.request.contextPath}/province/queryPage?currentPage=${requestScope.currentPage+1}" class="page">下一页&gt;</a>
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

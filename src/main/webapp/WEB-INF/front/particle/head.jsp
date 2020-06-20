<%--
  Created by IntelliJ IDEA.
  User: 11469
  Date: 2020/5/21
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">

<head>
    <script src="<%=basePath%>/static/js/jquery-3.3.1.min.js" charset="utf-8"></script>
    <script type="text/javascript">
        function loginMenu() {
            layer.open({
                type: 2,
                title: '用户登录',
                maxmin: true,
                skin: 'layui-layer-lan',
                shadeClose: true, //点击遮罩关闭层
                area : ['400px' , '500px'],
                content:'<%=basePath%>/login'//弹框显示的url
            });
        }
        function logout() {
            $.ajax({
                url: '<%=basePath%>/userLogout',
                type: 'post',
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
            });
            top.location.reload();
        }
</script>
</head>
<body>
<nav class="blog-nav layui-header">
    <div class="layui-container">
        <c:if test="${sessionScope.visitor != null}">
        <!-- 登陆后 -->
         <span class="blog-user">
            <a href="javascript:void(0);" onclick="logout();" title="点击退出">
               <strong> ${sessionScope.visitor}</strong>
            </a>
        </span>
        </c:if>
        <c:if test="${sessionScope.visitor == null}">
        <!-- 未登陆 -->
        <a  class="blog-user"  href="javascript:void(0);" onclick="loginMenu()">
            <i class="fa fa-qq"></i>
        </a>
        </c:if>
        <a class="blog-logo" href="/">年轮博客</a>
        <ul class="blog-nav-list" lay-filter="nav">
            <li class="layui-nav-item">
                <a href="/"><i class="fa fa-home fa-fw"></i>&nbsp;网站首页</a>
            </li>
            <li class="layui-nav-item">
                <a href="/articlelist"><i class="fa fa-book fa-fw"></i>&nbsp;学海无涯</a>
            </li>
            <li class="layui-nav-item">
                <a href="/timeline"><i class="fa fa-snowflake-o fa-fw"></i>&nbsp;点点滴滴</a>
            </li>
            <li class="layui-nav-item">
                <a href="/production"><i class="fa fa-th-large fa-fw"></i>&nbsp;个人作品</a>
            </li>
            <li class="layui-nav-item">
                <a href="/comment"><i class="fa fa-comments fa-fw"></i>&nbsp;留言交流</a>
            </li>
            <li class="layui-nav-item">
                <a href="/about"><i class="fa fa-info fa-fw"></i>&nbsp;关于本站</a>
            </li>
        </ul>
        <a class="blog-navicon" href="javascript:;">
            <i class="fa fa-navicon"></i>
        </a>
    </div>
</nav>
</body>
</html>

<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人作品 -年轮博客</title>
    <!-- 有些资源用不上，请自行斟酌 -->
    <link rel="stylesheet" href="<%=basePath%>/static/lib/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>/static/lib/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="<%=basePath%>/static/css/site.css">
    <link rel="stylesheet" href="<%=basePath%>/static/css/site-animate.css">
    <link rel="stylesheet" href="<%=basePath%>/static/css/site-media.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/animate.css/3.5.2/animate.min.css" />
    <link rel="stylesheet" href="<%=basePath%>/static/css/blog-pace.css" />
    <script data-pace-options='{ "ajax": false ,"eventLag": false}' src="<%=basePath%>/static/js/pace.min.js"></script>
    <script src="<%=basePath%>/static/lib/layui/layui.js"></script>
    <!-- 本页特有样式 -->
    <style>
        .production-box {
            background-color: #fff;
            -moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.18);
            -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.18);
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.18);
        }

        .production-cover {
            padding: 3px;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            border-bottom: 1px solid #e2e2e2;
        }

        .production-cover img {
            width: 100%;
        }

        .production-title {
            text-align: center;
            margin-top: 7px;
            margin-bottom: 5px;
        }

        .production-title>a {
            font-size: 16px;
            font-weight: bold;
            line-height: 18px;
            color: #01AAED;
        }

        .production-abstract {
            padding: 3px;
            text-align: center;
            font-size: smaller;
            color: #838383;
            height: 25px;
            overflow: hidden;
        }

        .production-footer {
            font-size: small;
            border-top: 1px solid #e7e7e7;
            box-shadow: 0 1px 0 0 #fff inset;
            color: #8B8B8C;
            height: 50px;
            line-height: 50px;
            text-align: center;
        }

        .production-footer i {
            font-size: 12px !important;
        }
    </style>
</head>

<body>
<!-- 头部 -->
<%@ include file="particle/head.jsp"%>
    <!-- 主体 -->
    <div class="blog-body">
        <!-- 页面主体内容 -->
        <div class="layui-container">
            <blockquote class="layui-elem-quote sitemap shadow">
                <i class="layui-icon">&#xe715;</i>
                <span class="layui-breadcrumb" lay-separator=">">
                    <a href="/">首页</a>
                    <a><cite>个人作品</cite></a>
                </span>
            </blockquote>
            <div class="layui-row layui-col-space15">
                    <div class="layui-col-lg3 layui-col-sm4">
                        <div class="production-box">
                            <div class="production-cover">
                                <a href="#" target="">
                                    <img src="<%=basePath%>/static/images/prd.jpg" alt="博客文章用户管理系统">
                                </a>
                            </div>
                            <h1 class="production-title"><a href="#" target="">博客文章用户管理系统</a></h1>
                            <p class="production-abstract">基于ssm搭建的管理系统</p>
                            <div class="production-footer">
                                <a class="layui-btn layui-btn-sm layui-btn-primary" href="#" target=""><i class="fa fa-eye fa-fw"></i>查看</a>
                                <a class="layui-btn layui-btn-sm layui-btn-primary" target=""><i class="fa fa-download fa-fw"></i>下载</a>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-lg3 layui-col-sm4">
                        <div class="production-box">
                            <div class="production-cover">
                                <a href="#" target="">
                                    <img src="<%=basePath%>/static/images/prd2.jpg" alt="年轮博客">
                                </a>
                            </div>
                            <h1 class="production-title"><a href="#" target="_blank">年轮博客</a></h1>
                            <p class="production-abstract">基于ssm搭建的年轮博客</p>
                            <div class="production-footer">
                                <a class="layui-btn layui-btn-sm layui-btn-primary" href="#" target=""><i class="fa fa-eye fa-fw"></i>查看</a>
                                <a class="layui-btn layui-btn-sm layui-btn-primary" target=""><i class="fa fa-download fa-fw"></i>下载</a>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
<!-- 底部 -->
<%@ include file="particle/foot.jsp"%>
<!-- 移动端侧边导航 -->
<%@include file="particle/phone.jsp"%>
<!-- 侧边导航遮罩 -->
    <div class="blog-mask animated layui-hide"></div>

    <script src="https://cdn.bootcss.com/scrollReveal.js/3.3.6/scrollreveal.js"></script>
    <script src="<%=basePath%>/static/js/site.js"></script>
</body>

</html>
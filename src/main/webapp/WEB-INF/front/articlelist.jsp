<%--
  Created by IntelliJ IDEA.
  User: 11469
  Date: 2020/5/21
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
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
    <title>学海无涯 -年轮博客</title>
    <link rel="stylesheet" href="../static/lib/layui/css/layui.css">
    <link rel="stylesheet" href="../static/lib/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="../static/css/site.css">
    <link rel="stylesheet" href="../static/css/site-animate.css">
    <link rel="stylesheet" href="../static/css/site-media.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/animate.css/3.5.2/animate.min.css"/>
    <link rel="stylesheet" href="../static/css/blog-pace.css"/>
    <script data-pace-options='{ "ajax": false ,"eventLag": false}' src="../static/js/pace.min.js"></script>
    <script src="../static/lib/layui/layui.js"></script>
    <style>
        @media (max-width: 768px) {
            .layui-hide-xs {
                display: none !important;
            }
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
            <i class="layui-icon"></i>
            <span class="layui-breadcrumb" lay-separator=">" style="visibility: visible;">
                    <a href="/">首页</a><span lay-separator="">&gt;</span>
                    <a><cite>学海无涯</cite></a>
                </span>
        </blockquote>
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md8">
                <div class="left-box">
                    <p class="left-box-title shadow"><i class="fa fa-cog fa-spin fa-fw" aria-hidden="true"></i>全部文章
                    </p>
                    <c:forEach items="${page.list}" var="article">
                    <div class="article shadow clearfix">
<%--                        <div class="article-left">--%>
<%--                            <img src="../static/images/cover/201708252044567037.jpg"--%>
<%--                                 alt="${article.r_summary}" layer-index="0">--%>
<%--                        </div>--%>
                        <div class="article">
                            <div class="article-title">
                                <a href="detail/${article.r_id}">${article.r_summary}</a>
                            </div>
<%--                            <div class="article-abstract">--%>
<%--                                    ${article.r_content}--%>
<%--                            </div>--%>
                            <div class="article-footer">
                                    <span class="layui-hide-xs"><i class="fa fa-tag" aria-hidden="true"></i>&nbsp;<a
                                            style="color:#009688" href="#">JAVA</a></span>
                                <span><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;${article.r_date}</span>
                                <span class="article-viewinfo">4阅</span>
                                <span class="article-viewinfo">0评</span>
                                <span class="article-viewinfo">0赞</span>
                                <a class="read layui-btn layui-btn-xs layui-btn-normal layui-hide-xs"
                                   href="detail/${article.r_id}" title="阅读全文：${article.r_summary}">阅读全文</a>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
<%--                <div class="blog-pagebox">--%>
<%--                    <div class="laypage-main">--%>
<%--                        <span class="laypage-curr">1</span>--%>
<%--                        <a href="#">2 </a>--%>
<%--                        <a href="#">3 </a>--%>
<%--                        <a href="#" class="laypage-next">下一页</a>--%>
<%--                    </div>--%>
<%--                </div>--%>

            </div>
            <div class="layui-col-md4">
                <div class="layui-row layui-col-space10">
                    <div class="layui-col-sm6 layui-col-md12 layui-hide-xs layui-hide-sm">
                        <div class="blog-search">
                            <form class="layui-form" action="">
                                <div class="layui-form-item">
                                    <div class="search-keywords  shadow">
                                        <input type="text" name="keywords" lay-verify="required"
                                               placeholder="输入关键词搜索" autocomplete="off" class="layui-input">
                                    </div>
                                    <div class="search-submit  shadow">
                                        <a class="search-btn" lay-submit="formSearch" lay-filter="formSearch"><i
                                                class="fa fa-search"></i></a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="layui-col-sm6 layui-col-md12 padding0">
                        <div class="article-category shadow">
                            <div class="article-category-title">分类导航</div>
                            <a href="#">.NET Core</a>
                            <a href="#">Web前端</a>
                            <a href="#">C#基础</a>
                            <a href="#">杂文随笔</a>
                            <a href="#">网站管理</a>
                            <a href="#">开发工具</a>
                            <a href="#">微信小程序</a>
                            <a href="#">Xamarin</a>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="layui-col-sm6 layui-col-md12">
                        <div class="blog-card shadow sr-rightmodule">
                            <div class="blog-card-title">
                                <span class="icon"><i class="layui-icon" aria-hidden="true">&#xe6c6;</i></span>
                                <span class="text">最近发布</span>
                            </div>
                            <ul class="blog-card-ul">
                                <c:forEach var="article" items="${articles}"  varStatus="status" end="2" begin="0" >
                                    <li>
                                        <span class="layui-badge">${status.index+1}</span><a href="/detail/${article.r_id}"
                                                                                             title="${article.r_summary}">${article.r_summary}</a>
                                    </li>
                                </c:forEach>
                                <c:forEach var="article" items="${articles}" varStatus="status" end="7" begin="3">
                                    <li>
                                        <span class="layui-badge layui-bg-blue">${status.index+1}</span><a
                                            href="/detail/${article.r_id}"
                                            title="${article.r_summary}">${article.r_summary}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--右边悬浮 平板或手机设备显示-->
                <div class="category-toggle"><i class="fa fa-chevron-left"></i></div>
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
<script src="../static/js/site.js"></script>
</body>
</html>
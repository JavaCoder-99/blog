
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
    <title>点点滴滴 -年轮博客</title>
    <link rel="stylesheet" href="<%=basePath%>/static/lib/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>/static/lib/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="<%=basePath%>/static/css/site.css">
    <link rel="stylesheet" href="<%=basePath%>/static/css/site-animate.css">
    <link rel="stylesheet" href="<%=basePath%>/static/css/site-media.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/animate.css/3.5.2/animate.min.css" />
    <link rel="stylesheet" href="<%=basePath%>/static/css/blog-pace.css" />
    <script data-pace-options='{ "ajax": false ,"eventLag": false}' src="<%=basePath%>/static/js/pace.min.js"></script>
    <script src="<%=basePath%>/static/lib/layui/layui.js"></script>
    <!-- 本页特有css -->
    <link rel="stylesheet" href="<%=basePath%>/static/css/timeline.css">
    <!-- 本页特有js -->
    <script src="<%=basePath%>/static/js/modernizr.js"></script>
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
                    <a><cite>轻言细语</cite></a>
                </span>
            </blockquote>
            <div class="blog-panel">
                <section id="cd-timeline" class="cd-container">
                    <div class="cd-timeline-block">
                        <div class="cd-timeline-img cd-picture">
                            <img src="<%=basePath%>/static/images/cd-icon-picture.svg" alt="Location">
                        </div>
                        <div class="cd-timeline-content">
                            <p>年轮博客基础功能完成</p>
                            <span class="cd-date">2020-5-22</span>
                        </div>
                    </div>
                    <div class="cd-timeline-block">
                        <div class="cd-timeline-img cd-movie">
                            <img src="<%=basePath%>/static/images/cd-icon-movie.svg" alt="Location">
                        </div>
                        <div class="cd-timeline-content">
                            <p>年轮博客开始动工</p>
                            <span class="cd-date">2020-5-21</span>
                        </div>
                    </div>
                    <div class="cd-timeline-block">
                        <div class="cd-timeline-img cd-location">
                            <img src="<%=basePath%>/static/images/cd-icon-location.svg" alt="Location">
                        </div>
                        <div class="cd-timeline-content">
                            <p>博客文章用户管理系统安全校验完善</p>
                            <span class="cd-date">2020-5-21</span>
                        </div>
                    </div>
                    <div class="cd-timeline-block">
                        <div class="cd-timeline-img cd-movie">
                            <img src="<%=basePath%>/static/images/cd-icon-location.svg" alt="Location">
                        </div>
                        <div class="cd-timeline-content">
                            <p>博客文章用户管理系统基础功能完成</p>
                            <span class="cd-date">2020-5-20</span>
                        </div>
                    </div>
                    <div class="cd-timeline-block">
                        <div class="cd-timeline-img cd-picture">
                            <img src="<%=basePath%>/static/images/cd-icon-picture.svg" alt="Location">
                        </div>
                        <div class="cd-timeline-content">
                            <p>博客文章用户管理系统开始动工</p>
                            <span class="cd-date">2020-5-20</span>
                        </div>
                    </div>
                </section>
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
    <!-- 本页特有js -->
    <script>
        layui.use('jquery', function () {
            var $ = layui.jquery;
            $(function () {
                var $timeline_block = $('.cd-timeline-block');
                $timeline_block.each(function () {
                    if ($(this).offset().top > $(window).scrollTop() + $(window).height() *
                        0.75) {
                        $(this).find('.cd-timeline-img, .cd-timeline-content').addClass(
                            'is-hidden');
                    }
                });
                //时光轴根据滚动条动画展示
                $(window).on('scroll', function () {
                    $timeline_block.each(function () {
                        if ($(this).offset().top <= $(window).scrollTop() + $(window)
                            .height() * 0.75 && $(this).find('.cd-timeline-img')
                            .hasClass('is-hidden')) {
                            $(this).find('.cd-timeline-img, .cd-timeline-content')
                                .removeClass('is-hidden').addClass('bounce-in');
                        }
                    });
                });
            });
        });
    </script>
</body>

</html>
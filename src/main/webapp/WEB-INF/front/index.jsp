<%--
  Created by IntelliJ IDEA.
  User: 11469
  Date: 2020/5/21
  Time: 4:57
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
    <title>年轮博客</title>
    <link rel="stylesheet" href="${basePath}/static/lib/layui/css/layui.css">
    <link rel="stylesheet" href="${basePath}/static/lib/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="${basePath}/static/css/site.css">
    <link rel="stylesheet" href="${basePath}/static/css/site-animate.css">
    <link rel="stylesheet" href="${basePath}/static/css/site-media.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/animate.css/3.5.2/animate.min.css"/>
    <link rel="stylesheet" href="${basePath}/static/css/blog-pace.css"/>
    <script data-pace-options='{ "ajax": false ,"eventLag": false}' src="${basePath}/static/js/pace.min.js"></script>
    <script src="${basePath}/static/lib/layui/layui.js"></script>
    <style>
        .remark-list {
            min-height: 445px;
        }

        .remark-list li {
            position: relative;
            min-height: 50px;
            margin: 5px 0;
        }

        .remark-list li .user-avator {
            padding: 2px;
            border: 1px solid #ddd;
            position: absolute;
        }

        .remark-list li .remark-content {
            margin-left: 60px;
            border: 1px solid #efefef;
            height: 46px;
            padding: 5px 8px;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            font-size: 12px;
            overflow: hidden;
            line-height: 18px;
            background-color: #efefef;
            color: #666;
        }

        .remark-list li .remark-content::after {
            content: "";
            border: 10px solid rgba(255, 255, 255, 0.00);
            border-bottom: 8px solid rgba(255, 255, 255, 0.00);
            border-top: 8px solid rgba(255, 255, 255, 0.00);
            border-right-color: #efefef;
            position: absolute;
            top: 12px;
            left: 42px;
            display: block;
        }
    </style>
</head>

<body>
<!-- 头部 -->
<%@ include file="particle/head.jsp"%>
<!-- 主体 -->
<div class="blog-body">
    <!-- 首页内容 -->
    <div class="layui-container">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="home-tips shadow">
                    <i style="float:left;line-height:17px;" class="fa fa-volume-up"></i>
                    <div class="home-tips-container">
                        <span style="color: red">欢迎到访年轮博客</span>
                    </div>
                </div>
            </div>
            <!--左边文章列表-->
            <div class="layui-col-md8">
                <div class="left-box shadow" style="padding:5px;background-color:#fff;">
                    <!-- 此处Banner宽度需要根据Banner数量来动态设置，容器宽度为100*数量（%），Banner宽度为1/数量*100（%） -->
                    <div class="carousel-box" style="position:relative;background-color: #fff;overflow:hidden">
                        <div style="width:200%" class="banner">
                            <ul>
                                <li style="width:50%">
                                    <a href="#">
                                        <img src="<%=basePath%>/static/images/carousel/life-code-typography-hd-wallpaper-2560x1600-7168.jpg"/>
<%--                                        <p>年轮博客2.0上线</p>--%>
                                    </a>
                                </li>
                                <li style="width:50%">
                                    <a href="#">
                                        <img src="<%=basePath%>/static/images/carousel/wallpaper.png"/>
<%--                                        <p>年轮博客2.0上线</p>--%>
                                    </a>
                                </li>
                                <li style="width:50%">
                                    <a href="#">
                                        <img src="<%=basePath%>/static/images/carousel/4781442-d6a8c2e5714b4c44.png"/>
<%--                                        <p>年轮博客2.0上线</p>--%>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="left-box">
                    <p class="left-box-title shadow sr-listshow"><i class="fa fa-signal fa-fw"
                                                                    aria-hidden="true"></i>最新博文
                    </p>
                    <!-- 没有数据 -->
                    <!-- <div class="emptybox shadow">
                            <p><i style="font-size:50px;color:#5fb878" class="layui-icon">&#xe69c;</i></p>
                            <p>暂时没有任何数据</p>
                    </div> -->
                    <c:forEach items="${page.list}" var="article">
                        <div class="article shadow clearfix sr-listshow">
<%--                            <div class="article-left">--%>
<%--                                <img src="<%=basePath%>/static/images/cover/201705102148110621.jpg"--%>
<%--                                     alt="${article.r_summary}"/>--%>
<%--                            </div>--%>
                            <div class="article">
                                <div class="article-title">
                                    <a href="detail/${article.r_id}">${article.r_summary}</a>
                                </div>
<%--                                <div class="article-abstract">--%>
<%--                                        ${article.r_content}--%>
<%--                                </div>--%>
                                <div class="article-footer">
                                    <span class="layui-hide-xs"><i class="fa fa-tag" aria-hidden="true"></i>&nbsp;<a
                                            style="color:#009688" href="#">JAVA
                                            </a></span>
                                    <span><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;${article.r_date}</span>
                                    <span class="article-viewinfo">${article.r_views}阅读</span>
                                    <span class="article-viewinfo">${article.r_words}评论</span>
                                    <span class="article-viewinfo">${article.r_goods}赞</span>
                                    <a class="read layui-btn layui-btn-xs layui-btn-normal layui-hide-xs"
                                       href="detail/${article.r_id}" title="阅读全文：${article.r_summary}">阅读全文</a>
                                </div>
<%--                                <div class="flag flag-left">推荐</div>--%>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <%--                <div class="left-box">--%>
                <%--                    <p class="left-box-title shadow"><i class="fa fa-diamond fa-fw" aria-hidden="true"></i>置顶博文</p>--%>
                <%--                    <!-- 没有数据 -->--%>
                <%--                    <!-- <div class="emptybox shadow">--%>
                <%--                            <p><i style="font-size:50px;color:#5fb878" class="layui-icon">&#xe69c;</i></p>--%>
                <%--                            <p>暂时没有任何数据</p>--%>
                <%--                    </div> -->--%>
                <%--                    <div class="article shadow clearfix sr-listshow">--%>
                <%--                        <div class="article-left">--%>
                <%--                            <img src="<%=basePath%>/static/images/cover/201708252044567037.jpg" alt=".NET Core 3.0正式版发布" />--%>
                <%--                        </div>--%>
                <%--                        <div class="article-right">--%>
                <%--                            <div class="article-title">--%>
                <%--                                <a href="detail">.NET Core 3.0正式版发布</a>--%>
                <%--                            </div>--%>
                <%--                            <div class="article-abstract">--%>
                <%--                                今天凌晨微软在.NET Conf上正式发布了.NET Core 3.0，2018年12月4日，微软推出首个预览版.NET Core 3.0--%>
                <%--                                Preview1，时至今日，.NET Core 3.0正式版终于发布！--%>
                <%--                            </div>--%>
                <%--                            <div class="article-footer">--%>
                <%--                                    <span class="layui-hide-xs"><i class="fa fa-tag" aria-hidden="true"></i>&nbsp;<a--%>
                <%--                                            style="color:#009688" href="">.NET--%>
                <%--                                            Core</a></span>--%>
                <%--                                <span><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;2019-9-24</span>--%>
                <%--                                <span class="article-viewinfo">99阅读</span>--%>
                <%--                                <span class="article-viewinfo">66评论</span>--%>
                <%--                                <span class="article-viewinfo">8赞</span>--%>
                <%--                                <a class="read layui-btn layui-btn-xs layui-btn-normal layui-hide-xs"--%>
                <%--                                   href="detail" title="阅读全文：.NET Core 3.0正式版发布">阅读全文</a>--%>
                <%--                            </div>--%>
                <%--                            <div class="flag flag-left">推荐</div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>
            <!--右边小栏目-->
            <div class="layui-col-md4">
                <div class="layui-row layui-col-space10">
                    <div class="layui-col-sm12 layui-col-md12">
                        <div class="blogerinfo shadow">
                            <div class="blogerinfo-figure">
                                <img src="<%=basePath%>/static/images/NL.png" alt="NL"/>
                            </div>
                            <div class="blogerinfo-info">
                                <p class="blogerinfo-nickname">年轮</p>
                                <p class="blogerinfo-introduce">一枚90后程序员，JAVA后端开发程序员。</p>
                                <p class="blogerinfo-location"><i class="fa fa-location-arrow"></i>&nbsp;湖南 - 衡阳</p>
                            </div>
                            <div class="blogerinfo-contact">
                                <a target="_blank" title="QQ交流"
                                   href="http://wpa.qq.com/msgrd?v=3&uin=1146965132&site=qq&menu=yes"><i
                                        class="fa fa-qq fa-2x"></i></a>
                                <a target="_blank" title="给我写信"
                                   href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=1146965132@qq.com"
                                   style="text-decoration:none;"><i class="fa fa-envelope fa-2x"></i></a>
                                <a target="_blank" title="新浪微博" href="http://weibo.com/u/5616521567?is_all=1"><i
                                        class="fa fa-weibo fa-2x"></i></a>
                                <a target="_blank" title="GitHub" href="http://www.github.com/SweeperNL"><i
                                        class="fa fa-github fa-2x"></i></a>
                            </div>
                            <div class="bloginfo-statistics">
                                <div class="item">
                                    <span>${page.total}</span>
                                    <p>博文</p>
                                </div>
                                <div class="item">
                                    <span>${wordsNum}</span>
                                    <p>评论</p>
                                </div>
                                <div class="item">
                                    <span>${replyNum}</span>
                                    <p>回复</p>
                                </div>
                                <div class="item">
                                    <span>12</span>
                                    <p>留言</p>
                                </div>
                            </div>
                            <div class="bloginfo-runtime">博客已运行<span style="margin-left:4px;">2天14时17分38秒</span>
                            </div>
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
                    <div class="layui-col-sm6 layui-col-md12">
                        <div class="blog-card shadow sr-rightmodule">
                            <div class="blog-card-title">
                                <span class="icon"><i class="layui-icon" aria-hidden="true">&#xe611;</i></span>
                                <span class="text">最新评论</span>
                            </div>
                            <ul class="blog-card-padding remark-list">
                                <c:forEach items="${words}" var="word">
                                    <li>
                                        <div data-name="${word.lw_name}" class="user-avator remark-user-avator">
                                            <img src="http://thirdqq.qlogo.cn/g?b=oidb&amp;k=kzyk1Jw1egqJAWuL5P3Mrg&amp;s=40"
                                                 alt="${word.lw_name}">
                                        </div>
                                        <a title="点击查看" href="/detail/${word.lw_for_article_id}">
                                            <div class="remark-content">
                                                <p>${word.lw_content}</p>
                                            </div>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="layui-col-sm6 layui-col-md12">
                        <div class="blog-card shadow sr-rightmodule" data-scroll-reveal>
                            <div class="blog-card-title">
                                <span class="icon"><i class="layui-icon" aria-hidden="true">&#xe64c;</i></span>
                                <span class="text">友情链接</span>
                            </div>
                            <ul class="blogroll">
                                <li><a target="_blank" href="http://www.google2015.cn" title="苦逼外包的博客">年轮网络</a></li>
                                <li><a target="_blank" href="http://www.xuyinyin.cn" title="大数据工程师的博客">梦洛河</a></li>
                            </ul>
                            </div>
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
<script src="<%=basePath%>/static/js/homepage.js"></script>
</body>

</html>
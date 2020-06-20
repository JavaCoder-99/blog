<%--
  Created by IntelliJ IDEA.
  User: 11469
  Date: 2020/5/21
  Time: 20:40
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
    <!-- 有些资源用不上，请自行斟酌 -->
    <link rel="stylesheet" href="${basePath}/static/lib/layui/css/layui.css">
    <link rel="stylesheet" href="${basePath}/static/lib/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="${basePath}/static/css/site.css">
    <link rel="stylesheet" href="${basePath}/static/css/site-animate.css">
    <link rel="stylesheet" href="${basePath}/static/css/site-media.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/animate.css/3.5.2/animate.min.css"/>
    <link rel="stylesheet" href="${basePath}/static/css/blog-pace.css"/>
    <script data-pace-options='{ "ajax": false ,"eventLag": false}' src="${basePath}/static/js/pace.min.js"></script>
    <script src="${basePath}/static/lib/layui/layui.js"></script>
    <!-- 本页特有css -->
    <link rel="stylesheet" href="${basePath}/static/css/about.css">
</head>

<body>
<!-- 头部 -->
<%@ include file="particle/head.jsp"%>
<!-- 主体 -->
<div class="blog-body">
    <!-- 页面主体内容 -->
    <div class="layui-container">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-xs12">
                <blockquote class="layui-elem-quote sitemap shadow" style="margin-bottom:0px;">
                    <i class="layui-icon">&#xe715;</i>
                    <span class="layui-breadcrumb" lay-separator=">">
                            <a href="/">首页</a>
                            <a><cite>关于本站</cite></a>
                        </span>
                </blockquote>
            </div>
            <div class="layui-col-xs12">
                <ul class="blog-nav-follow">
                    <li class="current"><a href="#author">关于作者</a></li>
                    <li><a href="#site">关于网站</a></li>
                    <li><a href="#friend">友情链接</a></li>
                    <li><a href="#reward">小额赞赏</a></li>
                </ul>
                <div class="blog-about-container">
                    <span id="author" class="anchor"></span>
                    <div class="section">
                        <div class="section-title">
                            <span class="layui-badge">关于作者</span>
                        </div>
                        <div class="section-content">
                            <div class="author-bg">
                                <div class="bg-box">
                                    <img class="bg" src="${basePath}/static/images/about_bg4.jpg"/>
                                    <div class="mask"></div>
                                </div>
                                <div class="author-intro">
                                    <img src="${basePath}/static/images/NL.png" alt="年轮"/>
                                    <h2>年轮</h2>
                                    <h4>99年生人，JAVA后端开发程序员，略懂前端。</h4>
                                </div>
                            </div>
                            <div class="text-content">
                                <p>年轮，是一名JAVA后端开发程序员。创建本站纯属练手，同时记录自己学习过程，并与大家分享交流。</p>
                                <br/>
                                <p>出生于湖南衡阳，现居衡阳，虽然衡阳是一座非常棒的城市，但是我喜欢到处旅行，对别的城市也是非常向往。</p>
                                <p style="text-align:right;padding-right:5px;font-size:24px;font-family:Cambria">——
                                    By 年轮</p>
                            </div>
                        </div>
                    </div>
                    <span id="site" class="anchor"></span>
                    <div class="section">
                        <div class="section-title">
                            <span class="layui-badge">关于网站</span>
                        </div>
                        <div class="section-content">
                            <div class="author-bg">
                                <div class="bg-box">
                                    <img class="bg" src="${basePath}/static/images/about_bg2.jpg"/>
                                    <div class="mask"></div>
                                </div>
                                <div class="author-intro">
                                    <img src="${basePath}/static/images/global/Logo_100.png" alt="年轮博客"/>
                                    <h2>年轮博客</h2>
                                    <h4>年轮个人博客，记录成长，分享技术！</h4>
                                </div>
                            </div>
                            <div class="text-content">
                                <p>年轮博客是纯手工打造，非第三方建站程序制作的网站，它后端程序使用的是SSM框架+Mybatis
                                    ，前端则是Layui主导加各种插件组合而成。</p>
                            </div>
                        </div>
                    </div>
                    <span id="friend" class="anchor"></span>
                    <div class="section">
                        <div class="section-title">
                            <span class="layui-badge">友情链接</span>
                        </div>
                        <div class="section-content">
                            <div class="author-bg">
                                <div class="bg-box">
                                    <img class="bg" src="${basePath}/static/images/about_bg3.jpg"/>
                                    <div class="mask"></div>
                                </div>
                                <div class="author-intro">
                                    <img src="${basePath}/static/images/global/handshake.png" alt="友链互换"/>
                                    <h2>友链互换</h2>
                                    <h4>
                                        <i class="fa fa-close"></i>经常宕机&nbsp;
                                        <i class="fa fa-close"></i>不合法规&nbsp;
                                        <span class="layui-hide-xs"><i class="fa fa-close"></i>插边球站&nbsp;</span>
                                        <span class="layui-hide-xs"><i class="fa fa-close"></i>红标报毒&nbsp;</span>
                                        <i class="fa fa-check"></i>原创优先&nbsp;
                                        <i class="fa fa-check"></i>技术优先
                                    </h4>
                                </div>
                            </div>
                            <div class="layui-row layui-col-space15" style="margin-top:5px;">
                                <div class="layui-col-lg3 layui-col-md4 layui-col-sm6">
                                    <a href="http://www.google2015.cn/" target="_blank" class="friendlink-item">
                                        <img src="<%=basePath%>/static/images/global/Logo_100.png" alt="年轮博客"/>
                                        <h2>年轮博客</h2>
                                        <p>google2015.cn</p>
                                    </a>
                                </div>
                                <div class="layui-col-lg3 layui-col-md4 layui-col-sm6">
                                    <a href="http://www.google2015.cn/" target="_blank" class="friendlink-item">
                                        <img src="<%=basePath%>/static/images/global/Logo_100.png" alt="年轮博客"/>
                                        <h2>年轮博客</h2>
                                        <p>google2015.cn</p>
                                    </a>
                                </div>
                                <div class="layui-col-lg3 layui-col-md4 layui-col-sm6">
                                    <a href="http://www.google2015.cn/" target="_blank" class="friendlink-item">
                                        <img src="<%=basePath%>/static/images/global/Logo_100.png" alt="年轮博客"/>
                                        <h2>年轮博客</h2>
                                        <p>google2015.cn</p>
                                    </a>
                                </div>
                                <div class="layui-col-lg3 layui-col-md4 layui-col-sm6">
                                    <a href="http://www.google2015.cn/" target="_blank" class="friendlink-item">
                                        <img src="<%=basePath%>/static/images/global/Logo_100.png" alt="年轮博客"/>
                                        <h2>年轮博客</h2>
                                        <p>google2015.cn</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <span id="reward" class="anchor"></span>
                    <div class="section">
                        <div class="section-title">
                            <span class="layui-badge">小额赞赏</span>
                        </div>
                        <div class="section-content">
                            <div class="author-bg">
                                <div class="bg-box">
                                    <img class="bg" src="${basePath}/static/images/about_bg1.jpg"/>
                                    <div class="mask"></div>
                                </div>
                                <div class="author-intro">
                                    <img src="${basePath}/static/images/global/reword.jpg" alt="小额赞赏"/>
                                    <h2>小额赞赏</h2>
                                    <h4>
                                        若本站内容对你有所帮助，还望不吝赞赏！
                                    </h4>
                                </div>
                            </div>
                            <div class="layui-row layui-col-space30" style="text-align:center;margin-top:5px">
                                <div class="layui-col-sm6">
                                    <img style="width:300px;" src="${basePath}/static/images/wx_reward.png">
                                    <p style="margin-top:10px;color:#FF5722;font-size:18px;">微信打赏</p>
                                </div>
                                <div class="layui-col-sm6">
                                    <img style="width:300px;" src="${basePath}/static/images/ali_reward.jpg">
                                    <p style="margin-top:10px;color:#FF5722;font-size:18px;">支付宝打赏</p>
                                </div>
                            </div>
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
<script src="${basePath}/static/js/site.js"></script>
<!-- 本页特有js -->
<script src="${basePath}/static/js/jquery.nav.js"></script>
<script>
    layui.use(['jquery'], function () {
        var $ = layui.$;

        $('.blog-nav-follow').onePageNav({
            scrollThstatichold: 0.1
        });

        $(window).scroll(function () {
            if ($(window).scrollTop() > 65) {
                $('.blog-nav').addClass('layui-hide');
            } else {
                $('.blog-nav').removeClass('layui-hide');
            }
            if ($(window).scrollTop() > 65) {
                $('.blog-nav-follow').addClass('fixed');
            } else {
                $('.blog-nav-follow').removeClass('fixed');
            }
        });
    });
</script>
</body>

</html>
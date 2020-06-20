<%--
  Created by IntelliJ IDEA.
  User: 11469
  Date: 2020/5/21
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date date = new Date();
    String nowDate = sdf.format(date);
%>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>留言交流 -年轮博客</title>
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
    <!-- 本页特有css -->
    <link rel="stylesheet" href="<%=basePath%>/static/css/comment.css">
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
                    <a><cite>留言交流</cite></a>
                </span>
        </blockquote>
        <div class="layui-row layui-col-space15">
                <div class="layui-row layui-col-space10">
                    <div class="layui-col-md12">
                        <div class="topdiv">
                            <div class="topdiv-figure">
                                <img src="<%=basePath%>/static/images/messagewall.png" />
                            </div>
                            <p class="topdiv-nickname">留言板</p>
                            <p class="topdiv-introduce">可留言、可吐槽、可提问。欢迎灌水，杜绝广告！</p>
                        </div>
                    </div>
                    <div class="blog-card blog-card-padding shadow">
                        <fieldset class="layui-elem-field layui-field-title" style="margin-bottom:0">
                            <legend>来说两句吧</legend>
                            <!-- 留言的表单 -->
                            <form class="layui-form" action="<%=basePath%>/saveWords" method="post" id="WordsForm">
                                <input name="lw_name" id="lw_name" value="${sessionScope.visitor}" hidden="hidden"/>
                                <input name="lw_date" value="<%=nowDate%>" hidden="hidden"/>
                                <input name="lw_for_article_id" value="${article.r_id}" hidden="hidden"/>
                                <div class="layui-input-block" style="margin-left: 0;">
                                <textarea id="lw_content" name="lw_content" placeholder="请输入你的留言" class="layui-textarea"
                                          style="height: 150px;"></textarea>
                                </div>
                                <br/>
                                <div class="layui-input-block" style="text-align: left;margin-left: 0;">
                                    <input type="button" onclick="replyTest();" class="layui-btn" value="留言">
                                </div>
                            </form>
                        </fieldset>
                        <div class="blog-card-title">最新留言</div>
                        <ul class="blog-comment">
                            <!-- 先遍历留言信息（一条留言信息，下面的全是回复信息） -->
                            <c:forEach items="${lw_list}" var="words">
                                    <li style="border-top: 1px dotted #01AAED">
                                        <br/>
                                        <div style="text-align: left;color:#444">
                                            <div>
                                                <span style="color:#01AAED">${words.lw_name}</span>
                                            </div>
                                            <div>${words.lw_content}</div>
                                        </div>
                                        <div>
                                            <div class="comment-parent" style="text-align:left;margin-top:7px;color:#444">
                                                <span>${words.lw_date}</span>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <p>
                                                    <a href="javascript:;" style="text-decoration: none;"
                                                       onclick="btnReplyClick(this)">回复</a>
                                                </p>
                                                <hr style="margin-top: 7px;"/>
                                            </div>
                                            <!-- 回复表单默认隐藏 -->
                                            <div class="replycontainer layui-hide" style="margin-left: 61px;">
                                                <form action="<%=basePath%>/saveReply" method="post"
                                                      class="layui-form" id="ReplyForm">
                                                    <input name="lr_for_article_id" id="lr_for_article_id"
                                                           value="${article.r_id}" hidden="hidden"/>
                                                    <input name="lr_name" id="lr_name" value="${sessionScope.visitor}"
                                                           hidden="hidden"/>
                                                    <input name="lr_date" id="lr_date" value="<%=nowDate%>"
                                                           hidden="hidden"/>
                                                    <input name="lr_for_name" id="lr_for_name" value="${words.lw_name}"
                                                           hidden="hidden"/>
                                                    <input name="lr_for_words" id="lr_for_words" value="${words.lw_id}"
                                                           hidden="hidden"/>
                                                    <input name="lr_for_reply" id="lr_for_reply" value="${reply.lr_id}"
                                                           hidden="hidden"/>
                                                    <div class="layui-form-item">
                                                    <textarea name="lr_content" id="lr_content"
                                                              lay-verify="replyContent" placeholder="请输入回复内容"
                                                              class="layui-textarea"
                                                              style="min-height:80px;"></textarea>
                                                    </div>
                                                    <div class="layui-form-item">
                                                        <button id="replyBtn" class="layui-btn layui-btn-mini" onclick="replyTest();"
                                                                lay-submit="formReply" lay-filter="formReply">提交
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>

                                        <!-- 以下是回复信息 -->
                                        <c:forEach items="${lr_list}" var="reply">
                                            <!-- 每次遍历出来的留言下存在回复信息才展示（本条回复信息是本条留言下的就显示在当前留言下） -->
                                            <c:if test="${ reply.lr_for_words eq words.lw_id}">
                                            <div style="text-align: left;margin-left:61px;color: #444">
                                                    <div>
                                                        <span style="color:#5FB878">${reply.lr_name}&nbsp;&nbsp;</span>
                                                    </div>
                                                    <div>@${reply.lr_for_name}:&nbsp;&nbsp; ${reply.lr_content}</div>
                                                </div>
                                                <div>
                                                    <div class="comment-parent"
                                                         style="text-align:left;margin-top:7px;margin-left:61px;color:#444">
                                                        <span>${reply.lr_date}</span>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <p>
                                                            <a href="javascript:;" style="text-decoration: none;"
                                                               onclick="btnReplyClick(this)">回复</a>
                                                        </p>
                                                        <hr style="margin-top: 7px;"/>
                                                    </div>
                                                    <!-- 回复表单默认隐藏 -->
                                                    <div class="replycontainer layui-hide" style="margin-left: 61px;">
                                                        <form action="<%=basePath%>/saveReply" method="post"
                                                              class="layui-form" id="ReplyForm">
                                                            <input name="lr_for_article_id" id="lr_for_article_id"
                                                                   value="${article.r_id}" hidden="hidden"/>
                                                            <input name="lr_name" id="lr_name"
                                                                   value="${sessionScope.visitor}" hidden="hidden"/>
                                                            <input name="lr_date" id="lr_date" value="<%=nowDate%>"
                                                                   hidden="hidden"/>
                                                            <input name="lr_for_name" id="lr_for_name"
                                                                   value="${reply.lr_name}" hidden="hidden"/>
                                                            <input name="lr_for_words" id="lr_for_words"
                                                                   value="${words.lw_id}" hidden="hidden"/>
                                                            <input name="lr_for_reply" id="lr_for_reply"
                                                                   value="${reply.lr_id}" hidden="hidden"/>
                                                            <div class="layui-form-item">
                                                            <textarea name="lr_content" id="lr_content"
                                                                      lay-verify="replyContent" placeholder="请输入回复内容"
                                                                      class="layui-textarea"
                                                                      style="min-height:80px;"></textarea>
                                                            </div>
                                                            <div class="layui-form-item">
                                                                <button id="replyBtn" class="layui-btn layui-btn-mini"
                                                                        lay-submit="formReply" lay-filter="formReply">提交
                                                                </button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </li>
                            </c:forEach>
                        </ul>
                        <!-- 没有评论 -->
                        <c:if test="${lw_list.size() == 0}">
                            <div class="emptybox">
                                <p><i style="font-size:50px;color:#5fb878" class="layui-icon"></i></p>
                                <p>暂无留言，大侠不妨来一发？</p>
                            </div>
                        </c:if>
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
<script type="text/javascript">
    function btnReplyClick(elem) {
        var lw_name = document.getElementById("lw_name").value;
        // var lw_name = $("#lw_name").val();
        if (lw_name == '') {
            loginMenu();
        } else {
            var $ = layui.jquery;
            if ($(this)) {
            } else if (!$(this)) {
                $(elem).parent('p').parent('.comment-parent').siblings('.replycontainer').toggleClass('layui-show');
            }
            $(elem).parent('p').parent('.comment-parent').siblings('.replycontainer').toggleClass('layui-hide');
            if ($(elem).text() == '回复') {
                $(elem).text('收起')
            } else {
                $(elem).text('回复')
            }
        }
    }
</script>
<!-- 本页特有 -->
<script src="<%=basePath%>/static/js/comment.js"></script>
</body>

</html>
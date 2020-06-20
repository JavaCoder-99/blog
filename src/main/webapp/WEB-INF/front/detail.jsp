<%--
  Created by IntelliJ IDEA.
  User: 11469
  Date: 2020/5/21
  Time: 5:04
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
    <title>${article.r_summary} -年轮博客</title>
    <link rel="stylesheet" href="<%=basePath%>/static/lib/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>/static/lib/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="<%=basePath%>/static/css/site.css">
    <link rel="stylesheet" href="<%=basePath%>/static/css/site-animate.css">
    <link rel="stylesheet" href="<%=basePath%>/static/css/site-media.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/animate.css/3.5.2/animate.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/blog-pace.css"/>
    <script data-pace-options='{ "ajax": false ,"eventLag": false}' src="<%=basePath%>/static/js/pace.min.js"></script>
    <script src="<%=basePath%>/static/lib/layui/layui.js"></script>
    <!-- 本页特有的css -->
    <link rel="stylesheet" href="<%=basePath%>/static/css/article-detail.css">
    <link rel="stylesheet" href="<%=basePath%>/static/css/wangEditor.css">
    <link rel="stylesheet" href="<%=basePath%>/static/css/prettify.css">
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/editormd/editormd.min.css"/>

</head>

<body>
<!-- 头部 -->
<%@ include file="particle/head.jsp" %>

<!-- 主体 -->
<div class="blog-body">
    <!-- 页面主体内容 -->
    <div class="layui-container">
        <blockquote class="layui-elem-quote sitemap shadow">
            <i class="layui-icon">&#xe715;</i>
            <span class="layui-breadcrumb" lay-separator=">">
                    <a href="/">首页</a>
                    <a href="/articlelist">学海无涯</a>
                    <a><cite>${article.r_summary}</cite></a>
                </span>
        </blockquote>
        <div class="layui-row layui-col-space15 clearfix">
            <div class="layui-col-md8 left">
                <div data-fontsize="14" class="article-detail shadow">
                    <div class="article-tool">
                        <div style="float:left;">
                            <button class="layui-btn layui-btn-primary layui-btn-xs"
                                    title="发布日期">${article.r_date}</button>
                            <div class="layui-btn-group">
                                <button class="layui-btn layui-btn-primary layui-btn-xs" title="浏览">
                                    <i class="fa fa-eye fa-fw"></i><span style="margin-left:3px;">${article.r_views}</span>
                                </button>
                                <button class="layui-btn layui-btn-primary layui-btn-xs" title="评论">
                                    <i class="fa fa-comments fa-fw"></i><span style="margin-left:3px;">${article.r_words}</span>
                                </button>
                                <button class="layui-btn layui-btn-primary layui-btn-xs" title="点赞">
                                    <i class="fa fa-gift fa-fw"></i><span style="margin-left:3px;">${article.r_goods}</span>
                                </button>
                            </div>
                        </div>
                        <div class="tool-box">
                            <div class="layui-btn-group layui-hide-xs">
                                <button class="layui-btn layui-btn-primary layui-btn-xs" title="展开阅读">
                                    <i class="fa fa-arrows-h fa-fw"></i>
                                </button>
                                <button class="layui-btn layui-btn-primary layui-btn-xs" title="全屏阅读">
                                    <i class="fa fa-arrows-alt fa-fw"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="article-detail-title"><h3><strong>『 ${article.r_summary} 』</strong></h3></div>
                    <div class="article-detail-content w-e-text">
                        <!-- 添加Markdown的容器 -->
                        <div id="content">
                            <textarea>${article.r_content}</textarea>
                        </div>
                    </div>
                </div>
                <div class="article-component">
                    <div class="component-box">
                        <a href="javascript:;" class="praise" blog-event="praise"><i
                                class="fa fa-thumbs-up fa-fw"></i>点赞（<span id="praiseCnt">0</span>）</a>
                        <a href="javascript:;" class="reword" blog-event="reword">赏</a>
                        <a href="javascript:;" class="share" blog-event="share"><i
                                class="fa fa-share-alt fa-fw"></i>分享（<span id="shareCnt">0</span>）</a>
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
                    <div class="blog-card-title">最新评论</div>
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
                            <p>暂无评论，大侠不妨来一发？</p>
                        </div>
                    </c:if>
                </div>
            </div>
            <div class="layui-col-md4 right">
                <div class="layui-row layui-col-space10">
                    <div class="layui-col-sm6 layui-col-md12 padding0">
                        <div class="article-category shadow categoryOut">
                            <div class="article-category-title">分类导航</div>
                            <a href="#">JAVA</a>
                            <a href="#">SpringBoot</a>
                            <a href="#">SSM框架</a>
                            <a href="#">面试题目</a>
                            <a href="#">开发工具</a>
                            <a href="#">精彩生活</a>
                            <div class="clear"></div>
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
                            <c:forEach var="article" items="${articles}" varStatus="status" end="2" begin="0">
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
                    <div class="blog-card shadow sr-rightmodule" data-scroll-reveal>
                        <div class="blog-card-title">
                            <span class="icon"><i class="layui-icon" aria-hidden="true">&#xe64c;</i></span>
                            <span class="text">友情链接</span>
                        </div>
                        <ul class="blogroll">
                            <li><a target="_blank" href="http://www.google2015.cn" title="年轮网络">年轮网络</a></li>
                            <li><a target="_blank" href="http://www.xuyinyin.cn" title="大数据工程师的博客">梦洛河</a></li>
                        </ul>
                    </div>
                </div>

                <!--右侧悬浮分类导航 平板或手机设备显示-->
                <div class="category-toggle"><i class="fa fa-chevron-left"></i></div>
            </div>
        </div>
    </div>
</div>
<%@ include file="particle/foot.jsp" %>
<!-- 移动端侧边导航 -->
<%@include file="particle/phone.jsp" %>
<!-- 侧边导航遮罩 -->
<div class="blog-mask animated layui-hide"></div>

<script src="https://cdn.bootcss.com/scrollReveal.js/3.3.6/scrollreveal.js"></script>
<script src="<%=basePath%>/static/js/site.js"></script>
<script src="<%=basePath%>/static/js/homepage.js"></script>
<!-- 本页特有js -->
<script src="<%=basePath%>/static/js/prettify.js"></script>
<script src="<%=basePath%>/static/layui/layui.js"></script>
<!-- Markdwon富文本 -->
<script src="<%=basePath%>/static/editormd/lib/marked.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/prettify.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/raphael.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/underscore.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/sequence-diagram.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/flowchart.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/jquery.flowchart.min.js"></script>
<script src="<%=basePath%>/static/editormd/editormd.min.js"></script>
<script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
<!-- Markdown富文本 -->
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

    var markdown;
    $(function () {
        markdown = editormd.markdownToHTML('content', {
            htmlDecode: "style,script,iframe",
            syncScrolling: 'single',
            emoji: true,
            taskList: true,
            tex: true,
            flowChart: true,
            sequenceDiagram: true,
            codeFold: true
        });
    });
</script>
<script type="text/javascript">
    var shareIndex, $;

    prettyPrint(); //渲染文章中的代码

    layui.use(['layer', 'form'], function () {
        $ = layui.$;
        var form = layui.form
            , device = layui.device();


        //文章顶部工具栏按钮点击事件
        $('.tool-box button').on('click', function () {
            var title = $(this).attr('title');
            switch (title) {
                case '全屏阅读':
                    var content = $('.article-detail').prop("outerHTML");
                    layer.open({
                        title: false,
                        type: 1,
                        content: content,
                        closeBtn: 0,
                        scrollbar: false,
                        area: ['100vw', '100vh'],
                        success: function (layero, index) {
                            $(layero).find('.article-tool').html('<div class="tool-box"><div class="layui-btn-group"><button class="layui-btn layui-btn-primary layui-btn-xs" title="关闭全屏"><i class="fa fa-compstatics fa-fw"></i></button></div></div>');
                            $(layero).find('.article-tool button').on('click', function () {
                                layer.close(index);
                            });
                        }
                    });
                    break;
                case '展开阅读':
                    $('.right').hide();
                    $('.left').css({
                        'width': '100%'
                    });
                    $(this).attr('title', '收缩阅读');
                    $(this).html('<i class="fa fa-compstatics fa-fw"></i>');
                    break;
                case '收缩阅读':
                    $('.right').show();
                    $('.left').css('width', '');
                    $(this).attr('title', '展开阅读');
                    $(this).html('<i class="fa fa-arrows-h fa-fw"></i>');
                    break;
                default:
            }
        });

        //回复按钮点击事件
        $('.btn-reply').on('click', function () {


            var targetId = $(this).data('targetid')
                , targetName = $(this).data('targetname')
                , $container = $(this).parent('p').parent().siblings('.replycontainer');
            if ($(this).text() == '回复') {
                $container.find('textarea').attr('placeholder', '回复【' + targetName + '】');
                $container.removeClass('layui-hide');
                $container.find('input[name="targetUserId"]').val(targetId);
                $(this).parents('.blog-comment li').find('.btn-reply').text('回复');
                $(this).text('收起');
            } else {
                $container.addClass('layui-hide');
                $container.find('input[name="targetUserId"]').val(0);
                $(this).text('回复');
            }

        });


        $("#replyBtn").click(function () {

            var lr_for_article_id = $("#lr_for_article_id").val();
            var lr_name = $("#lr_name").val();
            var lr_date = $("#lr_date").val();
            var lr_for_name = $("#lr_for_name").val();
            var lr_content = $("#lr_content").val();
            var lr_for_words = $("#lr_for_words").val();

            $.ajax({
                url: '<%=basePath%>/saveReply',
                type: 'POST',
                data: [{
                    lr_for_article_id: lr_for_article_id,
                    lr_name: lr_name,
                    lr_date: lr_date,
                    lr_for_name: lr_for_name,
                    lr_content: lr_content,
                    lr_for_words: lr_for_words
                }],
                success: function (data) {
                    layer.open({
                        title: '提示信息',
                        content: '留言成功',
                        btn: ['确定'],
                        btn1: function (index) {
                            $("body").html(data);
                        }
                    });
                },
                error: function () {
                    layer.open({
                        title: '提示信息',
                        content: '出现未知错误'
                    });
                }
            });
        });
        var events = {
            //分享
            share: function () {
                layer.msg('使用的百度分享组件');
            }

            //点赞
            , praise: function () {
                var localdata = layui.data('blog')
                    , articleId = $('#hidArticleId').val()
                    , self = this;
                if (localdata['praise' + articleId]) {
                    layer.tips('你已点过赞了，若收获颇大，可打赏作者！^_^', self, {tips: 1, time: 2000});
                    return;
                }
                //服务器点赞数加一
                //存储是否点赞该文
                layui.data('blog', {
                    key: 'praise' + $('#hidArticleId').val()
                    , value: true
                });
                //点赞+1
                $.ajax({
                    url: '<%=basePath%>/good/${article.r_id}',
                    type: 'POST',
                })

                layer.tips('Thank you ^_^', self, {tips: 1, time: 2000});
            }

            //打赏
            , reword: function () {
                layer.tab({
                    area: ['500px', '500px'],
                    shade: 0.6,
                    tab: [{
                        title: '微信',
                        content: '<img style="width:330px;height:330px;" src="<%=basePath%>/static/images/wx_reward.png" />'
                    }, {
                        title: '支付宝',
                        content: '<img style="width:330px;height:330px;" src="<%=basePath%>/static/images/ali_reward.jpg" />'
                    }]
                });

            }
        };

        $('*[blog-event]').on('click', function () {
            var eventName = $(this).attr('blog-event');
            events[eventName] && events[eventName].call(this);
        });

        $('*[blog-event="reword"]').on('mouseover', function () {
            layer.tips('一元足以感动我 ^_^', this, {tips: 1, time: 2000});
        });
    });
</script>
<script type="text/javascript">
    <%--校验登录与否--%>
    function replyTest() {
        var lw_name = $("#lw_name").val();
        if (lw_name == '') {
            loginMenu();
        }else {
            $('#WordsForm').submit();
        }
    }

</script>
</body>

</html>

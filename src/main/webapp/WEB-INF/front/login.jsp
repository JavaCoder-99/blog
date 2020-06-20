<%--
  Created by IntelliJ IDEA.
  User: 11469
  Date: 2020/5/22
  Time: 2:27
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
<html>
<head>
    <title>访客登陆</title>
    <link rel="stylesheet" href="<%=basePath%>/static/lib/layui/css/layui.css">
    <script src="<%=basePath%>/static/js/jquery-3.3.1.min.js" charset="utf-8"></script>
    <style>
        body {
            background-image: url("<%=basePath%>/static/images/bg.jpg");
            height: 100%;
            width: 100%;
        }

        #container {
            height: 100%;
            width: 100%;
        }

        input:-webkit-autofill {
            -webkit-box-shadow: inset 0 0 0 1000px #fff;
            background-color: transparent;
        }

        .admin-login-background {
            width: 300px;
            height: 300px;
            position: absolute;
            left: 50%;
            top: 40%;
            margin-left: -150px;
            margin-top: -100px;
        }

        .admin-header {
            text-align: center;
            margin-bottom: 20px;
            color: #ffffff;
            font-weight: bold;
            font-size: 40px
        }

        .admin-input {
            border-top-style: none;
            border-right-style: solid;
            border-bottom-style: solid;
            border-left-style: solid;
            height: 50px;
            width: 300px;
            padding-bottom: 0px;
        }

        .admin-input::-webkit-input-placeholder {
            color: #a78369
        }

        .layui-icon-username {
            color: #a78369 !important;
        }

        .layui-icon-username:hover {
            color: #9dadce !important;
        }

        .layui-icon-password {
            color: #a78369 !important;
        }

        .layui-icon-password:hover {
            color: #9dadce !important;
        }

        .admin-input-username {
            border-top-style: solid;
            border-radius: 10px 10px 0 0;
        }

        .admin-input-verify {
            border-radius: 0 0 10px 10px;
        }

        .admin-button {
            margin-top: 20px;
            font-weight: bold;
            font-size: 18px;
            width: 300px;
            height: 50px;
            border-radius: 5px;
            background-color: #a78369;
            border: 1px solid #d8b29f
        }

        .admin-icon {
            margin-left: 260px;
            margin-top: 10px;
            font-size: 30px;
        }

        i {
            position: absolute;
        }

        .admin-captcha {
            position: absolute;
            margin-left: 205px;
            margin-top: -40px;
        }
    </style>

    <script src="<%=basePath%>/static/layui/layui.all.js" charset="utf-8"></script>
    <script type="text/javascript">
        layui.use(['layer', 'element'], function () {
            var layer = layui.layer;
            var element = layui.element;
        });

        function checkName() {
            var username = $("#a_name").val();
            if (a_name != '') {
                $.ajax({
                    url: '<%=basePath%>/findByName',
                    type: 'post',
                    dataType: 'json',
                    contentType: 'application/json;charset=utf-8',
                    data: JSON.stringify({"v_username": username}),
                    success: function (data) {
                        if (data == null) {
                            $("#info").text("可以注册").css({'color': 'blue'});
                            return true;
                        }
                        if (data != null) {
                            $("#info").text("该用户名已注册").css({'color': 'red'});
                            return false;
                        }
                    },
                    error: function () {
                        alert("错误");
                        return false;
                    }
                });
            }
            if (a_name == '') {
                $("#info").text("");
            }
        }
    </script>
    <script type="text/javascript">
        //设置一个全局的变量，便于保存验证码
        var code;

        function createCode() {
            //首先默认code为空字符串
            code = '';
            //设置长度，这里看需求，我这里设置了4
            var codeLength = 4;
            var codeV = document.getElementById('code');
            //设置随机字符
            var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
            //循环codeLength 我设置的4就是循环4次
            for (var i = 0; i < codeLength; i++) {
                //设置随机数范围,这设置为0 ~ 36
                var index = Math.floor(Math.random() * 36);
                //字符串拼接 将每次随机的字符 进行拼接
                code += random[index];
            }
            //将拼接好的字符串赋值给展示的Value
            codeV.value = code;
        }

        //下面就是判断是否== 的代码，无需解释
        function validate() {
            var oValue = document.getElementById('check').value.toUpperCase();
            if (document.getElementById('a_name').value == 0) {
                layer.open({
                    title: '警告信息',
                    content: '请输入用户名'
                });
            } else if (document.getElementById('a_password').value == 0) {
                layer.open({
                    title: '警告信息',
                    content: '请输入密码'
                });
            } else if (oValue == 0) {
                layer.open({
                    title: '警告信息',
                    content: '请输入验证码'
                });
            } else if (oValue != code) {
                $("#check").val("");
                layer.open({
                    title: '警告信息',
                    content: '您输入的验证码不正确，请重新输入'
                });
                createCode();
            } else {
                var username = $("#a_name").val();
                var password = $("#a_password").val();
                $.ajax({
                    url: '<%=basePath%>/userLogin',
                    type: 'post',
                    dataType: 'json',
                    contentType: 'application/json;charset=utf-8',
                    data: JSON.stringify({"v_username": username, "v_password": password}),
                    success: function (data) {
                        if (data.status == 200) {
                            top.location.reload();
                            return true;
                        }
                        if (data.status == 400) {
                            $("#info").text(data.msg).css({'color': 'red'});
                            return false;
                        }
                    },
                    error: function () {
                        alert("错误");
                        return false;
                    }
                });


            }
        }

        //设置此处的原因是每次进入界面展示一个随机的验证码，不设置则为空
        window.onload = function () {
            createCode();
        }
    </script>
</head>
<body>
<div id="container layui-anim layui-anim-upbit">
    <div class="admin-login-background">
        <div class="admin-header">
            <span>用户登录</span>
        </div>
        <form id="registerform" class="layui-form" action="<%=basePath%>/userLogin">
            <div>
                <i class="layui-icon layui-icon-username admin-icon"></i>
                <input type="text" onblur="return checkName();" id="a_name" name="a_name" placeholder="请输入用户名"
                       autocomplete="off"
                       class="layui-input admin-input admin-input-username" value="">
            </div>
            <div>
                <i class="layui-icon layui-icon-password admin-icon"></i>
                <input type="password" id="a_password" name="a_password" placeholder="请输入密码" autocomplete="off"
                       class="layui-input admin-input" value="">
            </div>
            <div>
                <input type="text" id="check" name="check" placeholder="请输入验证码" autocomplete="off"
                       class="layui-input admin-input admin-input-verify" value="">
                <input class="admin-captcha" id="code" onclick="createCode()" type="button" width="90" height="30"/>
            </div>
            <div style="text-align: center">
                <span style="text-align: center">未注册账号则自动注册</span>
                <div><span id="info"></span></div>
            </div>
            <input type="button" class="layui-btn admin-button" onclick="validate()" value="登 录">
            <%--            <button class="layui-btn admin-button" onclick="validate()">登 陆</button>--%>
        </form>
    </div>
</div>

</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/30
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="statics/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="statics/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="statics/js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        var mytime;

        $(function () {
            $("#send").live("click", function () {
                var phone = $("#phone").val();
                $.post('sendsms', 'phone=' + phone, function (result) {
                    if (result == "ok") {
                        mytime = setInterval("mt()", 1000);
                    }
                });
            });
        });

        var mi = 60;

        function mt() {
            if (mi != 1) {
                mi = mi - 1;
                $("#msg").html(mi + "秒");
            } else {
                clearInterval(mytime);
                mi = 60;
                $("#msg").html("<input type=\"button\" id=\"send\" value=\"发送\" />");
            }
        }
    </script>
</head>

<body>
<div class="wrap">
    <!-- main begin-->
    <div class="main">
        <div class="sidebar">
            <p><img src="statics/images/img1.jpg" width="443" height="314" alt=""/></p>
        </div>
        <div class="sidebarg">
            <form action="userlogin" method="post">
                <div class="login">
                    <dl>
                        <dt class="blues">用户登陆</dt>
                        <dd><label for="name">用户名：</label><input type="text" class="inputh" value="常用邮箱" id="name"
                                                                 name="name"/>
                        </dd>
                        <dd><label for="password">密 码：</label><input type="text" class="inputh" value="密码"
                                                                     id="password" name="password"/></dd>
                        <dd>
                            <label for="phone">手机号：</label> <input type="text" id="phone" name="phone"/>
                            <span id="msg"><input type="button" id="send" value="发送"/></span>
                        </dd>
                        <dd>
                            <label for="code">验证码：</label> <input type="text" id="code" name="code"/>
                        </dd>
                        <dd>
                            <input name="" type="checkbox" id="rem_u"/>
                            <span for="rem_u">下次自动登录</span>
                        </dd>
                        <dd class="buttom">
                            <input name="" type="submit" value="登 录" class="spbg buttombg f14 lf"/>
                            <input name="" type="button" value="注 册" class="spbg buttombg f14 lf"
                                   onclick="javascript:location.href='userregister.jsp'"/>
                            <span class="blues  lf"><a href="" title="">忘记密码?</a></span>
                            <div class="cl">${msg }</div>
                        </dd>

                    </dl>
                </div>
            </form>
        </div>
        <div class="cl"></div>
    </div>
    <!-- main end-->

    <!-- footer begin-->
</div>
<!--footer end-->

</div>
</body>
</html>
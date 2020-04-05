<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/27
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="statics/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="statics/css/style.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<div class="wrap">
    <!-- main begin-->
    <div class="main">
        <div class="sidebar">
            <p><img src="statics/images/img1.jpg" width="443" height="314" alt=""/></p>
        </div>
        <div class="sidebarg">
            <form action="adminlogin" method="post">
                <div class="login">
                    <dl>
                        <dt class="blues">管理员登陆</dt>
                        <dd><label for="name">用户名：</label><input type="text" class="inputh" value="常用邮箱" id="name"
                                                                 name="name"/></dd>
                        <dd><label for="password">密 码：</label><input type="text" class="inputh" value="密码" id="password"
                                                                     name="password"/></dd>
                        <dd>
                            <label class="lf" for="code">验证码：</label>
                            <input type="text" class="inputh inputs lf" value="验证码" id="code" name="code"/>
                            <span class="wordp lf"><img src="Number.jsp" width="96" height="27" alt=""/></span>
                            <span class="blues lf"><a href="" title="">看不清</a></span>
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
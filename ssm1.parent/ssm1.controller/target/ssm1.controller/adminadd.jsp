<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/29
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
    <div class="sale">
        <h1 class="lf">在线拍卖系统</h1>
        <div class="logout right"><a href="exit" title="注销">注销</a></div>
    </div>
    <div class="login logns produce">
        <h1 class="blues">拍卖品信息</h1>
        <form action="add" method="post" enctype="multipart/form-data">
            <dl>
                <dd>
                    <label>名称：</label>
                    <input type="text" class="inputh lf" value="" name="auctionName"/>
                    <div class="xzkbg spbg lf"></div>
                </dd>
                <dd>
                    <label>起拍价：</label>
                    <input type="text" class="inputh lf" value="" name="auctionStartPrice"/>
                    <div class="lf red laba">必须为数字</div>
                </dd>
                <dd>
                    <label>底价：</label>
                    <input type="text" class="inputh lf" value="" name="auctionUpset"/>
                    <div class="lf red laba">必须为数字</div>
                </dd>
                <dd>
                    <label>开始时间：</label>
                    <input type="text" class="inputh lf" value="" name="auctionStartTime"/>
                    <div class="lf red laba">格式：2010-05-05 12:30:00</div>
                </dd>
                <dd>
                    <label>结束时间：</label>
                    <input type="text" class="inputh lf" value="" name="auctionEndTime"/>
                    <div class="lf red laba">格式：2010-05-06 16:30:00</div>
                </dd>
                <dd class="dds">
                    <label>拍卖品图片：</label>
                    <input name="file" type="file" class="offset10 lf"/>

                </dd>
                <dd class="dds">
                    <label>描述：</label>
                    <textarea name="auctionDesc" cols="" rows="" class="textarea"></textarea>
                </dd>
                <dd class="hegas">
                    <input name="" type="submit" value="保 存" class="spbg buttombg buttombgs buttomb f14 lf"/>
                    <input name="" type="button" value="取 消" class="spbg buttombg buttombgs buttomb f14 lf"
                           onclick="javascript:location.href='adminmain.jsp'"/>
                </dd>
            </dl>
        </form>
    </div>
    <!-- main end-->
    <!-- footer begin-->

</div>
<!--footer end-->

</div>
</body>
</html>

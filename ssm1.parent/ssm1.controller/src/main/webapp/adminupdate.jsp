<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/29
  Time: 22:52
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
    <script type="text/javascript" src="statics/js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        $(function () {
            var myurl = window.location.href;
            var id = myurl.substring(myurl.lastIndexOf("=") + 1, myurl.length);
            $.ajax({
                url: 'findbyid',
                type: 'post',
                data: 'id=' + id,
                success: function (result) {
                    if(result =="noLogin"){
                        window.location.href="index.jsp";
                        return;
                    }
                    var obj = $.parseJSON(result);
                    $("#auctionName").val(obj.auctionName);
                    $("#auctionStartPrice").val(obj.auctionStartPrice);
                    $("#auctionUpset").val(obj.auctionUpset);
                    $("#auctionStartTime").val(obj.auctionStartTime);
                    $("#auctionEndTime").val(obj.auctionEndTime);
                    $("#auctionDesc").val(obj.auctionDesc);
                    $("#pro").attr("src", obj.auctionPic);
                }
            })
        })


    </script>
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
        <form method="post" action="update?auctionId=${param.id}" enctype="multipart/form-data">
            <dl>
                <dd>
                    <label>名称：</label>
                    <input type="text" class="inputh lf" name="auctionName" id="auctionName"/>
                    <div class="xzkbg spbg lf"></div>
                </dd>
                <dd>
                    <label>起拍价：</label>
                    <input type="text" class="inputh lf" name="auctionStartPrice" id="auctionStartPrice"/>
                    <div class="lf red laba">必须为数字</div>
                </dd>
                <dd>
                    <label>底价：</label>
                    <input type="text" class="inputh lf" name="auctionUpset" id="auctionUpset"/>
                    <div class="lf red laba">必须为数字</div>
                </dd>
                <dd>
                    <label>开始时间：</label>
                    <input type="text" class="inputh lf" name="auctionStartTime" id="auctionStartTime"/>
                    <div class="lf red laba">格式：2011-05-05 12:30:00</div>
                </dd>
                <dd>
                    <label>结束时间：</label>
                    <input type="text" class="inputh lf" name="auctionEndTime" id="auctionEndTime"/>
                    <div class="lf red laba">格式：2011-05-05 12:30:00</div>
                </dd>
                <dd class="dds">
                    <label>描述：</label>
                    <textarea name="auctionDesc" id="auctionDesc" cols="" rows="" class="textarea"></textarea>
                </dd>
                <dd>
                    <label>修改图片：</label>
                    <div class="lf salebd"><a href="#"><img src="" width="100" height="100" id="pro"/></a></div>
                    <input name="file" id="file" type="file" class="marg10"/>
                </dd>
                <dd class="hegas">
                    <input name="" type="submit" value="保 存" class="spbg buttombg buttombgs f14 lf buttomb"/>
                    <input name="" type="button" value="取 消" class="spbg buttombg buttombgs f14 lf buttomb"
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

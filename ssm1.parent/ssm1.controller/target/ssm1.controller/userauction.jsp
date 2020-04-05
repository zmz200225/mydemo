<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/31
  Time: 10:45
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
        var myurl = window.location.href;
        var id = myurl.substring(myurl.lastIndexOf("=") + 1, myurl.length);
        $(function () {
            setInterval("record()", 1000);

            $.ajax({
                url: 'findbyid',
                type: 'post',
                data: 'id=' + id,
                success: function (result) {
                    var obj = $.parseJSON(result);
                    $("#auctionName").html(obj.auctionName);
                    $("#auctionStartPrice").html(obj.auctionStartPrice);
                    $("#auctionUpset").html(obj.auctionUpset);
                    $("#auctionStartTime").html(obj.auctionStartTime);
                    $("#auctionEndTime").html(obj.auctionEndTime);
                    $("#auctionDesc").html(obj.auctionDesc);
                    $("#pro").attr("src", obj.auctionPic);
                }
            })

            $("#jingpai").click(function () {
                var sale = $("#sale").val();
                $.ajax({
                    url: 'insertrecord',
                    type: 'post',
                    data: 'sale=' + sale + '&id=' + id,
                    success: function (result) {
                        if(result =="noLogin"){
                            window.location.href="index.jsp";
                            return;
                        }
                        var obj = $.parseJSON(result);
                        if (parseInt(obj) > 0) {
                            alert('竞拍成功');
                        } else {
                            alert('竞拍失败');
                        }
                    }
                })
            })

        })

        function record() {
            $.ajax({
                url: 'record',
                type: 'post',
                data: 'id=' + id,
                success: function (result) {
                    var obj = $.parseJSON(result);
                    var html = '            <ul class="rows even strong">\n' +
                        '                <li>竞拍时间</li>\n' +
                        '                <li>竞拍价格</li>\n' +
                        '                <li class="borderno">竞拍人</li>\n' +
                        '            </ul>';

                    for (var i = 0; i < obj.length; i++) {
                        var r = obj[i];
                        html += '            <ul class="rows even strong">\n' +
                            '                <li>' + r.auctionTime + '</li>\n' +
                            '                <li>' + r.auctionPrice + '</li>\n' +
                            '                <li class="borderno">' + r.user.userName + '</li>\n' +
                            '            </ul>';
                    }
                    $("#record").html(html);
                }
            })
        }
    </script>
</head>

<body>
<div class="wrap">
    <!-- main begin-->
    <div class="sale">
        <h1 class="lf">在线拍卖系统</h1>
        <div class="logout right"><a href="exit" title="注销">注销</a></div>
    </div>
    <div class="items sg-font lf">
        <ul class="rows">
            <li>名称：</li>
            <li class="borderno" id="auctionName"></li>
        </ul>
        <ul class="rows">
            <li>描述：</li>
            <li class="borderno" id="auctionDesc"></li>
        </ul>
        <ul class="rows">
            <li>开始时间：</li>
            <li class="borderno" id="auctionStartTime"></li>
        </ul>
        <ul class="rows">
            <li>结束时间：</li>
            <li class="borderno" id="auctionEndTime"></li>
        </ul>
        <ul class="rows border-no">
            <li>起拍价：</li>
            <li class="borderno" id="auctionStartPrice"></li>
        </ul>
    </div>
    <div class="rg borders"><img src="" width="270" height="185" alt="" id="pro"/></div>
    <div class="cl"></div>
    <div class="top10 salebd">
        <p>
            <label for="sale">出价：</label>
            <input type="text" class="inputwd" id="sale"/>
            <input name="jingpai" id="jingpai" type="submit" value="竞 拍" class="spbg buttombg f14  sale-buttom"/>
        </p>
        <p class="f14 red">不能低于最高竞拍价</p>
    </div>
    <div class="top10">
        <input name="" type="submit" value="刷 新" class="spbg buttombg f14"
               onclick="javascript:location.reload()"/>
        <input name="" type="submit" value="返回列表" class="spbg buttombg f14"
               onclick="javascript:location.href='usermain.jsp'"/>
    </div>
    <div class="offer">
        <h3>出价记录</h3>
        <div class="items sg-font" id="record">

        </div>
    </div>
    <!-- main end-->
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/1
  Time: 1:08
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
            $.ajax({
                url: 'findend',
                type: 'post',
                data: null,
                success: function (result) {
                    if(result =="noLogin"){
                        window.location.href="index.jsp";
                        return;
                    }
                    var obj = $.parseJSON(result);
                    var html = '        <ul class="rows even strong">\n' +
                        '            <li>名称</li>\n' +
                        '            <li>开始时间</li>\n' +
                        '            <li>结束时间</li>\n' +
                        '            <li>起拍价</li>\n' +
                        '            <li class="list-wd">成交价</li>\n' +
                        '            <li class="borderno">买家</li>\n' +
                        '        </ul>';

                    for (var i = 0; i < obj.length; i++) {
                        var r = obj[i];
                        html += '        <ul class="rows">\n' +
                            '            <li><a href="#" title="">' + r.auction.auctionName + '</a></li>\n' +
                            '            <li>' + r.auction.auctionStartTime + '</li>\n' +
                            '            <li>' + r.auction.auctionEndTime + '</li>\n' +
                            '            <li>' + r.auction.auctionStartPrice + '</li>\n' +
                            '            <li class="list-wd">' + r.auctionPrice + '</li>\n' +
                            '            <li class="borderno red"><a href="#">' + r.user.userName + '</a></li>\n' +
                            '        </ul>';
                    }
                    $("#end").html(html);
                }
            })

            $.ajax({
                url: 'startlist',
                type: 'post',
                data: null,
                success: function (result) {
                    var obj = $.parseJSON(result);
                    var html = '        <ul class="rows even strong rowh">\n' +
                        '            <li>名称</li>\n' +
                        '            <li>开始时间</li>\n' +
                        '            <li>结束时间</li>\n' +
                        '            <li>起拍价</li>\n' +
                        '            <li class="borderno record">出价记录</li>\n' +
                        '            <div class="cl"></div>\n' +
                        '        </ul>';

                    for (var i = 0; i < obj.length; i++) {
                        var a = obj[i];
                        var list = '';
                        $.ajax({
                            url: 'findrecordbyid',
                            type: 'post',
                            data: 'aid=' + a.auctionId,
                            async: false,
                            success: function (result1) {
                                var obj1 = $.parseJSON(result1);
                                for (var i = 0; i < obj1.length; i++) {
                                    var a1 = obj1[i];
                                    list += '<p>' + a1.user.userName + '  ' + a1.auctionPrice + '元</p>';
                                }
                            }
                        })
                        html += '        <ul class="rows">\n' +
                            '            <li><a href="" title="">' + a.auctionName + '</a></li>\n' +
                            '            <li>' + a.auctionStartTime + '</li>\n' +
                            '            <li>' + a.auctionEndTime + '</li>\n' +
                            '            <li>' + a.auctionStartPrice + '</li>\n' +
                            '            <li class="borderno blue record">\n' + list +
                            '            </li>\n' +
                            '            <div class="cl"></div>\n' +
                            '        </ul>';

                    }
                    $("#start").html(html);
                }
            })


        })
    </script>
</head>

<body>
<div class="wrap">
    <!-- main begin-->
    <div class="sale">
        <h1 class="lf">拍卖结束的商品</h1>
        <div class="right rulse">当前用户是：<span class="blue strong"><a href="#"
                                                                    title="">${sessionScope.sys_user.userName}</a></span>
        </div>
        <div class="cl"></div>
    </div>
    <div class="items" id="end">

    </div>
    <h1>拍卖中的商品</h1>
    <div class="items records" id="start">
        <ul class="rows even strong rowh">
            <li>名称</li>
            <li>开始时间</li>
            <li>结束时间</li>
            <li>起拍价</li>
            <li class="borderno record">出价记录</li>
            <div class="cl"></div>
        </ul>
        <ul class="rows">
            <li><a href="国书" title="">国书</a></li>
            <li>2010-01-20 12:30:30</li>
            <li>2010-09-08 12:30:30</li>
            <li>2,000</li>
            <li class="borderno blue record">
                <p>李四 400元</p>
                <p>张三 300元</p>
                <p>张晶 200元</p>
            </li>
            <div class="cl"></div>
        </ul>
        <ul class="rows even">
            <li><a href="国书" title="">瓷器</a></li>
            <li>2010-01-20 12:30:30</li>
            <li>2010-09-08 12:30:30</li>
            <li>2,000</li>
            <li class="borderno blue record">
                <p>李四 400元</p>
                <p>张三 300元</p>
                <p>张晶 200元</p>
            </li>
            <div class="cl"></div>
        </ul>
        <ul class="rows">
            <li><a href="国书" title="">国画</a></li>
            <li>2010-01-20 12:30:30</li>
            <li>2010-09-08 12:30:30</li>
            <li>2,000</li>
            <li class="borderno blue record">
                <p>李四 300元</p>
                <p>张三 200元</p>
                <p>张晶 100元</p>
            </li>
            <div class="cl"></div>
        </ul>
        <ul class="rows even border-no">
            <li><a href="国书" title="">电器</a></li>
            <li>2010-01-20 12:30:30</li>
            <li>2010-09-08 12:30:30</li>
            <li>2,000</li>
            <li class=" blue record">
                <p>李四 400元</p>
                <p>张三 400元</p>
                <p>张晶 100元</p>
            </li>
            <div class="cl"></div>
        </ul>
    </div>
    <!-- main end-->
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/28
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    ${msg}
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="statics/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="statics/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="statics/js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        $(function () {
            topage(1);
            $("#search").click(function () {
                topage(1);
            })
        })

        function topage(index) {
            if (index < 1) {
                alert('已经是第一页')
                return;
            }
            var auctionName = $("#name").val();
            var auctionDesc = $("#names").val();
            var auctionStartTime = $("#time").val();
            var auctionEndTime = $("#end-time").val();
            var auctionStartPrice = $("#price").val();
            var param = 'index=' + index + '&auctionName=' + auctionName + '&auctionDesc=' + auctionDesc + '&auctionStartTime=' + auctionStartTime + '&auctionEndTime=' + auctionEndTime + '&auctionStartPrice=' + auctionStartPrice;
            $.ajax({
                url: 'page',
                type: 'post',
                data: param,
                success: function (result) {
                    if(result =="noLogin"){
                        window.location.href="userlogin.jsp";
                        return;
                    }
                    var obj = $.parseJSON(result);
                    if (obj.total == 0) {
                        alert("没有查到数据");
                        return;
                    }
                    if (index > obj.total) {
                        alert('已经是最后一页')
                        return;
                    }
                    var html = '<ul class="rows even strong">' +
                        '<li>名称</li>' +
                        '<li class="list-wd">描述</li>' +
                        '<li>开始时间</li>' +
                        '<li>结束时间</li>' +
                        '<li>起拍价</li>' +
                        '<li class="borderno">操作</li>' +
                        '</ul>';
                    for (var i = 0; i < obj.data.length; i++) {
                        var auction = obj.data[i];
                        html += '<ul class="rows even">' +
                            '<li><a href="国书" title="">' + auction.auctionName + '</a></li>' +
                            '<li class="list-wd">' + auction.auctionDesc + '</li>' +
                            '<li>' + auction.auctionStartTime + '</li>' +
                            '<li>' + auction.auctionEndTime + '</li>' +
                            '<li>' + auction.auctionStartPrice + '</li>' +
                            '<li class="borderno red">' +
                            '<a href="userauction.jsp?id=' + auction.auctionId + '" title="竞拍"">竞拍</a></li>' +
                            '</ul>';
                    }
                    var pagenum = '';
                    var ii = 0;

                    for (var i = 1; i <= obj.total; i++) {
                        pagenum += '<a href="javascript:topage(' + i + ')" title="">' + i + '</a>';
                        ii = i;
                    }

                    html += '        <div class="page">\n' +
                        '            <a href="javascript:topage(1)" title="">首页</a>\n' +
                        '            <a href="javascript:topage(' + (obj.index - 1) + ')" title="">上一页</a>\n' +
                        '            <span class="red">前' + (ii) + '页</span>\n' + pagenum +
                        '            <a href="javascript:topage(' + (obj.index + 1) + ')" title="">下一页</a>\n' +
                        '            <a href="javascript:topage(' + obj.total + ')" title="">尾页</a>\n' +
                        '        </div>';
                    $(".items").html(html);
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
    <div class="forms">
        <label for="name">名称</label>
        <input name="" type="text" class="nwinput" id="name"/>
        <label for="names">描述</label>
        <input name="" type="text" id="names" class="nwinput"/>
        <label for="time">开始时间</label>
        <input name="" type="text" id="time" class="nwinput"/>
        <label for="end-time">结束时间</label>
        <input name="" type="text" id="end-time" class="nwinput"/>
        <label for="price">起拍价</label>
        <input name="" type="text" id="price" class="nwinput"/>
        <input name="" type="button" value="查询" class="spbg buttombg f14  sale-buttom" id="search"/>
        <input type="button" value="竞拍结果" class="spbg buttombg f14  sale-buttom buttomb"
               onclick="javascript:location.href='auctionresult.jsp'"/>
    </div>
    <div class="items">

    </div>

    <!-- main end-->
</div>
</body>
</html>

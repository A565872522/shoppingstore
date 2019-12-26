<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>退货</title>
    <meta charset="UTF-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>resource/css/carts.css">
    <link rel="stylesheet" href="<%=basePath%>resource/css/search.css">

    <style>
        .intro{
            list-style-type: none;
            position: absolute;
            left: 400px;
            top: 50px;
        }
    </style>
</head>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<body>
<div class='intro'>
    <table border="5" align="center">
        <tbody>
        <tr class="cc">
            <td>类别</td>
            <td>商品品牌</td>
            <td>商品名</td>
            <td>价格</td>
            <td>商品编号</td>
            <td>商品数量</td>
            <td>订单状态</td>
            <td>下单时间</td>
            <td>操作</td>
        </tr>
        </tbody>
    </table>
</div>
<script type="text/javascript">
var flag=true;
$(function () {
    $.ajax({
        url:"selectAllMessage",
        type:"post",
        success:function (data) {
            for(var i=0;i<data.length;i++){
                var str="<tr>\n" +
                    "            <td>"+data[i].pType+"</td>\n" +
                    "            <td>"+data[i].brand+"</td>\n" +
                    "            <td>"+data[i].pName+"</td>\n" +
                    "            <td>"+data[i].price+"￥</td>\n" +
                    "            <td>"+data[i].pCode+"</td>\n" +
                    "            <td>"+data[i].odNum+"</td>\n" +
                    "            <td>"+data[i].status+"</td>\n" +
                    "            <td>"+data[i].ordertime+"</td>\n" +
                    "            <td><button class='send2' oid='"+data[i].oId+"'>退货</button></td>\n" +
                    "        </tr>"
                $(".cc").after(str);
            }
        }
    });

    $(".intro").on("click",".send2",function(){
        $.ajax({
            url:"deliver2",
            type:"post",
            data:{
                "oid":$(this).attr("oid")
            },
            success:function (data) {
                if(data==1){
                    alert("成功")
                }else{
                    alert("失败")
                }
            }
        });
    });


})

</script>

</body>
</html>

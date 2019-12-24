<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <base href="<%=basePath%>">
    <title>商品管理</title>
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
            left: 500px;
        }
        /*.cc{*/
            /*list-style-type: none;*/
            /*display: inline-block;*/
        /*}*/
    </style>
</head>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
<div class='intro'>

</div>

<script type="text/javascript">
    var flag=true;
    $(function () {
        /*一进入页面就发送请求查询所有类别*/
        $.ajax({
            url:"selectAllProducts",
            type:"post",
            success:function (data) {
                for(var i=0;i<data.length;i++){
                    var str=" <li>"+data[i].pType+"</li>\n" +
                        "           <li>"+data[i].pName+"</li>\n" +
                        "           <li>"+data[i].brand+"</li>\n" +
                        "           <li><a href='javascript:;' class='up'   pnum='"+data[i].pNum+"' pid='"+data[i].pId+"'>上架商品</a></li>\n" +
                        "           <li><a href='javascript:;' class='down' pid='"+data[i].pId+"'>下架商品</a></li>\n" +
                        "           <li>"+data[i].status+"</li><br/> "
                    $(".intro").prepend(str);
                }
            }
        });

        $(".intro").on("click",".up",function(){
            $.ajax({
                url:"upstore",
                type:"post",
                data:{
                    "pid":$(this).attr("pid"),
                    "pnum":$(this).attr("pnum")
                },
                success:function (data) {
                    alert("ok");
                }
            });
        });

        $(".intro").on("click",".down",function(){
            $.ajax({
                url:"downstore",
                type:"post",
                data:{
                    "pid":$(this).attr("pid"),
                },
                success:function (data) {
                    alert("ok");
                }
            });
        });

    })
</script>
</body>
</html>

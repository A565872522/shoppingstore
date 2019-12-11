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
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <style>
        .ace{
            list-style-type: none;
        }
        .core{
            border: solid 1px;
            height: 260px;
            width: 200px;
        }
        .cc{
            list-style-type: none;
            display: inline-block;
        }
        .line{
            border: solid 1px;
            position: relative;
            height: 50px;
            width: 100px;
            top: 100px;
            left: 50px;
        }
        .tip{
            border: solid 1px;
            position: relative;
            height: 50px;
            width: 100px;
            top: 110px;
            left: 50px;
        }
    </style>
</head>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
<div class='intro'>
    <ul class="ace">
        <li>
            <span>相机</span>
            <ul>
                <li class="cc">
                    <div class='core'>
                        P300
                        <div class='line'>上架</div>
                        <div class='tip'>下架</div>
                    </div>
                </li>
            </ul>
        </li>
        <li>
            <span>家电</span>
            <ul>
                <li class="cc">
                    <div class='core'>
                        小米电视
                        <div class='line'>上架</div>
                        <div class='tip'>下架</div>
                    </div>
                </li>
                <li class="cc">
                    <div class='core'>
                        格力空调
                        <div class='line'>上架</div>
                        <div class='tip'>下架</div>
                    </div>
                </li>
            </ul>
        </li>
        <li>
            <span>零食</span>
            <ul>
                <li class="cc">
                    <div class='core'>
                        呀土豆
                        <div class='line'>上架</div>
                        <div class='tip'>下架</div>
                    </div>
                </li>
            </ul>
        </li>
        <li>
            <span>汽车</span>
            <ul>
                <li class="cc">
                    <div class='core'>
                        兰博基尼毒药
                        <div class='line'>上架</div>
                        <div class='tip'>下架</div>
                    </div>
                </li>
                <li class="cc">
                    <div class='core'>
                        法拉利拉法
                        <div class='line'>上架</div>
                        <div class='tip'>下架</div>
                    </div>
                </li>
            </ul>
        </li>
        <li>
            <span>手机</span>
            <ul>
                <li class="cc">
                    <div class='core'>
                        iphone 11
                        <div class='line'>上架</div>
                        <div class='tip'>下架</div>
                    </div>
                </li>
                <li class="cc">
                    <div class='core'>
                        Mate 30
                        <div class='line'>上架</div>
                        <div class='tip'>下架</div>
                    </div>
                </li>
                <li class="cc">
                    <div class='core'>
                        Galaxy S10+
                        <div class='line'>上架</div>
                        <div class='tip'>下架</div>
                    </div>
                </li>
            </ul>
        </li>
        <li>
            <span>数码</span>
            <ul>
                <li class="cc">
                    <div class='core'>
                        Z300
                        <div class='line'>上架</div>
                        <div class='tip'>下架</div>
                    </div>
                </li>
                <li class="cc">
                    <div class='core'>
                        C300
                        <div class='line'>上架</div>
                        <div class='tip'>下架</div>
                    </div>
                </li>
                <li class="cc">
                    <div class='core'>
                        ACD
                        <div class='line'>上架</div>
                        <div class='tip'>下架</div>
                    </div>
                </li>
                <li class="cc">
                    <div class='core'>
                        D400
                        <div class='line'>上架</div>
                        <div class='tip'>下架</div>
                    </div>
                </li>
            </ul>
        </li>
        <li>
            <span>化妆品</span>
            <ul>
                <li class="cc">
                    <div class='core'>
                        MAC999
                        <div class='line'>上架</div>
                        <div class='tip'>下架</div>
                    </div>
                </li>
                <li class="cc">
                    <div class='core'>
                        香奈儿五号之水
                        <div class='line'>上架</div>
                        <div class='tip'>下架</div>
                    </div>
                </li>
            </ul>
        </li>
    </ul>
</div>

<script type="text/javascript">
    $(function () {
        /*一进入页面就发送请求查询所有类别*/
        $.ajax({
            url:"selectAllP_type",
            type:"post",
            success:function (data) {
                for(var i=0;i<data.length;i++){
                    var str="            <div class='core'>" +
                        "                <div class='line'>"+data[i]+"</div>" +
                        "                <div class='tip'>下架</div>" +
                        "            </div>";
                    $(".line").prepend(str);
                }
            }
        })

        $.ajax({
            url:"removeProducts",
            type:"post",
            success:function (data) {
                for(var i=0;i<data.length;i++){
                    var str="            <div class='core'>" +
                        "                <div class='line'></div>" +
                        "                <div class='tip'>"+data[i]+"</div>" +
                        "            </div>";
                    $(".tip").prepend(str);
                }
            }
        })

        $(".pieces").on("click",".future_ui__piece",function(){
            var type=$(this).children().children().children().text();
            $("#myframe").attr("src","<%=basePath%>resource/shop/showProducts.jsp?p_type="+type+"&username="+getQueryString("username"));

            $(".intro").hide();
            $("#myframe").show();
            $("#topImg").show();

        });

        $("#topImg").click(function(){
            $(".intro").show();
            $("#myframe").hide(1000);
            $("#topImg").hide();
        });

        $("#carImg").click(function () {
            if(getCookie("username")=="null"||getCookie("username")==''||getCookie("username")==undefined){
                alert(getCookie("username"));
                window.location.href="<%=basePath%>resource/login/login.jsp";
            }else {
                window.open("<%=basePath%>resource/shop/carItems.jsp");
            }
        });

        function getQueryString(name){
            var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if(r!=null)
                return  decodeURI(r[2]);
            return null;
        }

        function getCookie(name){
            var strcookie = document.cookie;//获取cookie字符串
            var arrcookie = strcookie.split("; ");//分割
            //遍历匹配
            for ( var i = 0; i < arrcookie.length; i++) {
                var arr = arrcookie[i].split("=");
                if (arr[0] == name){
                    return arr[1];
                }
            }
            return "";
        }
    })
</script>
</body>
</html>

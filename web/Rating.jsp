<%--
  Created by IntelliJ IDEA.
  User: hetian123
  Date: 2019/4/10
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.luck.HbaseDao" %>
<%@ page import="com.luck.Food" %>
<%@page import="com.luck.PingyinHelper" %>
<%

    String fid =request.getParameter("fid");
    HbaseDao hb =new HbaseDao();
    Food food = hb.getFoodData(fid);
    String name =food.getName();
    String url = food.getUrl();
    String ur ="."+url;
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>吃得饱_睡得好</title>
    <style>
        body{
            margin: auto;
        }
        .show {
            margin: auto;
            width: 1200px;
            padding: 30px 0;
            overflow: hidden;
        }
        .pic{
            float: left;
            margin-top: 50px;
            margin-left: 75px;
        }
        .more{
            float: right;
            width: 728px;
            min-height: 555px;
            padding: 30px;
            background-color: #fff;
            border: 1px solid #e9e9e9;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            float: right;
            display: inline-block;

        }
        #jia{

            margin-left: 10px;
            font-size: 20px;
            color: #545454;

            line-height: 20px;
            padding: 10px 0 10px 25px;
            background: rgb(255, 255, 255) url("./js/mo.png") no-repeat scroll left center;

        }
        h2{

            font-size: 100%;
        }
        p,h2,input{
            margin: 0;
            padding: 0;
        }
        .sp{
            font-size: 14px;
            color: #666666;
            margin-left: 10px;
            margin-bottom: 10px;
            margin-top: 5px;
        }
        .ull{
            margin-left: 10px;
            background-color: #ebebeb;
            padding: 10px;
        }
        .mm{
            position: relative;
            margin-bottom: 5px;
        }
        .dt{
            line-height: 22px;
            float: left;
            padding-left: 10px;
            font-family: simsun;
            color: #999;
            font-size: 14px;
        }
        .dd{
            margin-left: 100px;

        }
        a{
            text-decoration:none;
            color: #6a6868;
        }
        a:hover{
            color: brown;
        }
        .rating{
            margin-left: 10px;
            padding: 20px;
        }
        #rate{
            margin-top: 20px;

        }
        p{
            margin-bottom: 10px;
        }
        .left{
            margin-top: 75px;
            float: left;
            width: 68px;
            color: #969696;
            white-space: nowrap;
            font-size: 20px;
        }
        .rap{
            float: left;
            background: #fff;
            display: block;
            margin-left: 15px;
            border-top: 1px solid #EAEAEA;
            border-bottom: 1px solid #EAEAEA;
            text-align: center;
        }

        input[type="text"]{
            box-sizing: border-box;
            text-align:center;
            font-size:1.4em;
            height:2.0em;
            border-radius:4px;
            border:1px solid #c8cccf;
            color:#6a6f77;
            -web-kit-appearance:none;
            -moz-appearance: none;
            display:block;
            outline:0;
            padding:0 1em;
            text-decoration:none;
            width:100%;
        }
        input[type="text"]:focus{
            border:1px solid #ff7496;
        }
        .rating:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
        #sub { /* 按钮美化 */
            width: 270px; /* 宽度 */
            height: 40px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: #1E90FF; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
            text-align:center;
            display:block;
            margin-left:auto;
            margin-right:auto;
            margin-bottom: 20px;
        }
        #sub:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: #5599FF;
        }
        span{
            color: #545454;
            font-size: 14px;

        }
    </style>
    <script type="text/javascript">
        var xmlhttp;
        function loadCheck(){
            var rate=document.getElementById('rate').value;
            if(rate.length==0){alert("评分不能为空");return;}
            if (window.XMLHttpRequest) {xmlhttp=new XMLHttpRequest();}
            else{xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");}
            xmlhttp.onreadystatechange=getResult;
            xmlhttp.open("POST","rate.action",true);
            xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlhttp.send("&rate="+rate+"&fid="+<%=fid%>);
        }
        function getResult(){
            if (xmlhttp.readyState==4) {
                if(xmlhttp.status==200){
                    var rec=xmlhttp.responseText;
                    if(rec=="1"){
                        document.getElementById("rate").readOnly=true;
                        alert("评分成功")
                    }
                    else {
                        //document.getElementById("insert").innerHTML ="ces";
                        alert("提交失败请稍后再试");
                    }

                }
                else{
                    alert("提交失败请稍后再试");
                }
            }
        }
    </script>
</head>
<body>
<%@include file="banner.jsp"%>
<div class="show">
    <div class="pic" >
        <img src=<%=ur%> width="230" height="230" style="display: block" >
    </div>
    <div class="more" >
        <div id="jia" >
            <h2>家常菜-<%=name%></h2>
        </div>
        <div class="sp">总有一天，你的心上人，会身披土豆饼，脚踩棉花糖，手持烤肉大鸡腿找到你，<br/>
            陪你去吃<%=name%>, 你要等
        </div>
        <div class="ull">
            <div class="mm">
            <div class="dt">动 手 做</div>
            <div class="dd">
            <a title=<%=name%> href="https://home.meishichina.com/search/<%=name%>/" target="_blank"><%=name%></a>
            </div>
            </div>

            <div class="mm">
            <div class="dt">点 外 卖</div>
            <div class="dd"><a>饿了么</a></div>
            </div>

        </div>
        <div class="rating">
            <div class="left dt">评分啊</div>
            <div class="rap"><p><input type="text" id="rate" placeholder="评分越多推荐越准哦" required="required" /></p>
                <p><span>喜欢请给评分，分值在0-5.0之间，允许一位小数</span></p>
                <p><button id="sub" onclick="loadCheck()">提交评分</button></p>

            </div>

        </div>
    </div>

</div>
</body>
</html>

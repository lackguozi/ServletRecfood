<%--
  Created by IntelliJ IDEA.
  User: hetian123
  Date: 2019/4/9
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.luck.Food" %>
<%@ page import="com.luck.HbaseDao" %>
<html>
<head>
    <title>想你所想_给你最好的选择</title>
    <style>
        li{
            float: left;
            margin: 0 23px 28px 0;
            width: 230px;
            text-align: center;
            position: relative;
            list-style: none;
        }
        .data span{
            padding: 5px 0 0 0;
            font-size: 18px;
            display: block;
        }
        ul,div,html,img, p{
            margin: 0;
            padding: 0;
        }
        body{
            background:url("./js/bg.jpg");
            margin: auto;
        }
        .msb {
            margin: auto;
            width: 990px;
            padding: 30px 0;
            overflow: hidden;
        }
        .data{
            width:1111px ;
            background: #FFFFFF;
        }
        .clear{
            zoom: 1;
        }
        a{
            color:#675656;
            text-decoration:none;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        a:hover{
            text-decoration:none;
            color: aquamarine;
        }
        #remind{
            margin-top: 30px;

            text-align: center;
            color: #6a6f77;
        }
        #none{
            background: url("js/55.jpg");
            text-align: center;
            width: auto;
            height: 260px;
        }
        /*
        为了简便，写在里面
         */
    </style>
</head>
<body>
<%@include file="banner.jsp"%>
<div id="remind">
    <p>您的评分记录越多，推荐就会越准确，如果没有记录则不会推荐，发现<a href="main.jsp">更多</a>，每天凌晨4点更新</p>
</div>
<div class="mes">

</div>
<div class="msb">
<div class="data clear">
    <ul>

<%
    String id =(String)session.getAttribute("name");
    HbaseDao hb = new HbaseDao();
    String date=hb.getFoodRec(id);
    if (date!=null){
        String[] dat=date.split(",");
        for(int i= 0;i<dat.length;i++){
            Food food = hb.getFoodData(dat[i]);
            String fid =food.getFid();
            String name =food.getName();
            String url = food.getUrl();
            String ur ="."+url;
%>
        <li>
            <div>
                <a title=<%=name %> href="Rating.jsp?fid=<%=fid%>" target="_blank">
                    <img src=<%=ur%> width="230" height="230" style="display: block" >
                    <span><%=name%></span>
                </a>
            </div>
        </li>
 <%   }
    }else {
        %>
        <div id="none" >
            什么都没有，快去发现界面看看吧，评分过后才会有推荐哦

        </div>
        <%

 }

%>

    </ul>

</div>
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: hetian123
  Date: 2019/4/11
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.luck.Food" %>
<%@ page import="com.luck.HbaseDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%
    HbaseDao data =new HbaseDao();
    int f = (int)session.getAttribute("hbaseid");
    if (f>895){
        f=0;
    }

    //String newf=String.valueOf(d+36);
    session.setAttribute("hbaseid",f+36);
    List<Food> ff=data.getAllName(f);
    Iterator it = ff.iterator();
%>
<html>
<head>
    <title>吃的好_想长哪长哪</title>
    <link rel="stylesheet" type="text/css" href="./js/main.css">
</head>
<body>
<%@include file="banner.jsp"%>
<div class="w clear">
    <div class="mo">
        <h1>最常见的家常菜</h1>
    </div>
    <div class="category_box">
        <div class="category_sub clear">
            <h3>吃得饱</h3>
            <ul>
                <%
                    while (it.hasNext()){
                        Food food= (Food) it.next();

                %>
                <li><a title=<%=food.getName()%> href="Rating.jsp?fid=<%=food.getFid()%>" target="_blank"><%=food.getName()%></a></li>

               <%
                   }
               %>
            </ul>
        </div>

    </div>
</div>
<div>
    <input id="reload" onclick="javascript:location.reload();" value="换一批"/>
</div>
</body>
</html>

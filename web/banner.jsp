<%--
  Created by IntelliJ IDEA.
  User: hetian123
  Date: 2019/4/9
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session.getAttribute("name")==null || session.getAttribute("name")=="")

    {
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
        response.sendRedirect(basePath+"index.jsp");
    }
    String s =(String)session.getAttribute("name");
%>

    <style>
        #banner{
            width: 100%;
            margin:auto;
            height: 100px;
            background-color: #f6f9fa;
        }
        #huan {float:left;
            font-size: 25pt;
            margin-left:5px;font-family:"华文楷体";
            margin-top: 25px;}
        #logo{
            width:200px;
            float:left;
            margin-left:70px;
            margin-top:10px;

        }
        #wel{
            float:right;
            font-size: 12pt;
            margin-right: 100px;
            margin-top: 40px;

        }
    </style>


<div id="banner">
    <div id="logo">
        <img src="./js/1.png" width:100%>
    </div>
    <div id="huan">吃饱了才有力气工作</div>
    <div id="wel">欢迎您： <%=s%>
    </div>
</div>




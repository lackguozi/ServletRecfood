<%--
  Created by IntelliJ IDEA.
  User: hetian123
  Date: 2019/4/8
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script type="text/javascript">
  var xmlhttp;
  function loadCheck(){
    var uname=document.getElementById('uname').value;
    var pword=document.getElementById('pword').value;
    if(uname.length==0||pword.length==0){alert("账号或密码为空");return;}
    if (window.XMLHttpRequest) {xmlhttp=new XMLHttpRequest();}
    else{xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");}
    xmlhttp.onreadystatechange=getResult;
    xmlhttp.open("POST","data.action",true);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlhttp.send("id="+uname+"&pwd="+pword);
  }
  function getResult(){
    if (xmlhttp.readyState==4) {
      if(xmlhttp.status==200){
        var rec=xmlhttp.responseText;
        if(rec=="1"){
          //document.getElementById("insert").innerHTML ="success";
          window.location.href="Food.jsp"

        }
        else {
        document.getElementById("insert").innerHTML ="ces";
        }

      }
      else{
        alert("连接失败");
      }
    }
  }
</script>

  <head>
    <title>登录</title>
    <style type="text/css">
      body{
        background:#e9e9e9;
      }
      body,p,div,ul,li,h1,h2,h3,h4,h5,h6{
        margin:0;
        padding: 0;
      }
      .login{
        width: 400px;
        height: 250px;
        background: #FFF;
        margin:200px auto;
        position: relative;
      }
      .login h1{
        text-align:center;
        position:absolute;
        left:140px;
        top:-50px;
        font-size:30px;
      }
      .login form p{
        text-align: center;
      }
      #uname{
        background:url(./js/user.png) rgba(0,0,0,.1) no-repeat;
        width: 200px;
        height: 30px;
        border:solid #ccc 1px;
        border-radius: 3px;
        padding-left: 32px;
        margin-top: 50px;
        margin-bottom: 30px;
      }
      #pword{
        background: url(./js/pwd.png) rgba(0,0,0,.1) no-repeat;
        width: 200px;
        height: 30px;
        border:solid #ccc 1px;
        border-radius: 3px;
        padding-left: 32px;
        margin-bottom: 30px;
      }
      #submit{
        width: 200px;
        height: 30px;
        background: rgba(0,0,0,.1);
        border:solid #ccc 1px;
        border-radius: 3px;
      }
      #submit:hover{
        cursor: pointer;
        background:#D8D8D8;
      }
      #insert{text-align:center}
    </style>
  </head>
  <body>
  <div class="login" >
    <h1>Login</h1>
    <form >
      <p><input type="text" id="uname" name="u" placeholder="用户名" required="required" /></p>
     <p> <input type="password" id="pword" name="p" placeholder="密码" required="required" /></p>
      <p><button type="button" id="submit" onclick="loadCheck()">登录</button></p>
      <p><div id="insert" style="color:red;padding:10px;font-size:12px"></div></p>
    </form>
  </div>


  </body>
</html>

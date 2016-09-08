<%@ page  pageEncoding="UTF-8"%>
<%@ page  contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">

body { font:12px/1.6 arial,helvetica,sans-serif; color:#123456;}
a:link { color:red;text-decoration:none; }
a:visited { color:#669;text-decoration:none; }
a:hover { color:#red;text-decoration:none;background:#039; }
a:active { color:#fff;text-decoration:none;background:#f93; }
button { cursor:pointer;line-height:1.6; }
td {
	font-family: "宋体";
	font-size: 16pt;
}
.top {
	font-family: "宋体";
	font-size: 30pt;
	font-style: normal;
	font-weight: bold;
	color: #123456;
	text-decoration: none;
}
.STYLE1 {
font-family: "宋体";
	color: #000000;
	font-size: 16pt;
	font-weight: bold;
}

</style>
<title>登录</title>
</head>

<body background="./images/bg-body.gif">
<div align="center">
<div class="top">书城账号</div>
<div class=STYLE1>登录书城</div>
    
 <s:form id="loginForm" name="loginForm" method="post" >
       <s:textfield name="user.uname" id="name" label="请您输入账号"/>
       <s:password name="user.upass" id="psw" label="请您输入密码"/>
       <s:submit value="登录" class="btn-submit" tabindex="5" onclick="login()"/>
    	 
    </s:form> 
     还没有书城帐号？<a href="register.jsp">立即注册</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <a href="index.jsp">返回主页</a></div>

<script language="JavaScript" type="text/javascript"> 
function login()
{
        var account = document.loginForm.name.value;
		var password = document.loginForm.psw.value;
		if(account==""||password=="")
		{
		    alert("请输入用户名和密码！");
		     document.URL=location.href;
		}
		else
		{
		    //当判断信息未填写正确时，不提交表单
		    document.getElementById("loginForm").action="login.action";  
            document.getElementById("loginForm").submit();
		}
}
</script> 
</body>
</html>

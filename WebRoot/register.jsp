<%@ page  pageEncoding="UTF-8"%>
<%@ page  contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
<style type="text/css">
<!--
<link rel="stylesheet" type="text/css" href="./styles.css">
body { font:12px/1.6 arial,helvetica,sans-serif; }
a:link { color:#369;text-decoration:none; }
a:visited { color:#669;text-decoration:none; }
a:hover { color:#fff;text-decoration:none;background:#039; }
a:active { color:#fff;text-decoration:none;background:#f93; }
button { cursor:pointer;line-height:1.2; }
td {
	font-family: "宋体";
	font-size: 14pt;
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
.btn-submit { cursor: pointer;color: #ffffff;background: #3fa156; border: 1px solid #528641; font-size: 14px; font-weight: bold; padding:6px 26px; border-radius: 3px; -moz-border-radius: 3px; -webkit-border-radius: 3px; *width: 100px;*height:30px; }
.btn-submit:hover { background-color:#4fca6c;border-color:#6aad54; }
.btn-submit:active { background-color:#3fa156;border-color:#528641; }
.remember { cursor: pointer; font-size: 12px; display: inline; width: auto; text-align: left; float: none; margin: 0; color: #666 }
.basic-input { width: 200px; padding: 5px; height: 22pt; font-size: 14px;vertical-align:middle; -moz-border-radius: 3px; -webkit-border-radius: 3px; border-radius: 3px; border: 1px solid #c9c9c9; font-size: 10px }
.STYLE2 {font-family: "Courier New", Courier, monospace; font-size: 24pt; font-style: normal; font-weight: bold; color: #886600; text-decoration: none; }
-->
</style>
<title>注册账号</title>
</head>
<body background="./images/bg-body.gif">

<div align="center">
<div class="top">书城账号</div>
<div class="STYLE1">欢迎加入阅读</div>
<s:form id="registerForm" name="registerForm"  method="post">
       <s:textfield id="name" name="user.uname" label="请您输入账号"/>
       <s:textfield id="phone" name="user.phone" label="请您输入电话"/>
       <s:textfield id="address" name="user.address" label="请您输入地址"/>
       <s:password id="psw1" name="user.upass" label="请您输入密码"/>
        <s:password id="psw2" name="password" label="请您确认密码"/>
 
  
      <div class="item captcha-item"><p>
        <div class="item-submit">
            <label>&nbsp;</label>
                 <s:submit value="注册" onclick="registercheck()"/>
  
        </div>
        </div>
    </s:form>

已经有帐号？<a href="login.jsp">直接登录</a>

<a href="index.jsp">返回主页</a></div>



  <script language="JavaScript" type="text/javascript" charset="UTF-8"> 
  function registercheck()
  {
        var name = document.registerForm.name.value;
        var phone = document.registerForm.phone.value;
		var password = document.registerForm.psw1.value;
		var password2 = document.registerForm.psw2.value;
		var address  = document.registerForm.address.value;
		if (name==""||password==""||phone==""||address==""||password==""||password2=="")
		{
		    alert("信息填写不完整！");
		    document.URL=location.href;
		}
		else if (psw1.value != psw2.value)
		{
		    alert("两次密码不一致！");
		    document.URL=location.href;
		}
		else
		{
		    //当判断信息未填写正确时，不提交表单
		    document.getElementById("registerForm").action="addUser.action";  
            document.getElementById("registerForm").submit();
		}
  }
</script>
</body>
</html>

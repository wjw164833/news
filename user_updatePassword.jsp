<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.UserDao" import="vo.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
.btn
{ border:1px;
background:#E91F22;
color:#fff;
width:100px;
height:26px;
cursor:pointer;/*光标手势*/}
.c
{
color:red;
}
</style>

<script language="javascript" type="text/javascript"> 
  function btn_okOnclick(){
	var pass=updatePassword.pass.value;
	var newPass=updatePassword.newPass.value;
	var newPass_1=updatePassword.newPass_1.value;
	if(pass == ""){
		alert("旧密码不能为空！");
		updatePassword.pass.focus();
		return;
	}
	if(newPass == ""){
		alert("新密码不能为空！");
		updatePassword.newPass.focus();
		return;
	}
	if(newPass_1 == ""){
		alert("请确认新密码！");
		updatePassword.newPass_1.focus();
		return;
	}
	if(newPass != newPass_1){
		alert("两次输入密码不同！");
		updatePassword.newPass_1.select();
		return;
	}
	if(newPass.length!=6){
		alert("密码长度为6位！");
		updatePassword.newPass.select();
		return;
	}
	
	updatePassword.submit();
}
</script>
<body >
<h3>新闻发布系统>>修改密码</h3>
<form action="updatePass" method="post"  name="updatePassword">
<table border="0" cellspacing="0" cellpadding="0" width="35%" align="center">
	<tr>
    	<td><span class="c">*</span>请输入旧密码:</td>
        <td>
        	<input type="password" class="inputs" name="pass"  value="" size="27" />
        </td> 
    </tr>
    <td>&nbsp;</td>
    <tr>
    	<td><span class="c">*</span>请输入新密码:</td>
        <td>
        	<input type="password" class="inputs" name="newPass"  value="" size="27" />
        </td> 
    </tr>
    <td>&nbsp;</td>
    <tr>
    	<td><span class="c">*</span>请确认新密码:</td>
        <td>
        	<input type="password" class="inputs" name="newPass_1"  value="" size="27" />
        </td> 
    </tr>
    <td>&nbsp;</td>
    <tr>
        <td colspan="2" align="center">
        	<input type="button" value="确定"  name="zhuce" class="btn" onclick="btn_okOnclick();" >
        	<input type="reset" value="重置"  name="reset"class="btn">
        </td>
    </tr>
    
    

</body>
</html>
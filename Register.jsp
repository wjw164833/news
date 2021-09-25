<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript" type="text/javascript"> 
  function btn_okOnclick(){
	var uname=register.uname.value;
	var pass=register.pass.value;
	var pass_confirm=register.pass_confirm.value;
	if(uname == ""){
		alert("用户名不能为空！");
		register.uname.focus();
		return;
	}
	if(pass == ""){
		alert("密码不能为空！");
		register.pass.focus();
		return;
	}
	if(pass != pass_confirm){
		alert("两次输入密码不同！");
		register.pass_confirm.select();
		return;
	}
	if(pass.length!=6){
		alert("密码长度为6位！");
		register.pass.select();
		return;
	}
} 

 function validateName(){
	   //提示用户名可不可用
	   var sp = document.getElementById("sp");

	   //获取页面输入的用户名
	   var uname = document.getElementById("uname").value;
	   
	   //1.创建AJAX对象
	   var xhr = new XMLHttpRequest();

	   //2.新建请求 (请求方式 请求地址 是否同步)
	   xhr.open("post", "userServlet", true);

	   //3.请求头
	   xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	   //4.请求体
	   xhr.send("method=validateName&uname="+uname);
	   //5.前后台交互验证
	   xhr.onreadystatechange = function(){
		
		
	    //正常交互
	    if(xhr.status==200 && xhr.readyState==4){

	     //6.得到返回结果,并利用结果判断用户名是否可用
	     var result = xhr.responseText;
	       //返回true,可用
	      //alert(result);
	     if(result == "true"){
	      //判用户名是否为空
	      if(uname==null||uname==""){
	       sp.style.color = "red";
	       sp.innerHTML = "用户名不可为空";
	      }else{
	       sp.style.color = "white";
	       sp.innerHTML = "用户名可用";
	      }
	     }else{  
		//返回false,用户名不可用
	      sp.style.color = "red";
	      sp.innerHTML = "用户名不可用";
	     }
	     
	    }
	   };
	  }


</script>
</head>
<style type="text/css">
.btn
{ border:1px;
background:#E91F22;
color:#fff;
width:120px;
height:36px;
cursor:pointer;/*光标手势*/}
.c
{
color:red;
}
span {
			color: red;
	}
</style>


<body onload="show()" style="background:url(images/1.png) no-repeat center center;">
<h2><center style=color:#fff>用户注册</center></h2>
<form action="Register" method="post" onSubmit="return isValid(this);"  name="register">
<table border="0" cellspacing="0" cellpadding="0" width="55%" align="center">
	<tr>
    	<td style=color:#fff><span class="c">*</span>用户名:</td>
        <td>
        <input type="text" id="uname" name="uname" size="30" onblur="validateName()" >**<span id="sp"></span>
        	<!--  <input type="text" class="inputs" name="uname"  value="" size="38" class="uname"/>
            <span>用户名由汉字，字母或数字组成</span>  -->
        </td> 
    </tr>
    <td>&nbsp;</td>
    <tr>
    	<td style=color:#fff><span class="c" >*</span>密码：</td>
        <td>
        	<input type="password" class="inputs" name="pass"   value="" size="34"/>
            <span>密码由6位数字组成</span>
        </td> 
    </tr>
    <td>&nbsp;</td>
    <tr>
    	<td style=color:#fff><span class="c">*</span>确认密码:</td>
        <td>
        	<input type="password" class="inputs" name="pass_confirm"  value="" size="34"/>
            <span>请重复上面输入的密码</span>
        </td> 
    </tr>
     <td>&nbsp;</td>

    <tr>
    	<td style=color:#fff><span class="c">*</span>性别:</td>
        <td>
        	<input type="radio"   name="sex"  value="0"/>男
            <input type="radio"   name="sex"  value="1"/>女
        </td> 
    </tr>
    <td>&nbsp;</td>
    <tr>
    	<td style=color:#fff>职业:</td>
        <td>
        <select name="profession">
        	<option value="学生">学生</option>
        	<option value="教师">教师</option>
        </select>
        </td> 
    </tr>
    <td>&nbsp;</td>
    <tr>
    	<td style=color:#fff>个人爱好:</td>
        <td>
        	<input type="checkbox"  name="favourite" value="棋牌娱乐"/>棋牌娱乐<br>
        	<input type="checkbox"  name="favourite" value="影视娱乐"/>影视娱乐<br>
        	<input type="checkbox"  name="favourite" value="电脑网络"/>电脑网络<br>
           
        </td> 
    </tr>
    <td>&nbsp;</td>
    <tr>
    	<td style=color:#fff>个人说明:</td>
        <td>
        	<textarea rows="6" cols="38" name="note" size="34">
        	</textarea>
        </td> 
    </tr>
    <td>&nbsp;</td>
    <tr>
        <td colspan="2" align="center">
        	<input type="submit" value="注册"  name="zhuce" class="btn" >
        	<input type="reset" value="重置"  name="reset"class="btn">
        </td>
    </tr>
    
 </table> 
 </form>
</div>
</body>
</html>
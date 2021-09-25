<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>登陆界面</title>
    
   <script language="javascript" type="text/javascript"> 
 function btn_okOnclick(){
	 var inputCode = document.getElementById("inputCode").value;
	    if (inputCode.length <= 0) {
	        alert("请输入验证码！");
	        return;
	    }
	    else if (inputCode.toUpperCase() != code.toUpperCase()) {
	        alert("验证码输入有误！");
	        createCode();
	        return;
	    }
	    
	login.submit();
}

var code;
function createCode() {
    code = "";
    var codeLength = 4; //验证码的长度
    var checkCode = document.getElementById("checkCode");
    var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
    for (var i = 0; i < codeLength; i++) {
        var charNum = Math.floor(Math.random() * 52);
        code += codeChars[charNum];
    }
    if (checkCode) {
        checkCode.className = "code";
        checkCode.innerHTML = code;
    }
}


</script>
</head> 
    
    <style type="text/css">
.btn
{ border:1px;
background:#E91F22;
color:#fff;
width:80px;
height:25px;
cursor:pointer;/*光标手势*/}


 .code {  font-style: italic;  color: black;  font-size: 20px;  border: 0;  padding: 2px 3px;
            letter-spacing: 3px;  font-weight: bolder;  float: left;  cursor: pointer;
            width: 100px;  height: 50px;  line-height: 50px;  text-align: center;  vertical-align: middle;  }
        a {  text-decoration: none;  font-size: 12px;  color: #288bc4;  }
        a:hover {  text-decoration: underline;  }
        
        
  * {
            padding: 0;
            margin: 0;
        }
 
        html{
            height: 100%;
        }
 
        body{
            background-image: linear-gradient(to bottom right,rgb(114,135,254),rgb(130,88,186));
        }
 
        body .login-container{
            width: 600px;
            height: 315px;
            margin: 0 auto;
            margin-top: 2%;
            border-radius: 15px;
            box-shadow: 0 10px 50px 0 rgb(59,45,159);
            background-color: rgb(95,76,194);
        }
        body .login-container .left-container{
            display: inline-block;
            width: 330px;
            border-top-left-radius: 15px;
            border-bottom-left-radius: 15px;
            padding: 60px;
            background-image: linear-gradient(to bottom right,rgb(118,76,163),rgb(92,103,211));
        }
 
        body .login-container .left-container .title{
            color: #fff;
            font-size: 22px;
            font-weight: 200;
        }
 
        body .login-container .left-container .title span{
            border-bottom: 3px solid rgb(237,221,22);
        }
 
        body .login-container .left-container .input-container{
            padding: 20px 0;
        }
 
        body .login-container .left-container .input-container input{
            border: 0;
            background: none;
            outline: 0;
            color: #fff;
            margin: 20px 0;
            padding: 5px 0;
            border-bottom: 1px solid rgb(199, 191, 219);
            display: block;
            transition: .2s;
            width: 100%;
        }
 
        body .login-container .left-container .input-container input:hover{
            border-bottom-color: #fff;
        }
 
        body .login-container .left-container .message-container{
            font-size: 14px;
            color:  rgb(199, 191, 219);
            transition: .2s;
            cursor: pointer;
        }
 
        body .login-container .left-container .message-container:hover{
            color: #fff;
        }
 
        ::-webkit-input-placeholder{
            color: rgb(199, 191,219);
        }
 
        body .login-container .right-container{
            width: 145px;
            display: inline-block;
            height: calc(100% -120px);
            height: 100%;
            vertical-align: top;
            padding: 60px 0;
        }
        body .login-container .right-container .regist-container{
            text-align: center;
            color: #fff;
            font-size: 22px;
            font-weight: 200;
        }
 
        body .login-container .right-container .regist-container span{
            border-bottom: 3px solid rgb(237,221,22);
        
        }
 
        body .login-container .right-container .action-container{
            font-size: 10px;
            color: red;
            height: 100%;
            position: relative;
        }
        body .login-container .right-container .action-container span{
            border: 1px solid rgb(237,221,22);
            padding: 10px;
            display: inline-block;
            line-height: 25px;
            border-radius: 25px;
            position: absolute;
            bottom: 10px;
            left: calc(72px - 25px);
            transition: .2s;
        }
 
        body .login-container .right-container .action-container span:hover{
            background-color: rgb(237, 221, 22);
            color: rgb(95,76,194);
        }
 
</style>
<body>
<form action="Login" method="post" name="login">
<div class="login-container">
 <div class="left-container">
            <div class="title"><span>登录</span></div>
            <div class="input-container">


		    <input type="text" name="uname" placeholder="用户名">
            <input type="password" name="pass" placeholder="密码">
                
            <div class="code" id="checkCode" onclick="createCode()"></div>    
             <input type="text" id="inputCode" placeholder="验证码">  
              <a href="#" onclick="createCode()">点击获取或更换验证码</a>   
            </div>
          
          </div>
    
         
        <div class="right-container">
            <div class="regist-container">
                <span class="regist-container"><a href="Register.jsp" style="color:white;front-size=22px">注册</a></span>
            </div>
            <div class="action-container">
                
                <span><a href="#" style="color:white" onclick="btn_okOnclick();">登录</a></span>
            </div>
            
        </div>
    </div>

</form>   
</body>
</html>
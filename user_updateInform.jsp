<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript" type="text/javascript"> 
  function btn_okOnclick(){
	
	update_inform.submit();
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
text-align:center;
cursor:pointer;/*光标手势*/}

</style>
<body style="background-color:#99FFFF">

<h2><center>修改信息</center></h2>
<form action="updateInform" method="post" name="update_inform">
<table border="0" cellspacing="0" cellpadding="0" width="50%" align="center">
	<tr>
    	<td><span class="c"></span>性别:</td>
        <td>
        	<input type="radio"   name="sex"  value="0"/>男
            <input type="radio"   name="sex"  value="1"/>女
        </td> 
    </tr>
    <td>&nbsp;</td>
      <tr>
    	<td>职业:</td>
        <td>
        <select name="profession">
        	<option value="学生">学生</option>
        	<option value="教师">教师</option>
        </select>
        </td> 
    </tr>
    <td>&nbsp;</td>
    <tr>
    	<td>个人爱好:</td>
        <td>
        	<input type="checkbox"  name="favourite" value="棋牌娱乐"/>棋牌娱乐<br>
        	<input type="checkbox"  name="favourite" value="影视娱乐"/>影视娱乐<br>
        	<input type="checkbox"  name="favourite" value="电脑网络"/>电脑网络<br>
           
        </td> 
    </tr>
     <td>&nbsp;</td>
    <tr>
    	<td>个人说明:</td>
        <td>
        	<textarea rows="4" cols="28" name="note">
        	</textarea>
        </td> 
    </tr>  
    <td>&nbsp;</td>
    <tr>
        <td colspan="2" align="center">
        	<input type="button" value="确认"   class="btn" onclick="btn_okOnclick();">
        	<input onclick="history.go(-1)" type="button" value="返回" class="btn">
        </td>
    </tr>
</table> 
</form>   
</body>
</html>
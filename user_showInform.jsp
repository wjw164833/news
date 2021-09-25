<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.UserDao,vo.User,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%if(session.getAttribute("user")==null){
	response.sendRedirect("login.jsp");
	return;
}	
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript" type="text/javascript"> 
  function btn_okOnclick(){
	
	inform.submit();
}

</script>
</head>
<style type="text/css">
.btn
{ border:1px;
background-color:#DDDDDD;
width:80px;
height:25px;
text-align:center;
cursor:pointer;/*光标手势*/}

</style>
<body>
<% 
User user=(User)session.getAttribute("user");
int uid=user.getUid();
String sex=user.getSex();
if(sex.equals("0")){
	sex="男";
}else{
	sex="女";
}
String uname=user.getUname();
String note=user.getNote();
String profession=user.getProfession();
String favourite=user.getFavourite();
%>
<h2>个人中心>>用户信息</h2>
<form action="user_updateInform.jsp" method="post" name="inform">
<table border="0" cellspacing="0" cellpadding="0" width="25%" align="center">
	<tr>
    	<td>用户名:<%=uname %></td>
        
    </tr>
    <td>&nbsp;</td>
    <tr>
    	<td>性别：<%=sex %></td>
       
    </tr>  
    <td>&nbsp;</td>
    <tr>
           <td>职业：<%=profession %></td>
         
    </tr>
      <td>&nbsp;</td>  
    <tr>
           <td>爱好：<%=favourite %></td>
         
    </tr>
      <td>&nbsp;</td>  
    <tr>
           <td>个人说明：<%=note %></td>
         
    </tr>
    <td>&nbsp;</td>
    <tr>
    	
        <td colspan="2">
        	<input type="button" value="点击修改"  name="update" class="btn" onclick="btn_okOnclick();">
        	<input onclick="history.go(-1)" type="button" value="返回" class="btn" >
        	
        </td>
    </tr>
</table> 
</form>   
</body>
</html>
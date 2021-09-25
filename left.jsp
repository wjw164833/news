<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.UserDao" import="vo.User,common.DBUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%if(session.getAttribute("user")==null){
	response.sendRedirect("login.jsp");
	return;
}	
%>

<body style="background-color:#77DDFF">
<%
String uname=(String)session.getAttribute("uname");
UserDao dao = new UserDao();
User user = new User();
user = dao.getUserByUname(uname);
user=(User)session.getAttribute("user");
if(user.getType()==1){
%>
    <a href="NewFile.jsp" style="text-decoration:none; background="#5599FF" color="#0066FF"" target="r">首页</a><br>
    <a href="user_select.jsp" style="text-decoration:none;" target="r">用户管理</a><br>
	<a href="news/newAdd.jsp?uname=<%=uname %>" style="text-decoration:none;" target="r">发布新闻</a><br>
	<a href="news/news_select.jsp" style="text-decoration:none;" target="r">新闻管理</a><br>	
	<a href="user_showInform.jsp" style="text-decoration:none;" target="r">个人中心</a><br>
	<a href="user_updatePassword.jsp" style="text-decoration:none;" target="r">修改密码</a><br>	
	<a href="exit.jsp" style="text-decoration:none;" target="_top">退出系统</a>
<%
}else{%>
    <a href="NewFile.jsp" style="text-decoration:none;" target="r">首页</a><br>
	<a href="news/newAdd.jsp?uname=<%=uname %>" style="text-decoration:none;" target="r">发布新闻</a><br>
	<a href="news/news_select.jsp" style="text-decoration:none;" target="r">新闻管理</a><br>
	<a href="user_showInform.jsp" style="text-decoration:none;" target="r">个人中心</a><br>
	<a href="user_updatePassword.jsp" style="text-decoration:none;" target="r">修改密码</a><br>
	<a href="exit.jsp" style="text-decoration:none;" target="_top">退出系统</a>


<%
 }
%>
</body>
</html>
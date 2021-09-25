<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 退出处理页面
//1-清空用户信息（即清空session变量）
session.setAttribute("uname", null);

//2-下线（在线人数减一）
	String counter = (String)application.getAttribute("counter");//取出当前在线人数
	int count = Integer.parseInt(counter);//当前在线人数
	count--;
	application.setAttribute("counter",String.valueOf(count));//把最新的在线人数保存到application变量中
	
//3-跳到登录页
response.sendRedirect("login.jsp");

%>
</body>
</html>
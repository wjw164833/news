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
String nid = request.getParameter("nid");//获取要重置密码的用户编号
//out. print(uid);
%>
是否删除编号为<%=nid %>的用户新闻？【<a href="">是</a>】【<a href="news_select.jsp">否</a>】
</body>
</html>
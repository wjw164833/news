<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<%
String uid=request.getParameter("uid");
%>
<frameset rows="21%,*">
	<frame src="top.jsp">
	<frameset cols="10%,*">
		<frame src="left.jsp" name="l" noresize="noresize">
		<frame src="newReport.jsp" name="r" noresize="noresize">
	</frameset>
</frameset>
</body>
</html>
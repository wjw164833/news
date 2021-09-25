<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="common.DBUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 重置密码的处理页面 -->
<%
String uid = request.getParameter("uid");//获取要重置密码的用户编号
//out. print(uid);
DBUtil db = new DBUtil();
String sql = "update user set pass=MD5('123456') where uid= "+uid+";";
int result = db.executeUpdate(sql);
db.closeDB();
if(result >= 0){
    response.sendRedirect("user_success.jsp");//跳到操作成功画面
}else{
    response.sendRedirect("user_failure.jsp");//跳到操作失败画面
}
%>

</body>
</html>
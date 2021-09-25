<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="common.DBUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color:#99FFFF">
<!-- 修改权限页面 -->
<%
String uid=request.getParameter("uid");//获取用户的编号
//out.print(uid);
DBUtil db=new DBUtil();
String sql ="update user set type='1' where uid="+uid+";";
int result=db.executeUpdate(sql);
db.closeDB();
//处理结果
if(result > 0){
	//跳到操作成功界面
	response.sendRedirect("user_success.jsp");
}else{
	//跳到操作失败界面
	response.sendRedirect("user_failure.jsp");
}




%>
</body>
</html>
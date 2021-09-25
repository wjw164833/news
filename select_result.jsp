<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"  import="java.sql.*" import="java.util.*" import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(session.getAttribute("user")==null){
	response.sendRedirect("login.jsp");
	return;
}	
%>

<h2>操作系统</h2><hr>
<% 
request.setCharacterEncoding("UTF-8");
String uname1 =request.getParameter("name1");
out.print(uname1);
%>

<!-- select uid,uname,sex,profession,favourite,type,isValid form user; -->
<form ><table align="center">
<tr>
<td >
用户名：
<input type="text" class="inputs" name="name1"  value="" size="28"/>
<a href="select_result.jsp"><input type="submit" value="搜索"  name="select" id="select"/></a>
<a href="user_select.jsp"><input type="submit" value="返回"  name="fanhui" id="fanhui"/></a>
</td></tr></table>
</form>
<table border="1" width="90%" align="center" cellpadding="0" cellspacing="0">
<tr>
<td>编号</td>
<td>用户名</td>
<td>性别</td>
<td>职业</td>
<td>爱好</td>
<td>类型</td>
<td>状态</td>
<td>重置密码</td>
<td>修改权限</td>
<td>更改状态</td>
<td>删除用户</td>
</tr>
<%
Connection cn=null;
Statement st=null;
ResultSet rs=null;
try{
	String className = "com.mysql.jdbc.Driver";
	Class.forName(className);
	String url = "jdbc:mysql://localhost:3306/newsdb?characterEncoding=utf-8"; 
	String user = "root"; 
	String password = "12345";
	cn = DriverManager.getConnection(url,user,password); 
	st=cn.createStatement();
	String sql="select uid,uname,sex,profession,favourite,type,isValid from user"+" where uname='"+uname1+"';";
	rs = st.executeQuery(sql);
	rs.next();
	int uid=rs.getInt("uid");//读编号
	String uname=rs.getString("uname");
	String sex=rs.getString("sex");
	if(sex.equals("0")){
		sex="男";
	}else{
		sex="女";
	}
	String profession=rs.getString("profession");
	String favourite=rs.getString("favourite");
	int type=rs.getInt("type");
	String type1=null;
    if(type==1){
		type1="管理员";
	}else{
		type1="普通用户";
	}
	int isValid=rs.getInt("isValid");
	String iv=null;
    if(isValid==1){
		iv="有效";
	}else{
		iv="无效";
	}
%>
	<tr>
	<td><%=uid %></td>
	<td><%=uname %></td>
	<td><%=sex %></td>
	<td><%=profession %></td>
	<td><%=favourite %></td>
	<td><%=type1 %></td>
	<td><%=iv %></td>
	<td>重置密码</td>
    <td>修改权限</td>
    <td>更改状态</td>
    <td>删除用户</td>
	</tr>
<% 
}catch(ClassNotFoundException e){
	e.printStackTrace();
}catch(SQLException e){
	e.printStackTrace();
}finally{
	try{
		if(rs != null){
			rs.close();
		}
		if(st != null){
			st.close();
		}
		if(cn != null){
			cn.close();
		}
	}catch(SQLException e){
		out.print("关闭数据库失败");
	}
}



%>
</table>

</body>
</html>
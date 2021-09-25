<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.UserDao,vo.User"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
select uid,uname,pass,sex,profession,favourite,note,type,isValid from user;
 -->
 <h2>新闻发布系统>>用户管理>>注册处理</h2><hr>
<%
/*
//获取登录界面传递过来的数据	
request.setCharacterEncoding("UTF-8");
String userName = request.getParameter("userName");
String userPassword = request.getParameter("userPassword");
String menu = "E:/test.txt";
writeFile wf = new writeFile(menu);
wf.writefile(userName, userPassword);
*/

//注册处理页面
request . setCharacterEncoding("UTF-8");
String uname = request. getParameter("uname") ;
String pass = request . getParameter("pass");
String pass_confirm = request. getParameter("pass_confirm") ;
String sex = request. getParameter("sex") ;
String[] favourite_a = request.getParameterValues ( "favourite");
String profession = request. getParameter( "profession");
String note = request . getParameter( "note");

//处理爱好
String favourite = "";
for(int i = 0;i < favourite_a.length;i++){
	favourite += favourite_a[i] + " ";
}


//先判断账号是否存在
UserDao dao= new UserDao();
boolean r = dao.isExistsUname(uname);
if(r){
	out.print("账号已存在");
	return;
}

//把散的注册信息构造到用户对象中
User user = new User(uname,pass);
user.setSex(sex);
user.setProfession(profession);
user.setFavourite(favourite);
user.setNote(note);
//注册到数据库中
dao=new UserDao();
int result = dao.do_register(user);
if(result >= 0){
	out.print("注册成功！");
}else{
	out.print("注册失败！");
}


	/* //操作数据库(把获取到的注册信息插入到数据库中)
	DBUtil db = new DBUtil();
	
	//构造sql命令并发送到数据库
	String sql="insert into user";
	sql +="(uname,pass,sex,profession,favourite,note)"; 
	sql +="values('" + uname + "','" + pass + "','" + sex + "','" + profession + "','" + favourite + "','" + note + "');";
	int result=db.executeUpdate(sql);

	//第五步处理结果
	if(result>0){
		out.print("注册成功");
	}else{
		out.print("注册失败");
	}
db.closeDB(); */


	//2、测试是否正确获取数据（测试代码最后要注释掉，这里可以写一行out也可以像下面写多行)
	/*
	out.print(userName);
	out.print(userPassword);
	out.print(userpassword_confirm);
	if(sex.equals("0")){
		out.print("男");
	}else{
		out.print("女");
	}
	out.print(favourite);
	out.print(profession);
	out.print(note);
	*/
/* 
//操作数据库(把获取到的注册信息插入到数据库中)
Connection conn=null;
Statement stmt=null;
try{
String className="com.mysql.jdbc.Driver";
Class.forName(className);

//第二步，连接数据库
String url="jdbc:mysql://localhost:3306/newsdb?characterEncoding=utf-8";
String user="root";
String password="152504";
conn=DriverManager.getConnection(url, user, password);
//out.print("连接成功");

//第三步，创建发送sql命令的陈述
stmt=conn.createStatement();


//第四步，构造sql命令并发送到数据库
String sql="insert into user";
sql +="(uname,pass,sex,profession,favourite,note)"; 
sql +="values('" + uname + "','" + pass + "','" + sex + "','" + profession + "','" + favourite + "','" + note + "');";
int result=stmt.executeUpdate(sql);

//第五步处理结果
if(result>0){
	out.print("注册成功");
}else{
	out.print("注册失败");
}
}catch(ClassNotFoundException e){
	//e.printStackTrace();
	out.print("加载数据库驱动程序失败");
}catch(SQLException e){
	//e.printStackTrace();
	out.print("操作数据库失败");
}finally{
	//6、关闭数据库
	try{
		if(stmt!=null){
			stmt.close();
		}
		if(conn!=null){
			conn.close();
		}
	}catch(SQLException e){
		//e.printStackTrace();
		out.print("关闭数据库失败");
	}
} */
%>

<!--  
用户名：${param.userName}
 -->
 注册成功请返回【<a href="login.jsp">登录</a>】
</body>
</html>
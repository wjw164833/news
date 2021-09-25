<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.io.*" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>新闻发布系统>>用户管理>>登录处理</h2><hr>
<%
//获取登录页面传递数据
request.setCharacterEncoding("UTF-8");//处理获取数据的乱码
String uname = request.getParameter("uname");//获取用户名
String pass = request.getParameter("pass");//获取密码

//测试是否正确获取数据
//out.print(userName);
//out.print(userPassword);

//登录验证（可以跟自己的固定账号密码比对，也可以跟文件里的登录信息进行比对，跟数据库进行比对）
//操作数据库（把获取到的注册信息插入到数据库中）
Connection conn = null;//数据库连接
Statement stmt = null;//发送SQL命令的陈述
ResultSet rs = null;//结果集
try{
	//1、加载数据库驱动程序
	String className = "com.mysql.jdbc.Driver";
	Class.forName(className);
	//2、连接数据库
	String url = "jdbc:mysql://localhost:3306/newsdb?characterEncoding=utf-8"; //访问数据库服务器的地址以及数据库名
	String user = "root"; //访问数据库服务器的账号
	String password = "12345";//访问数据库服务器的密码
	conn = DriverManager.getConnection(url,user,password); //打开数据库	
	//3、创建发送sql命令的陈述
	stmt = conn.createStatement();
	//4、构造sql命令并发送到数据库
	String sql = "select uname from user where uname='"+ uname +"' and pass='"+ pass +"';";
	//out.print(sql);//这是一句用来调试程序的，观察命令是否有错
	rs = stmt.executeQuery(sql);//执行sql命令
	//boolean result = rs.next();
	//5、处理结果
	if(rs.next()){
		//把用户信息保存到session变量中
		session.setAttribute("uname", uname);
		//1-取当前在线人数更新
		String counter = (String)application.getAttribute("counter");//取出当前在线人数
		int count;//当前在线人数
		if(counter == null){
			count = 0;//第一个人上线	
		}else{
			count = Integer.parseInt(counter);
		}
		//2-更新在线人数（再存）
		count++;
		application.setAttribute("counter",String.valueOf(count));//把最新的在线人数保存到application变量中
		
		response.sendRedirect("index.jsp");//登陆成功，跳到主页
	}else{
		response.sendRedirect("login_failure.jsp");//登陆失败，跳到登陆失败提示页
		//request.getRequestDispatcher("login_failure.jsp").forward(request,response);
	}

	
}catch(ClassNotFoundException e){
	//e.printStackTrace();
	out.print("加载数据库驱动程序失败");
}catch(SQLException e){
	//e.printStackTrace();//用来调试程序的，帮助看是哪一行产生的异常
	out.print("操作数据库失败");
}finally{
	//6、关闭数据库
	try{
		if(rs != null){
			rs.close();
		}
		if(stmt != null){
			stmt.close();
		}
		if(conn != null){
			conn.close();
		}
	}catch(SQLException e){
		//e.printStackTrace();//用来调试程序的，帮助看是哪一行产生的异常
		out.print("关闭数据库失败");
	}
}





%>
</body>
</html>
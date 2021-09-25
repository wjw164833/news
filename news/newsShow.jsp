<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*,vo.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("list_select")==null){
	return;
}
ArrayList<News> list_select=(ArrayList<News>)session.getAttribute("list_select");
Iterator<News> it=list_select.iterator();
while(it.hasNext()){
	//读取迭代器
	News news=it.next();
	UserDao dao=new UserDao();
	int uid=news.getUid();
	User user=dao.getUserByUid(uid);
	String uname=user.getUname();	
	int nid=news.getNid();
	String title=news.getTitle();
	String content=news.getContent();
	String pubtime=news.getPubtime();
	int isValid=news.getIsValid();
	String isValid_s;
	if(isValid==1){
		isValid_s="有效";
	}else{
		isValid_s="无效";
	}%>
	<h2><center>标题：<%=title %></center></h2>
	<center>作者：<%=uname %>&nbsp;,&nbsp;发布时间：<%=pubtime %><br></center><br>
	
	
	<center>正文：<%=content %></center>
	<span><a href="#" style="color:red;float:right;" onclick="history.go(-1);">返回</a></span>
<%
}
%>

</body>
</html>
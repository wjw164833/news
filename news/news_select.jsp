<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*,vo.*,java.util.*"%>
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
<script type="text/javascript">
window.onload = function() {
    doubleBgColor(document.getElementById("news"),"#f8fbfc","#e5f1f4");
}
function doubleBgColor(Table,Bg1,Bg2) {
    for (var i=0;i<Table.rows.length;i++) Table.rows[i].bgColor=i%2?Bg2:Bg1;
}
function quanxuan(qx){
	var deleteId=document.getElementsByName("deleteId");
	for(var i=0;i<deleteId.length;i++){
		deleteId[i].checked=qx.checked;
	}

</script>
<% User user_1=(User)session.getAttribute("user");
int type=user_1.getType();
int uid_1=user_1.getUid();
%>
<body style="background-color:#99FFFF">
<h2>新闻列表</h2>
<form action="../news_Select" method="post">
<table align="center" >
<tr>
<td>
<input type="text" value="" style="color: #aaa" name="title"  size="32"/>
<input type="submit" value="查询">
<input onclick="right.jsp" type="button" value="返回">
</td>
</tr>
</table>
</form>
<%if(type==1){ %>
<form action="../deleteNews" method="post" >
<td>
<input type="submit" value="批量删除">
<input type="hidden" name="oprate" value="pishan">
</td>
<hr>
<table border="1" cellspacing="0" cellpadding="0" width="80%"  align="center" id="news">
<tr>
<td><input type="checkbox" name="qx" onclick="quanxuan(this)"/></td>
<td>新闻编号</td>
<td>新闻标题</td>
<td>发布人</td>
<td>发布时间</td>
<td>审批</td>
<td>状态</td>
<td>头条</td>
<td>操作</td>
</tr>
<%}else{ %>
<hr>
<table border="1" cellspacing="0" cellpadding="0" width="80%"  align="center" id="news">
<tr>
<!-- <td><input type="checkbox" name="qx" onclick="quanxuan(this)"/></td>    -->
<td>新闻编号</td>
<td>新闻标题</td>
<td>发布人</td>
<td>发布时间</td>
<td>操作</td>
</tr>
<%} %>
<%!
	public static final int PAGESIZE = 4;
	int pageCount = 1;
	int curPage = 1;
	
	public ArrayList<News> choseNews(ArrayList<News> list,int start,int size){
		ArrayList<News> list1 = new ArrayList<News>();
		while(true){
			if(start>list.size()){
				break;
			}
			list1.add(list.get(start-1));
			if(list1.size()==size){
				break;
			}
			start++;
		}
		return list1;
	}
%>

<%
if(session.getAttribute("list_news")==null){
	return;
}
ArrayList<News> list_news=(ArrayList<News>)session.getAttribute("list_news");
	int size = list_news.size();
	pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);
	String tmp = request.getParameter("curPage");
	if(tmp==null||Integer.parseInt(tmp)==0){
		tmp="1";
	}
	curPage = Integer.parseInt(tmp);
	if(curPage>=pageCount) curPage = pageCount;
	int end = curPage*PAGESIZE;
	int start = end-(PAGESIZE-1);
	Iterator<News> it = choseNews(list_news, start, PAGESIZE).iterator();

//处理结果
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
	}
	int audit =news.getAudit();
	String audit_s;
	if(audit==1){
		audit_s="已审核";
	}else{
		audit_s="未审核";
	}
	int important = news.getImportant();
	String important_s;
	if(important==1){
		important_s="为头条";
	}else{
		important_s="不为头条";
	}
%>
<tr>
    <%if(type==1){ %>
    <td><input type="checkbox" name="deleteId" value="<%=news.getNid()  %>"></td>
	<td><%=nid %></td>
	<td><%=title %></td>
	<td><%=uname %></td>
	<td><%=pubtime %></td>
	<td><a href="../isvalid?nid=<%=nid %>" onclick='return confirm("确认改为有效或改为无效？");' style="text-decoration:none">
			<%=isValid_s %></a></td>
	<td><a href="../newsAuditsServlet?nid=<%=nid %>" onclick='return confirm("确认审核通过或者未通过？");' style="text-decoration:none">
	<%=audit_s %></a></td>
	<td><a href="../newsImportantServlet?nid=<%=nid %>" onclick='return confirm("确认头条或者不为头条？");' style="text-decoration:none">
	<%=important_s %></a></td>
	<td><input type="button" value="查看" onclick="window.location.href='../showNews?nid=<%=nid %>'"/>&nbsp;
	<input type="button" class="btn" value="修改" onclick="window.location.href='../byNid?nid=<%=nid %>'">&nbsp;
	<a href="../deleteNews?nid=<%=nid %>" onclick='return confirm("确认要删除该新闻？");' style="text-decoration:none">
	<input type="button" class="btn" value="删除"></a>&nbsp;</td>	
	<%}else{ 
		if(audit_s=="已审核"){
			if(uid_1==uid){%>
			<!-- <td><input type="checkbox" name="deleteId" value="<%=news.getNid()  %>"></td>    -->
			<td><%=nid %></td>
			<td><%=title %></td>
			<td><%=uname %></td>
			<td><%=pubtime %></td>
			<td><a href="../showNews?nid=<%=nid %>"   style="text-decoration:none" class="btn">查看</a>&nbsp;
			<a href="../byNid?nid=<%=nid %>"   style="text-decoration:none" class="btn">修改</a>&nbsp;
			<a href="../deleteNews?nid=<%=nid %>" onclick='return confirm("确认要删除该新闻？");'  style="text-decoration:none" class="btn">删除</a>&nbsp;
			<%}else{ %>
			<!-- <td><input type="checkbox" name="deleteId" value="<%=news.getNid()  %>"></td>    -->
			<td><%=nid %></td>
			<td><%=title %></td>
			<td><%=uname %></td>
			<td><%=pubtime %></td>
			<td><a href="../showNews?nid=<%=nid %>"   style="text-decoration:none" class="btn">查看</a></td>
	 			<%}
	   }else{ %>
		<%}
	}%>
<%} %>
</table>
<div id="nav"  align="center">
<ul class="pager">
<a href = "news_select.jsp?curPage=1" >首页</a>    <a href = "news_select.jsp?curPage=<%=curPage-1%>" >上一页</a>    <a href = "news_select.jsp?curPage=<%=curPage+1%>" >下一页</a>    
<a href = "news_select.jsp?curPage=<%=pageCount%>" >尾页</a>     <a>第<%=curPage%>页/共<%=pageCount%>页</a>
</ul>
</div>
</form>
</body>
</html>
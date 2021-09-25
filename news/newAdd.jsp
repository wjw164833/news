<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	if(title == null){
		title = "";
		
	}
	if(content == null){
		content = "";
	}
	out.print(URLDecoder.decode( URLDecoder.decode(title, "ISO-8859-1"), "ISO-8859-1")); 
%>
<h2>新闻发布系统>>新闻管理>>添加新闻</h2><hr>
<div align="center">
<form   action="../addNews"  name="form1">
<table height="150">
<tr>
<td>新闻标题：</td>
<td><input type="text" size="50" name="title" value="<%=title%>"></td>
<td></td>
</tr>

<tr valign="top">
<td >新闻正文：</td>
<script>CKEDITOR.replace("ckeditor")</script>
<td><textarea name="content" cols="40" rows="4"  style="OVERFLOW:   hidden" class="ckeditor">
<%= content %>
</textarea></td>
</tr>

<tr>
<td colspan="2" >
<div style='margin-left:180px'>
<input type="button" value="提交" onclick="submitTo()">
<input type="reset" value="重置">
</div>
</td>
</tr>
</table>
</form>
</div>
<script  src="../ckeditor/ckeditor.js"></script>


<script type="text/javascript">
function submitTo(){
	var title = form1.title.value;
	var regex = /^(?=.*\S).+$/;
	if(title == null || regex.test(title)==false){
		alert("标题不能为空");
		form1.title.value = "";
		form1.title.focus();
		return;
	}
<%--
	var content = form1.content.value;
	if(content == null || regex.test(content)==false){
		alert("正文不能为空");
		form1.content.value = "";
		form1.content.focus();
		return;
		}
--%>
	
	form1.submit();
}
<%--function init() {
	<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	%>
	var ti = <%=title%>;
}
window.οnlοad=init(); 
--%>

</script>
</body>
</html>
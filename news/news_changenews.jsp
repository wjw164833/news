<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*,vo.*,java.util.*,java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
News news1=(News)session.getAttribute("news1");
String title=news1.getTitle();
String content=news1.getContent();
String pubtime=news1.getPubtime();
%>
<h2>新闻发布系统>>新闻管理>>修改新闻</h2><hr>
<form action="../updateNews" method="post" name="newsUpdate">
<table border="0" cellspacing="0" cellpadding="0" width="80%" align="center">
	<tr>
    	<td>新闻标题:</td>
        <td><input type="text" class="inputs" size="50" name="title" value="<%=title%>">
                 发布时间：<%=pubtime %>
        </td> 
    </tr>
    <td>&nbsp;</td>
    <tr>
    	<td>新闻正文：</td>
        <script>CKEDITOR.replace("ckeditor")</script>
        <td><textarea name="content" cols="40" rows="4"  style="OVERFLOW:   hidden" class="ckeditor">
        <%= content %>
        </textarea>
    </tr>  
     <td>&nbsp;</td>  
     <tr>
    	<td>&nbsp;</td>
        <td colspan="2" align="center" >
        	<input type="button" value="修改"  name="sumbit" class="btn" onclick="btn_okOnclick();">
        	<input type="reset" value="重置"  name="reset" class="btn">
            <input type="button"  value="返回" onclick="history.go(-1);">
</td>
</tr>
</table>
</form>
<script  src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	  function btn_okOnclick(){
		newsUpdate.submit();
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
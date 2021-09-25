<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../style.css">
<script type="text/javascript" src="../jquery.min.js"></script>
<script type="text/javascript" src="../vector.js"></script>
</head>
<%if(session.getAttribute("user")==null){
	response.sendRedirect("login.jsp");
	return;
}	
%>

<body>
 <div id="container">
	<div id="output">
		<div class="containerT">
	
		</div>
	</div>
</div>

<script type="text/javascript">
    $(function(){
        Victor("container", "output");   //登录背景函数
        $("#entry_name").focus();
        $(document).keydown(function(event){
            if(event.keyCode==13){
                $("#entry_btn").click();
            }
        });
    });
</script>

</body>
</html>
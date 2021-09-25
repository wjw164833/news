<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<span id="timeGo">0000年00月00日星期0 00:00:00</span>
<script language="javascript" type="text/javascript"> 
function timeGo(){
	var time=new Date()
	var year=time.getFullYear()
	var month=time.getMonth()
	month++
	if(month<="9"){
	month="0"+month}
	var date=time.getDate()
	if(date<="9"){
	date="0"+date}
	var day=time.getDay()
	if(day<="9"){
	day="0"+day}
	var hour=time.getHours()
	if(hour<="9"){
	hour="0"+hour}
	var minute=time.getMinutes()
	if(minute<="9"){
	minute="0"+minute}
	var second=time.getSeconds()
	if(second<="9"){
	second="0"+second}
	day_1=["一","二","三","四","五","六","日"];
	var res=year+"年"+month+"月"+date+"日"+"星期"+day_1[day-1]+hour+":"+minute+":"+second;
	document.getElementById("timeGo").innerHTML=res;
	}
	tes=setInterval(function(){
		timeGo();
	},200);
</script>
<br>
欢迎进入xx新闻发布系统，请先<a href = "login.jsp" style="text-decoration:none;" target="_top">登陆</a><br>
<br>
</body>
</html>
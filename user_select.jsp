<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.UserDao,vo.User,java.util.*"%>
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

<body style="background-color:#99FFFF">
<!-- 
select uid,uname,pass,sex,profession,favourite,note,type,isValid from user;
 -->
 <script type="text/javascript">
 window.onload = function(){
		//1.获取表格
		var tblEle = document.getElementById("tb1"); 
		//2.获取表格中tbody里面的行数(长度)
		var len = tblEle.tBodies[0].rows.length;
		//alert(len);
		//3.对tbody里面的行进行遍历
		for(var i=1;i<len;i++){
			if(i%2==0){
				//4.对偶数行设置背景颜色
				tblEle.tBodies[0].rows[i].style.backgroundColor="white"; 
				}else{
					//5.对奇数行设置背景颜色
					tblEle.tBodies[0].rows[i].style.backgroundColor="red";
					}
			} 
		}

function quanxuan(qx){
	var deleteId=document.getElementsByName("deleteId");
	for(var i=0;i<deleteId.length;i++){
		deleteId[i].checked=qx.checked;
	}

</script>
<style>
.db { border-collapse:collapse;}  
.db tr{ background-color:expression('#F8F8F8,#EFEFEF'.split(',')[rowIndex%2]); }
</style>
<h2>新闻发布系统>>用户管理>>用户管理</h2><hr>
 <form action="select">
 <table align="center">
 <tr>
 <td>
 用户名：
<input type="text" class="inputs" name="uname"   value="" size="28"/>
<a href="select_result.jsp"><input type="submit" value="搜索"  name="select" id="select"/></a>
 </td>
 </tr>
 </table>
 </form>
 <form action="delete" method="post" >
<td>
<input type="submit" value="批量删除">
<input type="hidden" name="oprate" value="pishan">
</td>
 <hr>
 <table border="1" width="90%" align="center" cellpadding="0" cellspacing="0" id="tb1" class="db">
 <tr>
 <td><input type="checkbox" name="qx" onclick="quanxuan(this)"/></td>
 
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
 <%!
	public static final int PAGESIZE = 4;
	int pageCount = 1;
	int curPage = 1;
	
	public ArrayList<User> choseNews(ArrayList<User> list,int start,int size){
		ArrayList<User> list1 = new ArrayList<User>();
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

	
	//String uname = request.getParameter("uname" );//获取查询条件
//  UserDao dao = new UserDao( );
	
    if(session.getAttribute("list")==null){
		return;
	}

    ArrayList<User> list=(ArrayList<User>)session.getAttribute("list");
	int size = list.size();
	pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);
	String tmp = request.getParameter("curPage");
	if(tmp==null||Integer.parseInt(tmp)==0){
		tmp="1";
	}
	curPage = Integer.parseInt(tmp);
	if(curPage>=pageCount) curPage = pageCount;
	int end = curPage*PAGESIZE;
	int start = end-(PAGESIZE-1);
	Iterator<User> it = choseNews(list, start, PAGESIZE).iterator();


    while(it. hasNext()){
    //读取迭代器
    User user = it.next();
    int uid = user.getUid();
    String sex = user.getSex(); //性别
    if(sex.equals("0")){
        sex ="男";
    }else{
        sex ="女";
    }
    int type = user.getType();//用户类型，0- 普通用户，1-管理员
    String type_s;
    if(type == 0){
	    type_s = "普通用户";
    }else{
        type_s  = "管理员";
    }
    
    int isValid = user.getIsValid();
    String isValid_s;
    if(isValid == 0){
    isValid_s ="无效";
    }else{
    isValid_s = "有效";
    }

%>
    <tr>
    <td><input type="checkbox" name="deleteId" value="<%=user.getUid()  %>"></td>
    
	<td><%=uid %></td>
	<td><%=user.getUname() %></td>
	<td><%=user.getSex() %></td>
	<td><%=user.getProfession() %></td>
	<td><%=user.getFavourite() %></td>
	<td><%=user.getType() %></td>
	<td><%=user.getIsValid() %></td>
	<td><a style="text-decoration:none;" href="user_reset_pass.jsp?uid=<%=user.getUid() %>">重置密码</a></td>	
	<td><a style="text-decoration:none;" href="user_type_comfirm.jsp?uid=<%=user.getUid() %>">修改权限</a></td>
	<td><a style="text-decoration:none;" href="user_isValid_comfirm.jsp?uid=<%=user.getUid() %>">更改状态</a></td>
	<td><a style="text-decoration:none;" href="delete?uid=<%=uid%>" onclick='return confirm("确认要删除该用户？");'>删除用户</a></td>

	</tr>
<%
	}

%>
</table>
<div id="nav" align="center">
<ul class="pager">
<a href = "user_select.jsp?curPage=1" >首页</a>
<a href = "user_select.jsp?curPage=<%=curPage-1%>" >上一页</a>
<a href = "user_select.jsp?curPage=<%=curPage+1%>" >下一页</a>
<a href = "user_select.jsp?curPage=<%=pageCount%>" >尾页</a>
<a>第<%=curPage%>页/共<%=pageCount%>页</a>
</ul>
</div>
</form>
</body>
</html>
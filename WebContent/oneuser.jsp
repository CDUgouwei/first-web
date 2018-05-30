<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	font-family: "微软雅黑";
}

.header {
	height: 60px;
	background: #458fce;
	color: white;
}

.logo {
	display: inline-block;
	line-height: 55px;
	font-size: 30px;
	margin-left: 50px;
}

ul {
	display: inline-block;
}

li {
	display: inline-block;
	list-style: none;
	text-align: center;
	font-size: 16px;
	margin-left: 30px;
	width: 130px;
}

a {
	text-decoration: none;
	color: white;
}

.header ul li a:hover {
	background: #74b0e2;
}

.mid {
	background: #458fce;
	opacity: 0.8;
	height: 840px;
}

.foot {
	height: 81px;
	background: #458fce;
	padding-top: 20px;
	font-size: 16px;
}

.ss {
	float: left;
	height: 100%;
	width: 15%;
	text-align: center;
	background-color: #458fce;
}

.sss {
	float: left;
	height: 100%;
	width: 85%;
}

.mydate {
	position: absolute;
	left: -9%;
	width: 10%;
	height: 86%;
	color: block;
	background-color: #74B0E2;
}

.mydate:hover {
	left: 0%;
	transition: all 0.5s ease-in-out;
}

#b {
	width: 90%;
	height: 5%;
	float: right;
	padding-top: 5%;
}



input {
	    height: 88%;
    font-size: 20px;
    text-align: center;
    margin-left: 32%;
    margin-right: -18%;
    padding: 0% 3% 0% 5%;
    margin-top: 2%;}

#form select {
	    text-align: center;
    margin: 2% 2% 0% 40%;
    font-size: 18px;
    height: 68%;
    width: 6%;
}

</style>
</head>

<body>
       <%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	   %>
	<div class="header">
		<div class="logo">人员管理子系统</div>
		<ul>
			<li><a href="main.jsp">首页</a></li>
			<li><a href="leave.jsp">出入职系统</a></li>
			<li><a href="resume.jsp">人才管理系统</a></li>
			<li><a href="">帮助</a></li>
		</ul>
	</div>
	<div class="mid">
		<div class="mydate">
			<div class="sss">
				<p id="userid">id:<%=session.getAttribute("id")%></p>
				<br />
				<p>name:<%=session.getAttribute("name")%></p>
				<br />
				<p id="position">position:<%=session.getAttribute("position")%></p>
				<br />
			</div>
			<div class="ss"></div>
		</div>
		<div id="b"><!--修改自己的信息-->
			<form action="mchange" method="post" id="form">
				<input type="text" name="user.name" maxlength="10" placeholder="<%=session.getAttribute("name")%>"  style="color: block;"></input> 
				<br /><input type="text" name="user.password" maxlength="10" placeholder="请输入新密码" id="d1" style="color: block;"></input>
				<br /> <select name="user.gender" >
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
				<br /><input type="text" name="user.phonenumber" maxlength="13" placeholder="请输入电话"  style="color: block;"></input>
				<br /><input type="text" name="user.address" maxlength="255" placeholder="请输入地址"  style="color: block;">
				<br /><input type="submit" value="修改" style="background-color: #458fce;width: 21%;" />
			</form>
		</div>
	</div>
	<div class="foot">
		<p align="center">XXXX公司</p>
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>
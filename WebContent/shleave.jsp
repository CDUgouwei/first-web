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

#login {
	display: inline-block;
	color: white;
	float: right;
	font-size: 16px;
	margin-right: 40px;
	margin-top: 25px;
}

.loginform {
	
}

#login span:hover {
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

#date4 {
	float: right;
	width: 86%;
	height: 100%;
	margin-top: 5%;
	margin-right: 4%;
	text-align: center;
	font-size: 20px;
	color: white;
}
a {
height:50px;
width:100px;
font-size: 20px;
background: #458fce;
}
</style>
</head>

<body>

	<div class="header">
		<div class="logo">人力资源管理系统</div>
		<ul>
			<li><a href="main.jsp">首页</a></li>
			<li><a href="userdate.jsp">人员管理系统</a></li>
			<li><a href="leave.jsp">出入职系统</a></li>
			<li><a href="resume.jsp">人才管理系统</a></li>
			<li><a href="">帮助</a></li>
		</ul>
		<div id="login">
			<span><a href="MyWbe.jsp">登陆</a></span>
		</div>
	</div>
	<div class="mid">
		<div class="mydate">
			<div class="sss">
				<p id="i">
					id:<%=session.getAttribute("id")%></p>
				<br />
				<p>
					name:<%=session.getAttribute("name")%></p>
				<br />
				<p>
					position:<br /><%=session.getAttribute("position")%></p>
				<br />

			</div>
			<div class="ss"></div>
		</div>
		<!-- //显示下属的离职信息  可以点击同意按钮 员工离职成功  -->
		<div id="date4">
		<form action="" method="post" id="form1">
			<table border="1" align="center" width="100%">
				<tr >
					<td>ID</td>
					<td>Name</td>
					<td>PhongNum</td>
					<td>position</td>
					<td>reason</td>
					<td>操作</td>
				</tr>
				<s:iterator value="leavelist" var="li">
					<tr>
						<td><s:property value="id" /></td>
						<td><s:property value="name" /></td>
						<td><s:property value="phone" /></td>
						<td><s:property value="position" /></td>
						<td><s:property value="reason" /></td>
						<td><a href="tongyileave?id=<s:property value="id"/>">同意</a></td>
					</tr>
				</s:iterator>
			</table>
		</form>
		</div>
	</div>
	<div class="foot">
		<!-- <p align="center">XXXX公司</p> -->
	</div>
</body>
<script type="text/javascript">
</script>
</html>

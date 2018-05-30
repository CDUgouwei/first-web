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

#b {
	width: 90%;
	height: 5%;
	float: right;
	padding-top: 5%;
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
			<li><a href="userdate.jsp">人员管理系统</a></li>
			<li><a href="leave.jsp">出入职系统</a></li>
			<li><a href="resume.jsp">人才管理系统</a></li>
			<li><a href="">帮助</a></li>
		</ul>
		<div id="login">
			<span><a href="MyWeb.jsp">登陆</a></span>
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
				<p id="position">
					position:<%=session.getAttribute("position")%></p>
				<br />
			</div>
			<div class="ss"></div>
		</div>
		<div id="b">
			<form id="form" method="post">
				<input type="submit" id="b1" value="所有人查询"
					style="width: 13%; margin: -3% 5% 0% 26%; font-size: 18px;"
					formaction="all"></input> <input type="button" id="b2" value="下属查询"
					style="width: 13%; margin: -3% 5% 0% 5%; font-size: 18px"
					onclick="a1()"></input> <input type="button" id="b3"
					value="个人信息修改"
					style="width: 13%; margin: -3% 5% 0% 5%; font-size: 18px"
					onclick="a2()"></input>
			</form>
		</div>

	</div>
	<div class="foot">
		<p align="center">XXXX公司</p>
	</div>
</body>
<script type="text/javascript">
	var a = document.getElementById("i").innerText.length;
	var pos="<%=session.getAttribute("position")%>";
	window.onload = function() {
		if (a > 3) {
			document.getElementById("login").style.display = "none";
		}
        if(pos!="Amanager"){
        	document.getElementById("b1").style.display = "none";
        }
        if(pos=="normal")
        {
        	document.getElementById("b2").style.display = "none";
       	}
	}
	function a1() {
		a = document.getElementById("form")
		a.action = "part";
		a.submit();
		//到partuser.jsp
	}
	function a2() {
		window.location.href = "oneuser.jsp";
	}
</script>
</html>
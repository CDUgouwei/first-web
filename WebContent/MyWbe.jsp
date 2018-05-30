<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			
			.login {
				display: inline-block;
				color: white;
				float: right;
				font-size: 16px;
				margin-right: 40px;
				margin-top: 25px;
			}
			
			.loginform {
				padding-top: 10%;
				height: 50%;
				float: right;
				opacity: 0.8;
				width: 30%;
			}
			
			form {
				padding: 12% 29% 12% 12%;
				background: #4574ce;
				height: 55%;
				width: 150px;
			}
			
			input {
				font-family: "微软雅黑";
				height: 20%;
				width: 155%;
				font-size: 20px;
			}
			
			.login span:hover {
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
		</style>
	</head>

	<body>
		<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	   %>
		<div class="header">
			<div class="logo">人力资源管理系统</div>
			<ul>
				<li>
					<a href="main.jsp">首页</a>
				</li>
				<li>
					<a href="userdate.jsp">人员管理系统</a>
				</li>
				<li>
					<a href="leave.jsp">出入职系统</a>
				</li>
				<li>
					<a href="resume.jsp">人才管理系统</a>
				</li>
				<li>
					<a href="">帮助</a>
				</li>
			</ul>
			<div class="login">
				<span><a href="">登陆</a></span>
			</div>
		</div>
		<div class="mid">
			<div class="biaoyu"></div>
			<div class="loginform">
				<form action="" method="post">
					<input type="text" name="user.id" maxlength="4" placeholder="请输入ID" id="user" style="color: block ;" onblur="userf(this.id)"  autofocus="autofocus" /><br />
					<div id="idyan" style="margin-top: 5px;color: white;height: 12%;width: 155%;text-align: center;"></div>
					<input type="password" name="password" maxlength="10" placeholder="请输入密码" id="password" style="color: block;" onblur="userf(this.id)" /><br />
					<div id="passwordyan" style="margin-top: 5px;color: white;width: 155%;height: 12%;text-align: center;"></div>
					<input type="button" value="登录"  onclick="usersu()"/>
				</form>
			</div>
		</div>
		<div class="foot">
			<p align="center">XXXX公司</p>
		</div>
	</body>
	<script type="text/javascript">
		function userf(id) {
			var a = document.getElementById(id).value;
			if(id == 'user') {
				if(a == "" || a == null) {
					document.getElementById("idyan").innerHTML = "ID不能为空";
				} else if(a.length < 4 && isNaN(a)) {
					document.getElementById("idyan").innerHTML = "ID为4位数字";
				}
			} else {
				if(a == "" || a == null) {
					document.getElementById("passwordyan").innerHTML = "密码不能为空";
				} else if(a.length <= 0) {
					document.getElementById("passwordyan").innerHTML = "密码为10位字母加数字加符号";
				}
			}
		}

		function usersu() {
			var a = document.getElementById("user").value;
			var b = document.getElementById("password").value;
			var c = document.getElementById("idyan");
			var d = document.getElementById("passwordyan");
			var q = 'yes';
			if(a == '' || a == null) {
				c.innerHTML = "ID不能为空";
				q = 'no';
			} else if(a.length < 4 && isNaN(a)) {
				c.innerHTML = "ID为4位数字";
				q = 'no';
			}
			if(b == '' || b == null) {
				d.innerHTML = "密码不能为空";
				q = 'no';
			} else if(b.length <= 0) {
				d.innerHTML = "密码为10位字母加数字加符号";
				q = 'no';
			}
			if(q == 'yes') {
				var xmlhttp = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP");
				xmlhttp.onreadystatechange = function() {
					if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				        var re= xmlhttp.responseText;
				        if(re=='nouser'){
				        	c.innerHTML='没有此用户';
				        }else if(re=="password"){
				        	d.innerHTML='密码错误';
				        }else window.location.href="main.jsp";
					}
				}
				xmlhttp.open("POST","http://localhost:8080/fistweb/a",true);
				xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xmlhttp.send("username="+a+"&password="+b); 
			}
		}
	</script>
 
</html>
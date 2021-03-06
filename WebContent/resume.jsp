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
	display: table;
}
form{
	margin: 2% 1% 1% 37%;
	vertical-align: middle;
}
input{
	      text-align: center;
    font-size: 18px;
    display: block;
    margin: 2% 1% 1% 1%;
    width: 29%;
}
textarea{
	  text-align: center;
    font-size: 18px;
    display: block;
    margin: 2% 1% 1% 1%;
    height: 160%;
    width: 29%;
}
select{
	        width: 13%;
    margin: 2% 1% 1% 1%;
    height: 30px;
    font-size: 18px;
}
#bu{
	    height: 20%;
    vertical-align: middle;
    padding: 8% 1% 1% 35%;
}
button{
	    vertical-align: middle;
    width: 16%;
    font-size: 18px;
    margin-right: 1%;
}
</style>
</head>

<body>
      
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
			<div id="bu">
				<button id="bu1" style="background-color: #74B0E2;" onclick="ap('bu1')">写简历</button><button id="bu2" onclick="ap('bu2')">查看简历</button><button id="bu3" onclick="ap('bu3')">筛选简历</button>
			</div>
			<form id="form1" method="post" >
				<input type="text" name="resume.name" id="" value="" placeholder="输入名字" required="required" maxlength="10"/>
				<input type="text" name="resume.phone" maxlength="13"   id="" value="" placeholder="输入电话号码" required="required"/>
				<select name="resume.xueli">
					<option value="高中">高中</option>
					<option value="本科">本科</option>
					<option value="博士">博士</option>
					<option value="硕士">硕士</option>
				</select>
				<select name="resume.gender">
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
				<textarea name="resume.address" maxlength="100" required="required" placeholder="输入自己家庭住址"></textarea>
				<input type="date" name="resume.year"  />
				<textarea name="resume.exeperience"  maxlength="100" placeholder="输入工作经历"></textarea>
				<textarea name="resume.hobby" required="required" maxlength="100" placeholder="输入自己的爱好"></textarea>
				<input type="submit"  value="提交" />
			</form>
			<form id="form2" method="post" style="display: none;">
				<select name="resume.xueli">
					<option value="高中">高中</option>
					<option value="不限">不限</option>
					<option value="本科">本科</option>
					<option value="博士">博士</option>
					<option value="硕士">硕士</option>
				</select>
				<select name="resume.gender">
					<option value="男">男</option>
					<option value="不限">不限</option>
					<option value="女">女</option>
				</select>
				<textarea name="resume.address" maxlength="100" required="required" placeholder="限制家庭住址"></textarea>
				<input type="date" name="resume.year"  placeholder="限制年龄" />
				<textarea name="resume.exeperience"  maxlength="100" placeholder="输入工作经历"></textarea>
				<textarea name="resume.hobby" required="required" maxlength="100" placeholder="输入自己的爱好"></textarea>
				<input type="submit"  value="提交" />
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
        if(pos!=""){//不为空就没有写按钮
        	document.getElementById("bu1").style.display = "none";
        	document.getElementById("form1").style.display = "none";
			document.getElementById("form2").style.display = "block";
        }else{//没登录就只能写简历
        	document.getElementById("bu2").style.display = "none";
        	document.getElementById("bu3").style.display = "none";
        } 
	}
	
	function ap(id) {
			if(id=="bu1"){
				document.getElementById('bu1').style.backgroundColor="#74B0E2";
				document.getElementById('bu3').style.backgroundColor="white";
				document.getElementById("form1").style.display = "block";
				document.getElementById("form2").style.display = "none";
				//document.getElementById("bu2").style.display = "none";如果是总经理就没有写简历
			}
			if(id=="bu2"){
				document.getElementById("b").style.display="none";
			 }
			if(id=="bu3"){
				document.getElementById('bu1').style.backgroundColor="white";
				document.getElementById('bu3').style.backgroundColor="#74B0E2";
				document.getElementById("form1").style.display = "none";
				document.getElementById("form2").style.display = "block";
			}
		
	}
</script>
</html>
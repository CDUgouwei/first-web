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
	ttext-align: center;
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
	padding-top: 1%;
}

#date {
	float: right;
	width: 90%;
	height: 93%;
}

#form input {
	margin: 2% 0% 1% 7%;
	height: 76%;
	font-size: 18px;
	width: 14%;
}

#form2 input {
	text-align: center;
	margin: 4% 1% 0% 34%;
	font-size: 18px;
	height: 6%;
	width: 25%;
}

#form2 textarea {
	text-align: center;
	margin: 4% 1% 0% 34%;
	font-size: 18px;
	height: 16%;
	width: 25%;
}

#date2 {
	float: right;
	width: 90%;
	height: 93%;
}

#form3 input {
	text-align: center;
	margin: 4% 1% 0% 34%;
	font-size: 18px;
	height: 6%;
	width: 22%;
}

#form3 select {
	text-align: center;
	margin: 4% 2% 0% 40%;
	font-size: 18px;
	height: 6%;
	width: 6%;
}

#date3 {
	float: right;
	width: 90%;
	height: 93%;
}

#form4 input {
	text-align: center;
	margin: 4% 1% 0% 34%;
	font-size: 18px;
	height: 6%;
	width: 22%;
}

#form4 textarea {
	text-align: center;
	margin: 4% 1% 0% 34%;
	font-size: 18px;
	height: 16%;
	width: 22%;
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
					id:
					<%=session.getAttribute("id")%>
				</p>
				<br />
				<p>
					name:
					<%=session.getAttribute("name")%>
				</p>
				<br />
				<p id="position">
					position:
					<%=session.getAttribute("position")%>
				</p>
				<br />
			</div>
			<div class="ss"></div>
		</div>
		<div id="b">
			<form id="form" method="post" action="leavesh">
				<input type="button" id="b1" value="离职申请" onclick="writeform()"></input>
				<input type="submit" id="b2" value="离职审核"></input> <input
					type="button" id="b4" value="员工入职" onclick="a2()"></input> <input
					type="button" id="b3" value="个人离职申请修改" onclick="a3()"></input>
			</form>
		</div>

		<div id="date" hidden="hidden">
			<form id="form2" action="" method="post">
				<input type="text" required="required" maxlength="4"
					value="<%=session.getAttribute("id")%>" style="color: block;"
					id="f1" readonly>
				<div id="di" style="display: inline-block;"></div>
				<br /> <input type="text" required="required" maxlength="10"
					value="<%=session.getAttribute("name")%>" style="color: block;"
					id="f2" readonly>
				<div id="dn" style="display: inline-block;"></div>
				<br /> <input type="text" required="required" maxlength="13"
					placeholder="请输入电话" style="color: block;" id="ff"
					onchange="check(this.id)">
				<div id="dp" style="display: inline-block;"></div>
				<br />
				<textarea required="required" maxlength="255" placeholder="离职概况"
					style="color: block;" id="fd" onchange="check(this.id)"></textarea>
				<div id="dt" style="display: inline-block;"></div>
				<br /> <input type="button" value="提    交"
					style="background-color: #458fce;" onclick="check1()">
				<div id="ddt" style="display: inline-block;"></div>
			</form>
		</div>

		<div id="date2" hidden="hidden">
			<form id="form3" action="" method="post">
				<input type="text" required="required" maxlength="4"
					placeholder="简历ID" style="color: block;" id="d1"
					onchange="check(this.id)">
				<div id="da" style="display: inline-block;"></div>
				<br /> <input type="text" required="required" maxlength="6"
					placeholder="薪水" style="color: block;" id="d2"
					onchange="check(this.id)">
				<div id="db" style="display: inline-block;"></div>
				<br /> <select name="bumen" id="bumen">
					<option value="1200">2</option>
					<option value="1300">3</option>
					<option value="1400">4</option>
					<option value="1500">5</option>
					<option value="1600">6</option>
					<option value="1700">7</option>
					<option value="1800">8</option>
					<option value="1900">9</option>
				</select>
				<div id="dc" style="display: inline-block;">部门选择</div>
				<br /> <input type="button" value="入     职"
					style="background-color: #458fce;" onclick="check2()">
				<div id="dd" style="display: inline-block;"></div>
			</form>
		</div>

		<!--个人离职信息修改和撤销-->
		<div id="date3" hidden="hidden">
			<form id="form4" action="" method="post">
				<input type="text" required="required" maxlength="4"
					value="<%=session.getAttribute("id")%>" style="color: block;"
					id="ll" readonly> <br /> <input type="text"
					required="required" maxlength="10"
					value="<%=session.getAttribute("name")%>" style="color: block;"
					readonly> <br /> <input type="text" required="required"
					maxlength="13" placeholder="请输入电话" style="color: block;" id="l1"
					onchange="check(this.id)">
				<div id="l3" style="display: inline-block;"></div>
				<br />
				<textarea required="required" maxlength="255" placeholder="离职概况"
					style="color: block;" id="l2" onchange="check(this.id)"></textarea>
				<div id="l4" style="display: inline-block;"></div>
				<br /> <input type="button" value="修    改"
					style="background-color: #458fce;" onclick="check3()">
				<div id="l5" style="display: inline-block;"></div>
				<br /> <input type="button" value="撤    销"
					style="background-color: #458fce;" onclick="checkc()">
				<div id="l6" style="display: inline-block;"></div>
			</form>
		</div>


	</div>
	<div class="foot">
		<p align="center">XXXX公司</p>
	</div>
</body>
<script type="text/javascript">
window.onload = function() {
			var a = document.getElementById("i").innerText.length;
			if (a > 3) {
				document.getElementById("login").style.display = "none";
			}
		 var pos="<%=session.getAttribute("position")%>";
		if (pos != "Amanager") {
			document.getElementById("b4").style.display = "none";
		}
	}

	var y2 = y3 = y4 = y5 = 0, y6 = y7 = 1;
	// 点击改变页面显示表单
	function writeform() {
		document.getElementById("form").style.display = "none";
		document.getElementById("date").style.display = "block";
	}

	// 验证表单
	function check(id) {

		if (id == 'ff') {
			var aa = document.getElementById('ff').value;
			if (aa == '' || aa == null || aa.length == 0) {
				y2 = 0;
				document.getElementById("dp").innerHTML = "电话不能为空";
			} else if (aa.length < 11 || isNaN(aa)) {
				document.getElementById("dp").innerHTML = "电话为11位数字";
				y2 = 0;
			} else
				y2 = 1;
		}
		if (id == 'fd') {
			var aa = document.getElementById('fd').value;
			if (aa == '' || aa == null || aa.length == 0) {
				y3 = 0;
				document.getElementById("dt").innerHTML = "概况不能为空";
			} else
				y3 = 1;

		}
		if (id == 'd1') {
			var aa = document.getElementById('d1').value;
			if (aa == '' || aa == null || aa.length == 0) {
				y4 = 0;
				document.getElementById("da").innerHTML = "id不能为空";
			} else if (isNaN(aa)) {
				document.getElementById("da").innerHTML = "id为数字";
				y4 = 0;
			} else
				y4 = 1;
		}
		if (id == 'd2') {
			var aa = document.getElementById('d2').value;
			if (aa == '' || aa == null || aa.length == 0) {
				y5 = 0;
				document.getElementById("db").innerHTML = "不能薪水为空";
			} else if (isNaN(aa)) {
				document.getElementById("db").innerHTML = "薪水为数字";
				y5 = 0;
			} else
				y5 = 1;
		}

		if (id == 'l1') {
			var aa = document.getElementById('l1').value;
			if (aa == '' || aa == null || aa.length == 0) {
				y6 = 0;
				document.getElementById("l3").innerHTML = "电话不能为空";
			} else if (aa.length < 11 && isNaN(aa)) {
				document.getElementById("l3").innerHTML = "电话为11位数字";
				y6 = 0;
			} else
				y6 = 1;
		}
		if (id == 'l2') {
			var aa = document.getElementById('l2').value;
			if (aa == '' || aa == null || aa.length == 0) {
				y7 = 0;
				document.getElementById("l4").innerHTML = "概况不能为空";
			} else {
				y7 = 1;
			}
		}
	}

	function check1() {
		var aaa = document.getElementById('fd').value;
		if (aaa == '' || aaa == null || aaa.length == 0) {
			y3 = 0;
			document.getElementById("dt").innerHTML = "概况不能为空";
		} 
		var aa = document.getElementById('ff').value;
		if (aa == '' || aa == null || aa.length == 0) {
			y2=0;
			document.getElementById("dp").innerHTML = "电话不能为空";
		} else if (aa.length < 11 || isNaN(aa)) {
			document.getElementById("dp").innerHTML = "电话为11位数字";
			y2=0;
		}
		if ((y2 * y3) == 1) {
			var a = document.getElementById('f1').value;
			var b = document.getElementById('f2').value;
			var f = document.getElementById('ff').value;
			var d = document.getElementById('fd').value;
			var ddt = document.getElementById('ddt');
			var xmlhttp = window.XMLHttpRequest ? new XMLHttpRequest()
					: new ActiveXObject("Microsoft.XMLHTTP");
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var re = xmlhttp.responseText;
					if (re == "you") {
						ddt.innerHTML = "已经申请了";
					} else
						window.location.href = "leave.jsp";
				}
			}
			xmlhttp.open("POST", "http://localhost:8080/fistweb/s", true);
			xmlhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xmlhttp.send("userid=" + a + "&name=" + b + "&phone=" + f
					+ "&text=" + d);
		}
	}

	/* function a1() {
		var a = document.getElementById("form")
		a.action = "1eaveSh";
		a.submit();
	} */
	/*员工入职* a2 check2 */
	function a2() {
		document.getElementById("form").style.display = "none";
		document.getElementById("date2").style.display = "block";
	}

	function check2() {
		if ((y4 * y5) == 1) {
			var a = document.getElementById('d1').value;
			var b = document.getElementById('d2').value;
			var f = document.getElementById('bumen').value;
			var dd = document.getElementById('dd');
			var xmlhttp = window.XMLHttpRequest ? new XMLHttpRequest()
					: new ActiveXObject("Microsoft.XMLHTTP");
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var re = xmlhttp.responseText;
					if (re == "null") {
						document.getElementById("da").innerHTML = "没有此简历id输入错误";
					} else if (re == "success") {
						window.location.href = "leave.jsp";
					}

				}
			}
			xmlhttp.open("POST", "http://localhost:8080/fistweb/r", true);
			xmlhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xmlhttp.send("resumeid=" + a + "&salary=" + b + "&bumen=" + f);
		}
	}

	/*点击离职申请修改和撤销 ，判断是否有离职申请信息，有就出现表单和自己的信息。没有就弹出框提示没有离职申请信息*/
	function a3() {
		var xmlhttp = window.XMLHttpRequest ? new XMLHttpRequest()
				: new ActiveXObject("Microsoft.XMLHTTP");
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var re = xmlhttp.responseText;
				if (re == "null") {
					alert("没有离职申请");
				} else {
					document.getElementById("form").style.display = "none";
					document.getElementById("date3").style.display = "block";
					var list = new Array();
					list = re.split(",");
					document.getElementById("l1").value = list[0];
					document.getElementById("l2").value = list[1];
				}

			}
		}
		xmlhttp.open("POST", "http://localhost:8080/fistweb/leavechange1",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("leaveid=" +<%=session.getAttribute("id")%>);
	}

	// 点击修改按钮后的操作 输入合格就update自己的申请信息 成功返回leave.jsp 没有更改就在按钮后输出没有改变信息
	function check3() {
		if ((y6 * y7) == 1) {
			var a = document.getElementById('l1').value;
			var b = document.getElementById('l2').value;
			var l5 = document.getElementById('l5');
			var xmlhttp = window.XMLHttpRequest ? new XMLHttpRequest()
					: new ActiveXObject("Microsoft.XMLHTTP");
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var re = xmlhttp.responseText;
					if (re == "success") {
						window.location.href = "leave.jsp";
					} else {
						l5.innerHTML = "没有改变";
					}

				}
			}
			xmlhttp.open("POST", "http://localhost:8080/fistweb/leavechange2",
					true);
			xmlhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xmlhttp.send("leavephone=" + a + "&reason=" + b);
		}
	}

	// 点击按钮  就删除自己的离职申请
	function checkc() {
		var a = document.getElementById('ll').value;
		var l5 = document.getElementById('l6');
		var xmlhttp = window.XMLHttpRequest ? new XMLHttpRequest()
				: new ActiveXObject("Microsoft.XMLHTTP");
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var re = xmlhttp.responseText;
				if (re == "success") {
					window.location.href = "leave.jsp";
				} else {
					l5.innerHTML = "失败";
				}

			}
		}
		xmlhttp.open("POST", "http://localhost:8080/fistweb/deleteleave", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("id=" + a);
	}
</script>

</html>
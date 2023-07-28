<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/login.css">
<script type="text/javascript">
	let text = "<p>올바른 아이디를 입력하세요.</p>"; //전역변수
	//호이스팅이 무엇인가? let vs var?

	function checkID() {
		/* alert("!"); */
		let msg = document.getElementById("msg");
		msg.innerHTML = "<p>" + document.getElementById("ID").value
				+ "아이디를 변경했습니다.</p>";

	}

	function check() {
		let msg = document.getElementById("msg");
		let id = document.getElementById("ID");
		let pw = document.getElementById("PW");
		if (id.value.length == 0) {
			alert("ID를 입력하세요.")
			msg.innerHTML = text;
			id.focus();
			return false;
		}
		if (pw.value.length == 0) {
			alert("PW를 입력하세요.")
			pw.focus();
			return false;

		}

	}
</script>

</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="login">
		<h1>로그인</h1>
		<div class="login-form">
			<form action="./login" method="post">
				<div class="id">
					<input type="text" name="id" id="ID" placeholder="ID"
						required="required" maxlength="10" onchange="checkID()">
				</div>
				<div class="pw">
					<input type="password" name="password" id="PW"
						placeholder="PASSWORD">
				</div>

				<button onclick="return check()">로그인하기</button>
				<span id="msg"></span>
			</form>

아이디 찾기 | 비밀번호 찾기<button onclick="location.href='./join'"> 회원가입 </button>
		</div>


	</div>






</body>
</html>
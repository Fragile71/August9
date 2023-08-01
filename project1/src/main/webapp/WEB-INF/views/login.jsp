<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/login.css?version=0.1">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>

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
	//Jquery
	$(function() {

		$("#login").click(function() {
			//alert("!");
			let id = $("#id").val();
			let pw = $("#pw").val();

			if (id.length < 5) {

				alert("아이디를 입력하세요");
			} else {
				if (pw.length < 5) {
					alert("암호를 입력하세요.");
				} else {
					//아이디하고 암호하고 정확하게 입력되었습니다.
					let form = $("<form></form>");
					form.attr("method", "post");
					form.attr("action", "./login");

					form.append($("<input/>", {
						type : "hidden",
						name : "id",
						value : id
					}));
					form.append($("<input/>", {
						type : "hidden",
						name : "pw",
						value : pw
					}));
					form.appendTo("body");
					form.submit();
				}

			}

		});
	});
</script>

</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="login1">
		<h1>로그인</h1>

		<div class="login-form">
			<input type="text" id="id"> <br> 
			<input type="password" id="pw" name="pw">
			<button id="login">로그인</button>
			<form action="./login" method="post" onsubmit="return check()">
			</form>
			아이디 찾기 | 비밀번호 찾기
			<button onclick="location.href='./join'">회원가입</button>
		</div>


	</div>






</body>
</html>
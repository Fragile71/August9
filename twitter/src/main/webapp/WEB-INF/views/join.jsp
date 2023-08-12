<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<h1>회원가입 화면</h1>


<div class="join-div">
		<form action="./join" method="post">
		<h1>회원가입</h1>
		<hr>
		<div class="label-row">
			<div class="label-name">아이디</div>
			<div class="label-in">
				<input type="text" name="id" id="id">
			</div>
		</div>
		<div class="label-row" style="height: 40px" id="resultForm">
			<div class="label-name"></div>
			<div class="label-in"><span id="resultMSG"></span></div>
		</div>
		<div class="label-row">
			<div class="label-name">비밀번호</div>
			<div class="label-in">
				<input type="password" name="pw">
			</div>
		</div>
		<div class="label-row">
			<div class="label-name">이 름</div>
			<div class="label-in">
				<input type="text" name="name">
			</div>
		</div>
	
		<hr>
		<div class="label-row lrbtn">
			<button type="reset">취소</button>
			<button type="submit">가입하기</button>
		</div>
		</form>
		</div>

</body>
</html>
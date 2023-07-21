<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/login.css">
</head>
<body>
	<%@ include file="menu.jsp"%>
<div class="login">
<h1>로그인</h1>

<form action="./login" method="post">
<div class="id"><input type="text" name="id" placeholder="ID"  required="required"></div>
<div class="pw"><input type="password" name="password" placeholder="PASSWORD"></div>

<button>로그인하기 </button>
</form>

</div>


</body>
</html>
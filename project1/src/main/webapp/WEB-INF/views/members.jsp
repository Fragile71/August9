<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/board.css">
<link rel="stylesheet" href="./css/menu.css">

</head>
<body>
	<%@ include file="menu.jsp"%>
	<h1>회원게시판</h1>

	<table>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>mbti</th>
			<th>성별</th>
		</tr>





		<c:forEach items="${list }" var="m">
			<tr>
				<td>${m.no }</td>
				<td>${m.id }</td>
				<td>${m.name }</td>
				<td>${m.birth }</td>
				<td>${m.mbti}</td>
				<td>${m.gender }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
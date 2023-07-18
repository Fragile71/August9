<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import= "java.util.Date" %>
<%
Date now = new Date();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/detail.css">
<link rel="stylesheet" href="./resources/css/menu.css">
</head>
<body>
<%@ include file="menu.jsp" %>


<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" />



	<div class="content">
		<div class="title">
			${dto.btitle }
		</div>
		<div class="write">
			<div class="bwrite">
				${dto.bwrite }
			</div>
			<div class="blike">
				${dto.blike }
			</div>
		</div>
		<div class="date">
			<%= now %>
		</div>
		<div class="bcontent">
			${dto.bcontent }
		</div>
	</div>



</body>
</html>
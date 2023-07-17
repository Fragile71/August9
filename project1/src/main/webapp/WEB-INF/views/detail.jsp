<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/detail.css">
</head>
<body>
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
			${dto.bdate }
		</div>
		<div class="bcontent">
			${dto.bcontent }
		</div>
	</div>



</body>
</html>
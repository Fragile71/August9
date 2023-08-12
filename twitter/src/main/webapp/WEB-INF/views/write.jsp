<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel="stylesheet" href="./css/write.css">
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



<script type="text/javascript">
	function check() {
		let title = document.getElementById("title");
		let content = document.getElementById("content");
		if (title.value.length < 3) {
			alert("3글자이상쓰세요.")
			title.focus();
			return false;

			if (content.value.length < 3)
				alert("3글자이상쓰세요")
			content.focus();
			return false;

		}

	}
</script>




</head>



	
	
	<div class="write-div">
		<form action="./write" method="post">
			<textarea name="content" id=content></textarea>
			<button class="btn100 btn btn-primary" type="submit" onclick="return check()">게시하기</button>
		</form>
		<!-- type="submit => 제출버튼. 폼데이터로 데이터 전송 -->
	</div>



	
</html>
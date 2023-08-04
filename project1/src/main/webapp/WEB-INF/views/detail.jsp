<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/detail.css">
<link rel="stylesheet" href="./resources/css/menu.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

	function edit() {
		if (confirm("수정하시겠습니까?")) {
			location.href = "./edit?bno=${dto.bno }"

		}

	}
    $(function(){
	$(".commentBox").hide();
	$("#openComment").click(function(){
		$(".commentBox").show('slow');
		$("#openComment").remove();
		
	});
    	
	
});
	
	
	
	function del() {
		let chk = confirm("삭제하시겠습니까?"); //참 거짓으로 나옵니다.
		//alert(chk);
		if (chk) {
			location.href = "./delete?bno=${dto.bno }";

		}
	}
</script>

</head>
<body>
	<%@ include file="menu.jsp"%>






	<div class="content">
		<div class="title">
			제목 : ${dto.bno } / ${dto.btitle }
		
			<c:if test="${sessionScope.mid eq dto.m_id}">
				<img alt="" src="./img/update.png" onclick="edit()" width=30px
					height=30px>&nbsp;<img alt="" src="./img/delete.png"
					width=30px height=30px onclick="del()">

			 </c:if> 

		</div>
		<div class="write">
			<div class="bwrite">글쓴이 : ${dto.m_name }</div>
			<div class="blike">${dto.blike }</div>
		</div>
		<div class="date">작성일자 : ${dto.bdate }</div>
		<div class="ip">ip주소 : ${dto.bip }</div>
		<div class="bcontent">${dto.bcontent }</div>
	<c:choose>
<c:when test="${fn:length(commentsList) gt 0 }">
<div class="comments"></div>
<div class= "com">댓글목록 </div>
<c:forEach items="${commentsList }" var="c">

<div class="comment">

<div class = "cid"> ${c.m_id }</div>
<div class = "cname">${c.m_name }</div>
<div class = "cdate">/${c.c_date }</div>
<div class = ccomment>${c.c_comment }</div>
</div>


</c:forEach>


</c:when>
<c:otherwise>
<div><h2>댓글이 없어요</h2></div>
</c:otherwise>	
	
	</c:choose> 
	
	</div>

<c:if test="${sessionScope.mid ne null}">
<button type="button" id="openComment">댓글창 열기</button>
<div class = "commentBox">
	<form action="./comment" method="post">
	<textarea id= "commenttextarea" name="comment" placeholder="댓글을 입력하세요"></textarea>
	<button type= "submit" id= "comment">글쓰기</button>
	<input type="hidden" name= "bno" value="${dto.bno}"> 
	</form>
</div>
</c:if>


</body>
</html>
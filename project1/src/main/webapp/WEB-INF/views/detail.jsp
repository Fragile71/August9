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
   if(confirm("수정하시겠습니까?")){
      location.href="./edit?bno=${dto.bno }";
   }
}
</script>
<script type="text/javascript">
function del() {
   let chk = confirm("삭제하시겠습니까?");
   if(chk){
      location.href="./delete?bno=${dto.bno }";
   }
}
$(function() {
   $(".commentBox").hide();
   $("#openComment").click(function() {
      $(".commentBox").show('slow');
      $("#openComment").remove();
   });
});
//댓글 삭제 버튼 만들기 = 반드시 로그인 하고, 자신의 글인지 확인하는 검사
function cdel(cno) {
   if(confirm("댓글을 삭제하시겠습니까?")){
      location.href="./cdel?bno=${dto.bno}&cno="+cno;
   }
}
$(function() {
   $(".commentBox").hide();
   $("#openComment").click(function() {
      $(".commentBox").show('slow');
      $("#openComment").remove();
});
//댓글 삭제 다른 방법
$(".cdel").click(function() {
   if(confirm("댓글을 삭제하시겠습니까?")){
      let cno = $(this).parent().siblings(".cid").text();
      //alert(cno);
      //location.href="./cdel?bno=${dto.bno}&cno="+cno;
      let cno_comments =$(this).parents(".comment");
     
      $.ajax({
         url: "./cdelR",
         type: "post",
         data: {bno : ${dto.bno}, cno:cno},
         dataType: "json",
         success: function(data){
           if(data.result == 1){
        	cno_comments.remove();   
        	   
        	   /* $(this).parents(".comment").remove(); */
           }else{
        	   alert(data.result + "통신에 문제가 발생했습니다. 다시 시도해주세요")
           }
        	 
        	 
        	 //alert(data);
         },
         error: function(error){
            alert("에러가 발생했습니다 " + error);
         }
      });
   }
});
//댓글 수정 버튼 만들기 = 반드시 로그인 하고, 자신의 글인지 확인하는 검사
});
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
				<div class="com">댓글목록</div>
				<c:forEach items="${commentsList }" var="c">

					<div class="comment">

						<div class="cid">${c.c_no }</div>
						<div class="cname">${c.m_name }
						<c:if test="${sessionScope.mid eq c.m_id}">
					<img alt="" src="./img/update.png" onclick="edit()" width=30px
					height=30px>&nbsp;
					<img alt="" src="./img/delete.png"
					width=30px height=30px class="cdel" onclick="cdel1(${c.c_no})">
					</c:if>
						</div>
						<div class="cdate">/${c.c_date }</div>
						<div class=ccomment>${c.c_comment }</div>
					</div>


				</c:forEach>


			</c:when>
			<c:otherwise>
				<div>
					<h2>댓글이 없어요</h2>
				</div>
			</c:otherwise>

		</c:choose>

	</div>

	<c:if test="${sessionScope.mid ne null}">
		<button type="button" id="openComment">댓글창 열기</button>
		<div class="commentBox">
			<form action="./comment" method="post">
				<textarea id="commenttextarea" name="comment"
					placeholder="댓글을 입력하세요"></textarea>
				<button type="submit" id="comment">글쓰기</button>
				<input type="hidden" name="bno" value="${dto.bno}">
			</form>
		</div>
	</c:if>


</body>
</html>
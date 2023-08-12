<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/img.css">
<link rel="stylesheet" href="./resources/css/write.css">
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	
</script>

</head>





<body>




	<div class="wrapper">
		<div class="left-menu">
			<table>
				<tr onclick="link('main')">
					<td><img class="logo" alt="" src="./img/logo.png"
						onclick="check()"></td>
				</tr>
				<tr onclick="link('main')">
					<td><img class="img" alt="" src="./img/home.png"
						onclick="check()"></td>
				</tr>
				<tr onclick="link('search')">
					<td><img class="img" alt="" src="./img/search.png"
						onclick="check()"></td>
				</tr>
				<tr onclick="link('alarm')">
					<td><img class="img" alt="" src="./img/alarm.png"
						onclick="check()"></td>
				</tr>
				<tr onclick="link('message')">
					<td><img class="img" alt="" src="./img/message.png"
						onclick="check()"></td>
				</tr>
				<tr onclick="link('list')">
					<td><img class="img" alt="" src="./img/list.png"
						onclick="check()"></td>
				</tr>
				<tr onclick="link('verification')">
					<td><img class="img" alt="" src="./img/verification.png"
						onclick="check()"></td>
				</tr>
				<tr onclick="link('profile')">
					<td><img class="img" alt="" src="./img/profile.png"
						onclick="check()"></td>
				</tr>

				<c:choose>
					<c:when test="${sessionScope.mname eq null }">
						<tr class="upload" onclick="link('upload')">
							<td><img class="posting" alt="" src="./img/posting.png"
								onclick="check()"></td>
						</tr>
					</c:when>
				</c:choose>

			</table>
		</div>
		<div class="write-div">
			<div class="home" style="line-height: 300%">홈</div>
			<div class="recommend">&emsp;추천&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; 팔로우중</div>
			
				<form action="./write" method="post">
					<textarea name="content" id=content></textarea>
					<button class="btn100 btn btn-primary" type="submit"
						onclick="return check()">게시하기</button>
				</form>
				<!-- type="submit => 제출버튼. 폼데이터로 데이터 전송 -->
	       
	
	
	
			</div>
      
   	<div class="commentsList">
		<c:choose>
			<c:when test="${fn:length(commentsList) gt 0 }">
			<div class="comments">
				<c:forEach items="${commentsList }" var="c">
					<div class="comment">
						<div class="commentHead">
							<div class="cname">
								${c.m_name }(${c.m_id })
								<c:if test="${sessionScope.mid ne null && sessionScope.mid eq c.m_id}">
								<!-- sessionScope.mid ne null 이걸 왜 붙이는 걸까... 문제해결 -->
								<img alt="" src="./img/edit.png" class="cedit" onclick="cedit()">&nbsp;
								<img alt="" src="./img/delete.png" class="cdel" onclick="cdel1(${c.c_no })">
								</c:if>
							</div>
							<div class="cdate">${c.c_ip } / ${c.c_date }</div>
							<div class="cid">${c.c_no }</div>
						</div>
						<div class="commentBody">${c.c_comment }</div> 
					</div>			
				</c:forEach>
			</div>
			</c:when>
			<c:otherwise>
				<div><h2>글이 없습니다.</h2></div>
			</c:otherwise>
		</c:choose>
		</div>



               
		</div>
</body>








</html>


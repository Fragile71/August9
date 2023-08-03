<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="./css/board.css">
<link rel="stylesheet" href="./css/menu.css">

<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		//보드 내용 가져오기

		let totalCount = 0;
		let pageNo = 1;
		let startPage = 1;
		let endPage = 10;
		
		ajax_call(1);
		function ajax_call(pageNo) {
			//alert(totalCount);
			$.ajax({

				url : "./boardList2", //http://localhost/boardList2?pageNo=1
				type : "get",
				data : {
					"pageNo" : pageNo
				},
				dataType : "json",
				success : function(data) {
					totalCount = data.totalCount;
					pageNo = data.pageNo;
					console.log(totalCount);
					let list = data.list;
					$(".tableHead").empty();
					$(".paging").empty();
					let html = "";
					$.each(list, function(index) {
						html += "<tr>";
						html += "<td>" + list[index].bno + "</td>";
						html += "<td>" + list[index].btitle + "</td>";
						html += "<td>" + list[index].m_name + "</td>";
						html += "<td>" + list[index].bdate + "</td>";
						html += "<td>" + list[index].blike + "</td>";
						html += "</tr>";

					});

					$(".tableHead").append(html);

					/* for (let i = 0; i < list.length; i++) {
						$(".tableHead").append(
								"<tr><td>" + list[i].bno + "</td><td>"
										+ list[i].btitle + "</td><td>"
										+ list[i].m_name + "</td><td>"
										+ list[i].bdate + "</td><td>"
										+ list[i].blike + "</td></tr>");
					}
					 */
					let pages = totalCount / 10;
					//totalCount 나누기 10 했을때 나머지가 있으면 pages + 1 해
					if (totalCount % 10 != 0) {
						pages = pages + 1;

					}

					
					
					
					
					
					if (pageNo + 1 < pages) {
						$(".paging").append("<button class='first'>◀◀</button>");
						}else{
							
							$(".paging").append("<button disabled='disabled'>◀◀</button>");
							
							

						}
					
					
					
					if (pageNo + 1 < pages) {
						$(".paging").append("<button class='backward'>◀</button>");
						}else{
							$(".paging").append("<button disabled='disabled'>◀</button>");
						}
						
					
					
					
					
					for (var i = 1; i <= pages; i++) {

						$(".paging").append(
								"<button type='button' class='page'>" + i
										+ "</button>");
					}
					
					
					
					
					
					
					

					if (pageNo + 1 < pages) {

						$(".paging").append(
								"<button class='forward'>▶</button>");
					} else {
						$(".paging").append(
								"<button disabled='disabled'>▶</button>");
					}

					
					if (pageNo + 1 < pages) {
					$(".paging").append("<button class='last'>▶▶</button>");
					}else{
						$(".paging").append(
						"<button disabled='disabled'>▶▶</button>");
					}
					
					
					
					
					
					
				},
				error : function(error) {
					alert("에러가 발생했습니다. : " + error);
				}
			});//ajax end
		}//ajax_call

		$(document).on("click", ".page", function() { //동적인 경우에는 on
			 pageNo = $(this).text(); //this는 내가click한 것에 
			//alert(pageNo);
			ajax_call(pageNo);
		});

		$(document).on("click", ".forward", function() {
			pageNo = pageNo + 1;
			ajax_call(pageNo);

		});
		
		$(document).on("click", ".last", function() {
			pageNo =pageNo +10;
			ajax_call(pageNo);

		});
		
		
		$(document).on("click", ".backward", function() {
			pageNo = pageNo - 1;
			ajax_call(pageNo);

		});
		
		
		$(document).on("click", ".first", function() {
			pageNo = pageNo - 10;
			ajax_call(pageNo);

		});
		
		
		

	});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>


	<h1>보드2</h1>



	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>좋아요</th>
			</tr>
		</thead>
		<tbody class="tableHead"></tbody>
	</table>
	<div class="paging"></div>




</body>
</html>
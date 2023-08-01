<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/join.css?version=0.2">
<link rel="stylesheet" href="./css/menu.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#idCheck").click(function() {
			let id = $("#id").val();
			if (id == "" || id.length < 5) {
				
                
				$("#resultMSG").text("아이디는 5글자 이상이어야 합니다.");
				$("#resultMSG").css("color", "red");
				$("#id").focus();
                return false;
                
			}else{
				$.ajax({
					url: "./checkID",
					type: "post",
					data: {"id":id},   // checkID?id=poseidon
				    dataType: "html",   
					success: function(data){
						$("#resultMSG").text("data : "+ data);
						
					},
					error: function(request, status, error){
						
						$("#resultMSG").text("error : " + error);
					    console.log(error);
					}
					
					
				});
				
				
				
				$("#resultMSG").text(" 5글자 이상으로 들어왔습니다.")
				$("#resultMSG").css("color", "green");
			}
			
            return false;
		});

	});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="signup">
		<form action="./join" method="post">
			<h1>회원가입</h1>
			<div class="signup2">

				<div>
					<input type="text" name="id" id="id" placeholder="아이디를 입력하세요"
						required="required" maxlength="10" onchange="checkID()">
					<button id="idCheck">중복검사</button>
					<span id="resultMSG"></span>

				</div>

				<div>
					<input type="text" name="pw" id="pw" placeholder="비밀번호를 입력하세요"
						required="required" maxlength="10" onchange="checkID()">
				</div>


				<div>
					<input type="text" name="name" id="name" placeholder="이름을 입력하세요"
						required="required" maxlength="10" onchange="checkID()">
				</div>

				<div>
					<input type="text" name="addr" id="ADDR" placeholder="주소를 입력하세요"
						required="required" maxlength="40" onchange="checkID()">
				</div>


				<div>
					<input type="date" name="birth" id="BDATE" placeholder="생년월일"
						required="required" maxlength="8" onchange="checkID()">
				</div>

				<div>
					<select name="mbti">
						<option>MBTI 선택하세요</option>
						<optgroup label="내향형">
							<option value="ISTJ">ISTJ</option>
							<option value="ISTP">ISTP</option>
							<option value="ISFJ">ISFJ</option>
							<option value="ISFP">ISFP</option>
							<option value="INTJ">INTJ</option>
							<option value="INTP">INTP</option>
							<option value="INFJ">INFJ</option>
							<option value="INFP">INFP</option>
						</optgroup>
						<optgroup label="외향형">
							<option value="ESTJ">ESTJ</option>
							<option value="ESTP">ESTP</option>
							<option value="ESFJ">ESFJ</option>
							<option value="ESFP">ESFP</option>
							<option value="ENTJ">ENTJ</option>
							<option value="ENTP">ENTP</option>
							<option value="ENFJ">ENFJ</option>
							<option value="ENFP">ENFP</option>
						</optgroup>
					</select>




				</div>




				<div>
					<input type="radio" name="gender" id="m" value="1"> <label
						for="m">남자</label> <input type="radio" name="gender" id="f"
						value="0"> <label for="f">여자</label>
				</div>
			</div>

			<div class="label-row lrbtn">
				<button type='reset'>취소</button>
				<button type='button'>가입하기</button>
			</div>


		</form>


	</div>


</body>
</html>
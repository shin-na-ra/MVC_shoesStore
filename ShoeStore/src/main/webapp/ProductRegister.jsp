<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>E Shoes 제품 등록</title>
<!-- cdn -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="styles.css">
</head>

<script>
    function formatNumber(value) {
        // 숫자만 추출
        let number = parseFloat(value.replace(/,/g, ''));
        // 3자리마다 쉼표 추가
        let formattedNumber = number.toLocaleString();
        
        // 입력값 업데이트
        if (!isNaN(number)){
	        document.registerForm.price.value = formattedNumber;
        }
    }
</script>

<body>

	<!-- Nav 설정 -->
	<jsp:include page="AdminNav.jsp" />

	<div class="container my-5">
		<h1>E Shoes Admin Products Register Page</h1>
		<br>
		<hr class="col-8 my-4">
	</div>
	<br>

	<!-- <div class="card ml-100 w-50" style="max-width: 18rem;">
		<img src="..." class="card-img-top" alt="이미지를 불러오는데 실패하였습니다.">
		
		<div class="card-body text-center">
			<p class="card-text">Some quick example text to build on the card
				title and make up the bulk of the card's content.</p>
		</div>
		
		<div class="additional-text text-center">
			<p class="card-text">Some quick example text to build on the card
				title and make up the bulk of the card's content.</p>
		</div>
	</div> -->

	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<!-- 좌측에 카드 배치 -->
				<div class="card-body"
					style="margin-left: 100px; width: 400px; height: 500px;">
					<img src="..." class="card-img-top"
						alt="이미지를 불러오는데 실패하였습니다ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ">
				</div>
			</div>
			<div class="col-md-6">
				<!-- 우측에 추가 텍스트 배치 -->
				<div class="additional-text ml-md-auto">
					<form action="update.do" name="registerForm">
						<p style="font-size: 26px;">
							브랜드 &nbsp;&nbsp;:&nbsp;&nbsp;&nbsp; <select name="color"
								style="width: 200px;  padding-left: 10px;">
								<option>Newbalance</option>
								<option>Nike</option>
								<option>Adidas</option>
								<option>Vans</option>
							</select>
						</p>

						<p style="font-size: 28px;">
							이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp; <input
								type="text" name="name"
								style="width: 300px; height: 35px; font-size: 22px; padding-left: 10px;">
						</p>

						<p style="font-size: 28px;">
							색상 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp; <select
								name="color" style="width: 150px; padding-left: 10px;">
								<option>Black</option>
								<option>White</option>
								<option>Blue</option>
								<option>Red</option>
							</select>
						</p>

						<p style="font-size: 28px;">
							가격 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp; <input
								type="text" name="price"
								style="width: 150px; height: 35px; font-size: 22px; padding-right: 7px; text-align: right;"
								oninput="formatNumber(this.value)"> &nbsp;&nbsp;원
						</p>
						<p style="font-size: 28px;">
							수량 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp; 
							<select name="qty" style="width: 100px; text-align: right;  padding-right: 5px;">
								<c:forEach var="i" begin="1" end="100">
									<option>${i}</option>
								</c:forEach>
							</select> 
							&nbsp;개
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
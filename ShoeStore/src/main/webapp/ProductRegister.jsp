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
    
    function checkInput() {
		let regExpPrice = /^[0-9,]+$/;
		
		let form = document.registerForm;
		
		let name = form.name.value;
		let price = form.price.value;
		let brand = form.brand.value;
		let color = form.color.value;
		let qty = form.qty.value;
		
		if(brand == "unselecte"){
			alert("브랜드를 선택해 주세요.")
			form.brand.select()
			return
		}
			
		if(name == ""){
			alert("이름을 입력해 주세요.")
			form.name.select()
			return
		}
		
		if(color == "unselecte"){
			alert("색상을 선택해 주세요.")
			form.brand.select()
			return
		}
		
		if(price == ""){
			alert("가격을 입력해 주세요.")
			form.price.select()
			return
		}
		
		if(!regExpPrice.test(price)) {
			alert("가격은 숫자만 입력 가능합니다.")
			form.price.select()
			return
		}
		
		if(qty == "unselecte"){
			alert("수량을 선택해 주세요.")
			form.qty.select()
			return
		}
		
		form.submit();
		
    }
    
    function upload() {
		let form = document.uploadButton;
		form.submit();
	}
</script>
 	
<body>

	<!-- Nav 설정 -->
	<jsp:include page="AdminNav.jsp" />

	<div class="container my-5">
		<h1>E Shoes Admin Products Register Page</h1>
		<br>
		<hr class="col-12 my-4">
	</div>
	<br>

	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<!-- 좌측에 카드 배치 -->
				<div class="card-body"
					style="margin-left: 100px; width: 400px; height: 500px;">
					<img
						src="<%=(String)session.getAttribute("imagePath") %>"
						class="card-img-top" alt="이미지11111111111111111111111">
				</div>
			</div>
			<div class="col-md-6">
				<!-- 우측에 추가 텍스트 배치 -->
				<div class="additional-text ml-md-auto">
					<form action="update.do" name="registerForm" method="post" enctype="multipart/form-data">
							<div class="form-floating"> 
							<!-- 브랜드 선택 combobox -->
							<select class="form-select" id="floatingSelect" name="brand"
							style="font-size: 20px; height: 60px; width: 450px">
								<option value="unselecte">선택</option> 
								<option value="Newbalance">Newbalance</option>
								<option value="Nike">Nike</option>
								<option value="Adidas">Adidas</option>
								<option value="Vans">Vans</option>
							</select>
							<label for="floatingSelect">브랜드 선택</label>
							</div>
						<br><br>
						<!-- 이름 입력 text -->
						<div class="form-floating">
						<input type="text" name="name" class="form-control" id="priceInputValue"
						 style="width: 300px;  height: 65px; font-size: 20px; padding-right: 7px; ">
						 <label for="priceInputValue">이름</label>
 							</div>
 						<br><br>
							<!-- 색상 선택 combobox -->
						<div class="form-floating"> 
							<select name="color" class="form-select" id="floatingSelect" 
							style="height: 65px; width: 450px; font-size: 20px;">
								<option value="unselecte">선택</option> 
								<option value="Black">Black</option>
								<option value="White">White</option>
								<option value="Blue">Blue</option>
								<option value="Red">Red</option>
							</select>
							<label for="floatingSelect">색상 선택</label>
						</div>
						<br><br>
						<!-- 가격 입력 text -->
							<div class="form-floating">
							<input type="text" class="form-control" name="price" id="priceInputValue" oninput="formatNumber(this.value)"
							 style="width: 200px; height: 60px; font-size: 20px; padding-right: 7px;">
							 <label for="priceInputValue">가격(원)</label>
  							</div>
  							<br><br>
  							<!-- 수량 선택 combobox -->
						<div class="form-floating">
							<select name="qty" class="form-select" id="floatingSelect"
							 style="width: 150px; height:40px; padding-right: 5px; font-size: 17px;">
							 	<option value="unselecte" selected="selected">선택</option> 
								<c:forEach var="i" begin="1" end="50">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
							<label for="floatingSelect">수량 선택(개)</label>
						</div>
				</div>
			</div>
 		</div>
 			</form>
 		<br>
 		<form action="upload.do" name="uploadButton" enctype="multipart/form-data" method="post">
 		 <div class="form-floating" style="margin-left: 45px;">
        	<input type="file" name="image" class="form-control" id="fileInput" accept="image/*"
        	style="width: 500px;" onclick="upload()">
        <label for="fileInput">사진 업로드</label>
    </div>
    </form>
	<br><br>
	<div class="container text-center">
		<div class="row">
			<button type="button" class="btn btn-primary btn-lg mb-5"
				onclick="checkInput()">제품 등록</button>
		</div>
	</div>

	<footer class="text-muted py-5">
		<div class="container">
			<p class="float-end mb-1">
				<a href="#">Back to top</a>
			</p>
			<p class="mb-1">Album example is &copy; Bootstrap, but please
				download and customize it for yourself!</p>
			<p class="mb-0">
				New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a
					href="../getting-started/introduction/">getting started guide</a>.
			</p>
		</div>
	</footer>

</body>
</html>
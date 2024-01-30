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
<%-- <%
	String configPath = application.getRealPath("/file");
	session.setAttribute("configPath", configPath);
%> --%>
<script>
	function formatNumber(value) {
		// 숫자만 추출
		let number = parseFloat(value.replace(/,/g, ''));
		// 3자리마다 쉼표 추가
		let formattedNumber = number.toLocaleString();
		// 입력값 업데이트
		if (!isNaN(number)) {
			document.registerForm.price.value = formattedNumber;
		}
	}

	function checkInput() {
		let regExpPrice = /^[0-9,]+$/;
	/* 	let regExpColor = /^[가-힣|a-z|A-Z|0-9|/]+$/; */
		let regExpSize = /^[0-9]+$/;
		let regExpMaterial = /^[a-zA-Z가-힣0-9 %]+$/;
		let regExpCompany = /^[a-zA-Z가-힣0-9 ]+$/;
		let regExpMadein = /^[가-힣a-zA-Z/]+$/;
		
		let form = document.registerForm;

		let brand = form.brand.value;
		let name = form.name.value;
		let kname = form.kname.value;
		let color = form.color.value;
		let size = form.size.value;
		let price = form.price.value;
		let qty = form.qty.value;
		let material = form.material.value;
		let company = form.company.value;
		let madein = form.madein.value;

		if (brand == "unselecte") {
			alert("브랜드를 선택해 주세요.")
			form.brand.select()
			return
		}

		if (kname == "") {
			alert("이름을 입력해 주세요.")
			form.kname.select()
			return
		}
		
		if (name == "") {
			alert("영문명을 입력해 주세요.")
			form.name.select()
			return
		}

	/* 	if (color == "") {
			alert("색상을 입력해 주세요.")
			form.color.select()
			return
		}
		
		if (!regExpColor.test(color)) {
			alert("색상은 영문 및 한글만 입력 가능합니다.")
			form.color.select()
			return
		} */
		
		if (size == "") {
			alert("사이즈를 입력해 주세요.")
			form.size.select()
			return
		}
		
		if (!regExpSize.test(size)) {
			alert("사이즈는 숫자만 입력 가능합니다.")
			form.size.select()
			return
		}

		if (price == "") {
			alert("가격을 입력해 주세요.")
			form.price.select()
			return
		}

		if (!regExpPrice.test(price)) {
			alert("가격은 숫자만 입력 가능합니다.")
			form.price.select()
			return
		}

		if (qty == "unselecte") {
			alert("수량을 선택해 주세요.")
			form.qty.select()
			return
		}
		
		if (material == "") {
			alert("소재를 입력해 주세요.")
			form.material.select()
			return
		}
		
		if (!regExpMaterial.test(material)) {
			alert("소재는 '%'를 제외한 특수문자 입력이 불가능합니다.")
			form.material.select()
			return
		}
		
		if (company == "") {
			alert("제조사를 입력해 주세요.")
			form.company.select()
			return
		}
		
		if (!regExpCompany.test(company)) {
			alert("제조사는 특수문자 입력이 불가능합니다.")
			form.company.select()
			return
		}
		
		if (madein == "") {
			alert("제조국을 입력해 주세요.")
			form.madein.select()
			return
		}
		
		if (!regExpMadein.test(madein)) {
			alert("제조국은 영문 및 한글만 입력 가능합니다.")
			form.madein.select()
			return
		}
		
		alert("등록이 완료되었습니다.");
		
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
	<!-- 좌측 -->
		<div class="row">
			<div class="col-md-6">
				<div class="additional-text ml-md-auto">
					<form action="update.do" name="registerForm" method="post"
						enctype="multipart/form-data">
						<div class="form-floating" style="margin-left: 20px;">
							<input type="file" name="image1" class="form-control"
								id="fileInput" accept="image/*"
								style="width: 500px; height: 60px; margin-bottom: 25px">
							<label for="fileInput">메인 사진 업로드</label>
						</div>
						<!-- <div class="form-floating" style="margin-left: 20px;">
							<input type="file" name="image2" class="form-control"
								id="fileInput" accept="image/*"
								style="width: 500px; height: 60px; margin-bottom: 25px">
								<label for="fileInput">사진 업로드</label>
						</div>
						<div class="form-floating" style="margin-left: 20px;">
							<input type="file" name="image3" class="form-control"
								id="fileInput" accept="image/*"
								style="width: 500px; height: 60px; margin-bottom: 26px"> 
								<label for="fileInput">사진 업로드</label>
						</div> -->
						<div class="form-floating" style="margin-left: 21px;">
							<label for="descriptionInput">상세 설명</label>
							<textarea name="description" class="form-control"
								id="descriptionInput"
								style="width: 500px; height: 411px; font-size: 20px; padding-top: 60px;"></textarea>
						</div>
						<br><br>
						<table class="table table-hover" style="width: 500px; margin-left: 20px;">
							<thead>
							<tr>
							<th colspan="5" style="text-align: center;">최근 기록(가장 최근 5개)</th>
							</tr>
								<tr>
									<th scope="col">신발 이름</th>
									<th scope="col">관리자 ID</th>
									<th scope="col">수량</th>
									<th scope="col">날짜</th>
									<th scope="col">유형</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${registerLog}" var="log">
								<tr>
									<th scope="row">${log.name}</th>
									<td>${log.admin}</td>
									<td>${log.qty}</td>
									<td>${log.date}</td>
									<td>${log.type}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table></div>
			</div>
			<div class="col-md-6">
				<!-- 우측 -->
				<div class="additional-text ml-md-auto">
					<div class="form-floating">
						<!-- 브랜드 선택 combobox -->
						<select class="form-select" id="floatingSelect" name="brand"
							style="font-size: 20px; height: 60px; width: 450px">
							<option value="unselecte">선택</option>
							<option value="NEW BALANCE">NEW BALANCE</option>
							<option value="NIKE">NIKE</option>
							<option value="ADIDAS">ADIDAS</option>
							<option value="VANS">VANS</option>
							<option value="CONVERSE">CONVERSE</option>
						</select> <label for="floatingSelect">브랜드 선택</label>
					</div>
					<br>
					<!-- 이름 입력 text -->
					<div class="form-floating">
						<input type="text" name="kname" class="form-control"
							id="priceInputValue"
							style="width: 450px; height: 65px; font-size: 20px; padding-right: 7px;">
						<label for="priceInputValue">이름</label>
					</div>
					<br>
					<div class="form-floating">
						<input type="text" name="name" class="form-control"
							id="priceInputValue"
							style="width: 450px; height: 65px; font-size: 20px; padding-right: 7px;">
						<label for="priceInputValue">영문명</label>
					</div>
					<br>
					<!-- 색상 선택 combobox -->
					<div class="form-floating">
						<input type="text" name="color" class="form-control"
							id="sizeInput"
							style="height: 60px; width: 300px; font-size: 20px;"> <label
							for="sizeInput">색상 입력</label>
					</div>
					<br>
					<div class="form-floating">
						<input type="text" class="form-control" name="size" id="sizeInput"
							style="width: 200px; height: 60px; font-size: 20px; padding-right: 7px;">
						<label for="sizeInput">사이즈 입력</label>
					</div>
					<br>
					<!-- 가격 입력 text -->
					<div class="form-floating">
						<input type="text" class="form-control" name="price"
							id="priceInputValue" oninput="formatNumber(this.value)"
							style="width: 200px; height: 60px; font-size: 20px; padding-right: 7px;">
						<label for="priceInputValue">가격(원)</label>
					</div>
					<br>
					<!-- 수량 선택 combobox -->
					<div class="form-floating">
						<select name="qty" class="form-select" id="floatingSelect"
							style="width: 150px; height: 40px; padding-right: 5px; font-size: 17px;">
							<option value="unselecte" selected="selected">선택</option>
							<c:forEach var="i" begin="1" end="50">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select> <label for="floatingSelect">수량 선택(개)</label>
					</div>
					<br>
					<div class="form-floating">
						<input type="text" name="material" class="form-control"
							id="materialInput"
							style="width: 450px; height: 65px; font-size: 20px; padding-right: 7px;">
						<label for="materialInput">소재</label>
					</div>
					<br>
					<div class="form-floating">
						<input type="text" name="company" class="form-control"
							id="companyInput"
							style="width: 450px; height: 65px; font-size: 20px; padding-right: 7px;">
						<label for="companyInput">제조사</label>
					</div>
					<br>
					<div class="form-floating">
						<input type="text" name="madein" class="form-control"
							id="madeinInput"
							style="width: 400px; height: 65px; font-size: 20px; padding-right: 7px;">
						<label for="madeinInput">제조국</label>
					</div>
				</div>
			</div>
		</div>
		</form>
		<br> <br> <br>
		<div class="container text-center">
			<div class="row">
				<button type="button" class="btn btn-primary btn-lg mb-5"
					onclick="checkInput()">제품 등록</button>
			</div>
		</div>

		<footer class="text-muted py-5">
			<jsp:include page="footer.jsp" flush="false" />
		</footer>
	</body>
</html>
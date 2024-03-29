<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>${name}</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/album/">
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}
/* 구매 버튼 */
.c-button__primary {
	display: inline-block;
	padding: 10px 20px;
	border: 2px solid #000;
	border-radius: 3px;
	color: #fff;
	background-color: #000;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	transition: background-color 0.3s ease;
}
/* 구매 버튼 마우스 가져다 됬을 때 */
.c-button__primary:hover {
	background-color: rgb(66, 66, 66, 0.5);
	border: 2px solid #000;
	border-radius: 3px;
}
/* 사이즈 버튼 */
.c-chip, .c-chip1 {
	display: inline-block;
	padding: 10px 20px;
	border: 1px solid #DCDCDC;
	border-radius: 1px;
	color: #000;
	background-color: #fff;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	transition: background-color 0.3s ease;
	margin: 5px 5px;
}
/* 사이즈 마우스 가져다 됬을 때 */
.c-chip:hover, .c-chip1:hover {
	border: 1px solid #000;
}
/* 사이즈 버튼 활성화시 */
.c-chip.active, .c-chip1.active {
	border: 1px solid #000;
}
/* 상단 브랜드 네임 */
.c-flag__item {
	display: inline-block;
	padding: 1px 5px;
	margin-bottom: 5px;
	border: 1px solid #000;
	border-radius: 3px;
	color: #000;
	background-color: #fff;
	text-align: center;
	text-decoration: none;
	font-size: 10px;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg"
			style="background-color: #E3F2FD; height: 90px;">
			<div class="container d-flex justify-content-between">
				<a href="shoesList.do" class="navbar-brand" style="font-size: 30px">
					<strong>E Shoe</strong>
				</a>
				<div class="input-group" style="width: 30%; text-align: left;">
					<form action="search.do" method="post" name="searchAction">
						<input id="searchInput" name="searchInput" class="form-control"
							style="font-size: 14px;">
						<!-- 검색을 클릭하면 밑에 script로 이동 -->
					</form>
					&nbsp;
					<button type="button" onclick="searchShoes()"
						class="btn btn-outline-success"
						style="font-size: 15px; height: 40px;">검색</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<form action="logout.do">
						<button type="submit" class="btn btn-dark" style="height: 40px">로그아웃</button>
					</form>
				</div>
			</div>
		</nav>
	</header>
	<!-- 사이즈 클릭 후 구매하기 버튼을 누르면 작동하는 함수 -->
	<script>
		/* 검색을 위한 formaction */
		function searchShoes() {
			var search = document.searchAction;
			search.submit();
		}
		function selectSize(button) {
			// 모든 버튼들 스타일 초기화
			var buttons = document.querySelectorAll('.c-chip1');
			buttons.forEach(function(btn) {
				btn.style.backgroundColor = ''; // 배경 초기화
				btn.style.border = ''; // 보더 초기화
			});
			// 클릭 시 배경화면 색상 설정
			button.style.backgroundColor = 'white';
			button.style.border = '1px solid black'; // Set border and color
			document.getElementById("hiddenSize").value = button.value;
		}
		function alertSize(event) {
			event.preventDefault();
			var button = event.target;
			button.style.pointerEvents = "none";
			button.style.opacity = "0.5";
		}
		/* 선택한 사이즈를 보내는 formaction */
		function sendSize() {
			alert("구매가 완료 되었습니다.");
			var s = document.buy;
			s.submit();
		}
	</script>
	<c:forEach items="${shoesInfo}" var="info">
		<main>
			<div class="container-fluid">
				<div class="row">
					<!-- 이미지 불러오기 -->
					<div class="col-md-6">
						<div class="album py-5 bg-light">
							<div class="container">
								<div class="row row-cols-1 row-cols-md-1 g-4">
									<!-- 이미지 정보를 imageList로부터 가져온다 -->
									<c:forEach items="${imageList}" var="images">
										<div class="col">
											<div class="card shadow-sm"
												style="width: 516px; height: 645px; margin-left: 30%;">
												<svg class="bd-placeholder-img card-img-top" width="100%"
													height="0px" xmlns="http://www.w3.org/2000/svg" role="img"
													aria-label="Placeholder: Thumbnail"
													preserveAspectRatio="xMidYMid slice" focusable="false">
 <img src="${pageContext.request.contextPath}/file/${images.image}" alt="Shoe Image">
 </svg>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<!-- information 불러오기-->
					<div class="col-md-6">
						<div class="sticky-container"
							style="position: sticky; top: 50px; margin-top: 50px; margin-left: 50px">
							<!-- <div class="sticky-container" style="top: -454px; margin-top: 50px"> -->
							<!-- Add your description and information content here -->
							<!-- <div class="l-grid__col-detail"> -->
							<div class="l-grid__row" data-ui-type="Detail_Item_Base">
								<div class="dtl-title">
									<div class="c-flag ">
										<span class="c-flag__item ">${info.brand}</span>
									</div>
									<h2>${info.name}</h2>
									<span class="sub-txt">${info.kname}</span>
								</div>
								<br>
								<div class="dtl-price-wrap">
									<dl class="dtl-price">
										<div class="dtl-price__discount">
											<dt>₩ ${info.price}</dt>
										</div>
									</dl>
								</div>
							</div>
							<br> <br>
							<form action="purchase.do" method="post" name="buy">
								<div class="l-grid__row" data-ui-type="Detail_Item_Option">
									<section>
										<h3>SIZE</h3>
										<div class="c-chip-input">
											<!-- 신발 사이즈 shoesSize로부터 불러온다 -->
											<c:forEach items="${shoesSize}" var="shoeSize">
												<c:choose>
													<c:when test="${shoeSize.qty > 0}">
														<input class="c-chip1" type="button"
															id="size_${shoeSize.size}" name="size"
															value="${shoeSize.size}" onclick="selectSize(this)">
													</c:when>
													<c:otherwise>
														<input class="c-chip" type="button"
															style="background-color: lightgray; color: white; opacity =0.5; pointer-events: none"
															id="soldoutSize_${shoeSize.size}" name="soldoutSize"
															value="${shoeSize.size}" onclick="alertSize(event)">
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</div>
									</section>
									<br>
									<div class="btm-drawer open">
										<div class="c-btn_wrap" align="left">
											<!-- size 넘기기 위한 히든 인풋 -->
											<input type="hidden" class="c-button__hide" name="hiddenSize"
												id="hiddenSize">
											<!-- 보이는 버튼 -->
											<input type="button" class="c-button__primary"
												value="BUY NOW" onclick="sendSize()">
										</div>
									</div>
								</div>
							</form>
							<br> <br>
							<div class="l-grid__row" data-ui-type="Detail_Item_Description">
								<section>
									<!-- 만약 info.description이 null이 아닐 때만 보여준다 -->
									<c:if test="${not empty info.description}">
										<h3>DESCRIPTION</h3>
										<div class="dtl-brand__cont">
											<p style="font-size: 14px">
												${info.description}<br>
											</p>
										</div>
									</c:if>
									<br>
									<ul class="dot-list">
										<li>COLOR : ${info.color}</li>
									</ul>
								</section>
							</div>
							<br> <br>
							<div class="l-grid__row" data-ui-type="Detail_Item_Info">
								<div class="c-accordion">
									<div class="c-accordion__item ">
										<strong>DETAILS</strong>
									</div>
									<br>
									<div class="c-accordion__detail" style="font-size: 14px">
										<ul>
											<li>제품 주소재: ${info.metarial}</li>
											<li>색상: ${info.color}</li>
											<li>치수: ${minSize}-${maxSize}</li>
											<li>제조자: ${info.company}</li>
											<li>제조국: ${info.madein}</li>
											<li>취급시 주의사항: 상품상세 참조</li>
											<li>품질보증기준: 상품상세 참조</li>
											<li>A/S 책임자와 전화번호: 상품상세 참조</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</c:forEach>
	<footer class="text-muted py-5">
		<jsp:include page="footer.jsp" flush="false" />
	</footer>
	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
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
<title>E SHOE</title>

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
			style="background-color: #e3f2fd; height: 90px;">
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

	<script>
	function searchShoes() {
	  	var search = document.searchAction;
	  		  
	  	search.submit();
	}
	  
	<!-- JavaScript function to submit the form -->
    function submitForm(code) {
        // hidden으로 되어 있는 codeInput에 데이터를 넘겨주며
        document.getElementById("codeInput").value = code;
        
        // myform을 실행한다.
        document.getElementById("myForm").submit();
    }
</script>

	<main>

		<div class="album py-5 bg-light">
			<div class="container">
				<div class="row row-cols-1 row-cols-md-3 g-4">
					<!-- 모든 제품들을 출력 -->
					<c:forEach items="${shoesList}" var="dto">
						<%-- <input type="hidden" id="Kbrand" value="${dto.kbrand}">
	      	<input type="hidden" id="Kname" value="${dto.kname}"> --%>
						<div class="col">
							<!-- 카드 클릭 시 function submitForm(dto.code) 코드를 넘겨준다. -->
							<a href="#" onclick="submitForm('${dto.code}');"
								style="text-decoration: none;">
								<div class="card shadow-sm">
									<svg class="bd-placeholder-img card-img-top" width="100%"
										height="0px" xmlns="http://www.w3.org/2000/svg" role="img"
										aria-label="Placeholder: Thumbnail"
										preserveAspectRatio="xMidYMid slice" focusable="false">
		                <title>Placeholder</title>
		                <img src="${dto.image}" alt="Shoe Image">
		                <text x="50%" y="50%" fill="#eceeef" dy=".3em"
											align="center" text-anchor="middle"
											style="font-weight: bold;">${dto.brand}</text>
		                <%-- <text x="10%" y="10%" fill="#eceeef" dy=".3em" align="center" style="font-weight: bold;">${dto.brand}</text> --%>
		              </svg>
									<div class="card-body">
										<p class="card-text" align="center">${dto.name}<br>₩
											${dto.price}
										</p>
									</div>
								</div>
							</a>
							<!-- a 태그 클릭시 이 폼이 실행된다. -->
							<form id="myForm" action="purchase_view.do" method="post"
								style="display: none;">
								<input type="hidden" name="code" id="codeInput">
							</form>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</main>

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


	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>

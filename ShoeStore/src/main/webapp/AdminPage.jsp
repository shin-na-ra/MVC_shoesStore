<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!doctype html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <!-- cdn -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container">
        <a class="navbar-brand" href="AdminPage.jsp">E Shoe</a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
         <!--    <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Home</a>
            </li> -->
           <!--  <li class="nav-item">
              <a class="nav-link" href="#">register</a>
            </li> -->
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Products
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">등록</a></li>
                <li><a class="dropdown-item" href="#">수정</a></li>
                <li><a class="dropdown-item" href="#">삭제</a></li>
              </ul>
            </li>
            
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
               	매출
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">일별</a></li>
             <!--    <li><hr class="dropdown-divider"></li> -->
                <li><a class="dropdown-item" href="#">월별</a></li>
              </ul>
            </li>
            <!-- <li class="nav-item">
              <a class="nav-link disabled">Disabled</a>
            </li> -->
          </ul>
          <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="검색" aria-label="Search">
            <button class="btn btn-outline-success" type="submit" style="width: 90px">검색</button>
          </form>
        </div>
      </div>
    </nav>

    <div class="container my-5">
      <h1>E Shoes Admin Page</h1><br>
        <a href="https://getbootstrap.com" class="btn btn-primary" style="width: 110px">제품 등록</a>&nbsp;&nbsp;&nbsp;
        
        <hr class="col-4 my-4">
        
      <div class="col-lg-10 px-0">
        <p class="fs-5">현재 판매 중인 상품</p>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="main.js"></script>

	<div class="container">
		<c:forEach items="${products}" var="dto" varStatus="loop">
			<%-- 매 4번째 제품마다 행을 시작 --%>
			<c:if test="${loop.index % 4 == 0}">
				<div class="row justify-content-center">
			</c:if>

			<div class="col mx-4">
				<div class="card">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">제품명</h5>
						<p class="card-text" align="left">
							제품코드 : ? <br>브랜드 : ?<br>색상 : ?<br>가격 : ?<br>사이즈
							: ?<br>남은 재고 : ?
						</p>
					</div>
				</div>
			</div>

			<%-- 매 4번째 제품마다 행을 종료 --%>
			<c:if test="${(loop.index + 1) % 4 == 0 or loop.last}">
	</div>
	</c:if>
	</c:forEach>
	</div>

</body>
</html>
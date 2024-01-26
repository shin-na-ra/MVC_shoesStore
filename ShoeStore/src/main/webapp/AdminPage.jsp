<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <!-- cdn -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
  </head>
  <body>
    
    <!-- Nav 설정 -->
	<jsp:include page="AdminNav.jsp" />
	
    <div class="container my-5">
      <h1>E Shoes Admin Main Page</h1><br>
        <a href="productregister.do" class="btn btn-primary" style="width: 110px">제품 등록</a>&nbsp;&nbsp;&nbsp;
        
        <hr class="col-4 my-4">
        
      <div class="col-lg-10 px-0">
        <p class="fs-5">현재 판매 중인 상품</p>
      </div>
    </div>

  <!--   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="main.js"></script> -->

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
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
        <a href="ProductRegister.jsp" class="btn btn-primary" style="width: 110px">제품 등록</a>&nbsp;&nbsp;&nbsp;
        <a href="#" class="btn btn-warning" style="width: 110px">제품 수정</a>&nbsp;&nbsp;&nbsp;
        
        <hr class="col-12 my-4">
        
      <div class="col-lg-10 px-0">
        <p class="fs-5">현재 판매 중인 상품</p>
      </div>
    </div>

  <!--   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="main.js"></script> -->

	<%-- <div class="container">
		<c:forEach items="${products}" var="dto" varStatus="loop">
		<c:forEach begin="0" end="5" varStatus="loop">
			매 4번째 제품마다 행을 시작
			 <c:if test="${loop.index % 3 == 0}">
            <div class="row justify-content-center">
        </c:if>
			 <div class="col mx-4" style="margin-top: 10px; margin-bottom: 10px;">
				<div class="card" style="width: 250px;">
					<img src="https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b7d9211c-26e7-431a-ac24-b0540fb3c00f/%EC%97%90%EC%96%B4-%ED%8F%AC%EC%8A%A4-1-07-%EB%82%A8%EC%84%B1-%EC%8B%A0%EB%B0%9C-TttlGpDb.png" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">제품명</h5>
						<p class="card-text" align="left">
							제품코드 : ? <br>브랜드 : ?<br>색상 : ?<br>가격 : ?<br>사이즈
							: ?<br>남은 재고 : ?
						</p>
					</div>
				</div>
			</div>
			매 4번째 제품마다 행을 종료
			 <c:if test="${(loop.index + 1) % 3 == 0 or loop.last}">
            </div>
        </c:if>
		</c:forEach>
	</div> --%>
	
	<div class="container">
    <div class="row">
      <%--  <c:forEach begin="0" end="5" varStatus="loop"> --%>
      <c:forEach items="${products}" var="dto" varStatus="loop">
            <div class="col-md-3 mb-5"> <%-- 한 행에 4개의 열을 가지도록 지정 --%>
                <div class="card" style="width: 250px; height: 550px;">
                    <%-- 이미지 소스와 기타 제품 정보를 동적으로 표시 --%>
                   <img src="${pageContext.request.contextPath}/file/${dto.image}"
                    class="card-img-top" alt="..." style="height: 300px;">
                    <div class="card-body">
                        <h5 class="card-title">${dto.name}</h5>
                        <p class="card-text" align="left">
                            <%-- 기타 제품 정보를 동적으로 표시 --%>
                            제품코드 : ${dto.code } <br>브랜드 : ${dto.brand }<br>색상 : ${dto.color}<br>가격 : ${dto.price}<br>사이즈
                            : ${dto.size}<br>남은 재고 : ${dto.qty}
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
	
	<footer class="text-muted py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1">Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
    <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="../getting-started/introduction/">getting started guide</a>.</p>
  </div>
</footer>

</body>
</html>
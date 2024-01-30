<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>E Shoes 관리자 홈페이지</title>
    <!-- cdn -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
  </head>
  
<script type="text/javascript">
  
	function showAlert() {
		alert("미구현 기능입니다.");
	}
</script>  

  <body>
    <!-- Nav 설정 -->
	<jsp:include page="AdminNav.jsp" />
	
    <div class="container my-5">
      <h1>E Shoes Admin Main Page</h1><br>
        <a href="register.do" class="btn btn-primary" style="width: 110px">제품 등록</a>&nbsp;&nbsp;&nbsp;
        <a href="#" class="btn btn-warning" style="width: 110px" onclick="showAlert()">제품 수정</a>&nbsp;&nbsp;&nbsp;
        
        <hr class="col-12 my-4">
        
      <div class="col-lg-10 px-0">
        <p class="fs-5">현재 판매 중인 상품</p>
      </div>
    </div>

	<div class="container">
    <div class="row">
      <c:forEach items="${products}" var="dto" varStatus="loop">
            <div class="col-md-3 mb-5"> <%-- 한 행에 4개의 열을 가지도록 지정 --%>
                <div class="card" style="width: 250px; height: 550px;">
                   <img src="${pageContext.request.contextPath}/file/${dto.image}"
                    class="card-img-top" alt="..." style="height: 300px;">
                    <div class="card-body">
                        <h5 class="card-title">${dto.name}</h5>
                        <p class="card-text" align="left">
                            제품코드 : ${dto.code } <br>브랜드 : ${dto.brand }<br>색상 : ${dto.color}<br>가격 : ${dto.price}<br>사이즈
                            : ${dto.size}<br>남은 재고 : ${dto.qty}
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    
	<footer class="text-muted py-5">
			<jsp:include page="footer.jsp" flush="false" />
	</footer>
	
</body>
</html>
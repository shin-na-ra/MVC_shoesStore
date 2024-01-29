 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript">
  
	function showAlert() {
		alert("미구현 기능입니다.");
	}
</script>  

  <nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd; height: 90px;">
      <div class="container">
        <a class="navbar-brand" href="loadProducts.do" style="font-size: 30px; color:#000000"><strong>E Shoe</strong></a>
        
        <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-left: 20px;">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 20px; color:#000000">
                Products
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="ProductRegister.jsp">상품 등록</a></li>
                <li><a class="dropdown-item" href="#" onclick="showAlert()">상품 수정</a></li>
                <li><a class="dropdown-item" href="#" onclick="showAlert()">상품 삭제</a></li>
              </ul>
            </li>
            &nbsp;&nbsp;&nbsp;
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 20px; color:#000000">
               	Revenue
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#" onclick="showAlert()">일별</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#" onclick="showAlert()">월별</a></li>
              </ul>
            </li>
          </ul>
          <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="검색" aria-label="Search">
            <button class="btn btn-outline-success" type="submit" style="width:100px;/*  background-color: #FFFFFF; color: #000000; */ font-size: 15px" onclick="showAlert()">검색</button>
          </form>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <form action="logout.do">
          <button class="btn btn-dark" type="submit" style="width:100px; font-size: 15px">로그아웃</button>
        </form>
        </div>
      </div>
    </nav> 

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="main.js"></script>
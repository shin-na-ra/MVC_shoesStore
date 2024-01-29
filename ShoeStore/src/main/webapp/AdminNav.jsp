 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
                <li><a class="dropdown-item" href="ProductRegister.jsp">등록</a></li>
                <li><a class="dropdown-item" href="#">수정</a></li>
                <li><a class="dropdown-item" href="#">삭제</a></li>
              </ul>
            </li>
            &nbsp;&nbsp;&nbsp;
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 20px; color:#000000">
               	매출
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">일별</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">월별</a></li>
              </ul>
            </li>
          </ul>
          <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="검색" aria-label="Search">
            <button class="btn btn-outline-success" type="submit" style="width:100px; background-color: #FFFFFF; border-color: #000000; color: #000000; font-size: 15px">검색</button>
          </form>
        </div>
      </div>
    </nav> 
    
 <!--  <div class="navbar navbar-dark bg-dark shadow-sm">
	  <div class="container d-flex justify-content-between">
	    <a href="shoesList.do" class="navbar-brand">
	      <strong style="font-size: 30px">E Shoe</strong>
	    </a>
	    <div class="input-group" style="width: 22%; text-align: left;">
		    <input id="searchInput" class="form-control" type="search" placeholder="Search" aria-label="Search" style="font-size: 14px;">
		    검색을 클릭하면 밑에 script로 이동
		    <button type="button" onclick="searchShoes()" class="btn btn-outline-success" style="background-color: #000000; border-color: #000000; color: #FFFFFF; font-size: 15px">검색</button>
		    
		    <form id="searchForm" action="search.do" method="post">
			    <input id="searchInput" class="form-control" type="search" placeholder="Search" aria-label="Search" style="font-size: 14px;">
			    검색을 클릭하면 밑에 script로 이동
			    <button type="button" onclick="searchShoes()1" class="btn btn-outline-success" style="background-color: #000000; border-color: #000000; color: #FFFFFF; font-size: 15px">검색</button>
			  </form>
		</div>
  </div>
</div> -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="main.js"></script>
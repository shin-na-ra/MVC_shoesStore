<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>${name}</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/album/">

    

    <!-- Bootstrap core CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

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
        .c-chip {
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
        .c-chip:hover {
        	border: 1px solid #000;
        }
        
        /* 사이즈 버튼 활성화시 */
        .c-chip.active {
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
            font-size:10px;
		}

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
        
  </head>
 <body>
    
    
<header>
  <div class="navbar navbar-dark bg-dark shadow-sm">
	  <div class="container d-flex justify-content-between">
	    <a href="shoesList.do" class="navbar-brand">
	      <strong>E Shoe</strong>
	    </a>
  </div>
</div>
</header>


<!-- 사이즈 클릭 후 구매하기 버튼을 누르면 작동하는 함수 -->
<script>
	function selectSize(button) {
	    // 모든 버튼들 스타일 초기화
	    var buttons = document.querySelectorAll('.c-chip');
	    buttons.forEach(function (btn) {
	        btn.style.backgroundColor = ''; // 배경 초기화
	        btn.style.border = ''; // 보더 초기화
	    });
	
	    // 클릭 시 배경화면 색상 설정
	    button.style.backgroundColor = 'white';
	    button.style.border = '1px solid black'; // Set border and color
	
	    // Update the hidden input with the selected size
	    document.getElementById('selectedSize').value = button.value;
		    
	    /* $.ajax({
	        type: "POST",
	        url: "/*.do", // Replace with the actual URL
	        data: { size: button.value },
	        success: function(response) {
	            // Handle the server response if needed
	        },
	        error: function() {
	            // Handle errors if necessary
	        }
	    }); */
	}
	
	function validateForm() {
	    // Check if a size is selected
	    var selectedSize = document.getElementById('selectedSize').value.trim(); // Trim to handle whitespace
	    if (selectedSize == null) {
	        // Display an error message or handle it as needed
	        alert('사이즈를 선택 해주세요.');
	        return false; // Prevent form submission
	    }

	    // Continue with form submission if a size is selected
	    return true;
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
											style="width: 516px; height: 645px; margin-left: 100px;">
											<svg class="bd-placeholder-img card-img-top" width="100%"
												height="0px" xmlns="http://www.w3.org/2000/svg" role="img"
												aria-label="Placeholder: Thumbnail"
												preserveAspectRatio="xMidYMid slice" focusable="false">
                                            	<img src="${images.image}" alt="Shoe Image">
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
					<div class="sticky-container" style="position: sticky; top: 50px; margin-top: 50px; margin-right: 100px">
					<!-- <div class="sticky-container" style="top: -454px; margin-top: 50px"> -->
						<!-- Add your description and information content here -->
						<!-- <div class="l-grid__col-detail"> -->
						<div class="l-grid__row" data-ui-type="Detail_Item_Base">
							<div class="dtl-title">
								<div class="c-flag " >
									<span class="c-flag__item  ">${info.brand}</span>
								</div>
								<h2>${info.name}</h2>
								<span class="sub-txt">${info.kname}</span>
							</div>
							<br>
							<div class="dtl-price-wrap">
								<dl class="dtl-price">
									<dt>₩ ${info.price}</dt>
								</dl>
							</div>
						</div>
						<br>
						<br>
							<div class="l-grid__row" data-ui-type="Detail_Item_Option">
								<section>
									<h3>SIZE</h3>
									<div class="c-chip-input">
										<!-- 신발 사이즈 shoesSize로부터 불러온다 -->
										<c:forEach items="${shoesSize}" var="shoeSize">
											   <input class="c-chip" type="button" id="${shoeSize.size}" 
											       name="size" value="${shoeSize.size}" onclick="selectSize(this)">
										</c:forEach> 
									</div>
								</section>
								<div class="notice-area">
								</div>
								<br>
								<div class="btm-drawer open">
						        	<div class="c-btn_wrap" align="left">
						        		<form action="purchase.do" method="post">
							                <!-- size 넘기기 위한 히든 인풋 -->
							                <input type="hidden" class="selectedSize">
							                <!-- 보이는 버튼 -->
							                <input type="submit" class="c-button__primary" value="BUY NOW">
						                </form>						            
							        </div>
							    </div>
							</div>
						<br>
						<br>
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
						<br>
						<br>
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
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1">Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
    <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="../getting-started/introduction/">getting started guide</a>.</p>
  </div>
</footer>


    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

      
  </body>
</html>
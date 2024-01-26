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
    <title>Album example · Bootstrap v5.1</title>

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

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
  </head>
  <body>
    
<header>
  <div class="collapse bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-md-7 py-4">
          <h4 class="text-white">About</h4>
          <p class="text-muted">Add some information about the album below, the author, or any other background context. Make it a few sentences long so folks can pick up some informative tidbits. Then, link them off to some social networking sites or contact information.</p>
        </div>
        <div class="col-sm-4 offset-md-1 py-4">
          <h4 class="text-white">Contact</h4>
          <ul class="list-unstyled">
            <li><a href="#" class="text-white">Follow on Twitter</a></li>
            <li><a href="#" class="text-white">Like on Facebook</a></li>
            <li><a href="#" class="text-white">Email me</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
	  <div class="container d-flex justify-content-between">
	    <a href="#" class="navbar-brand">
	      <strong>E Shoe</strong>
	    </a>
	    <div class="input-group" style="width: 22%; text-align: left;">
		  <input id="searchInput" class="form-control" type="search" placeholder="Search" aria-label="Search" style="font-size: 14px;">
		  <!-- 검색을 클릭하면 밑에 script로 이동 -->
		  <button onclick="searchShoes()" class="btn btn-outline-success" style="background-color: #000000; border-color: #000000; color: #FFFFFF; font-size: 15px">검색</button>
		</div>
  </div>
</div>
</header>


<!-- Import the Google Translate API -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

<script>
<script>
	function searchShoes() {
	  // Get the search input value
	  var searchInput = document.getElementById('searchInput').value.toLowerCase();
	
	  // Loop through the card elements and show/hide based on the search input
	  var cards = document.getElementsByClassName('card');
	  for (var i = 0; i < cards.length; i++) {
	    var cardText = cards[i].innerText.toLowerCase();
	    cards[i].style.display = cardText.includes(searchInput) ? 'block' : 'none';
	  }
	}

  // Function to handle translation using Google Translate API
  function googleTranslateElementInit(searchInput, callback) {
    new google.translate.TranslateElement({pageLanguage: 'ko', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
    // Wait for the translation to complete
    var observer = new MutationObserver(function(mutations) {
      mutations.forEach(function(mutation) {
        if (mutation.addedNodes && mutation.addedNodes.length > 0 && mutation.addedNodes[0].nodeType == 1 && mutation.addedNodes[0].className == 'goog-te-menu-value') {
          // Translation completed, get the translated text
          var translatedText = document.querySelector('.goog-te-menu-value span').innerText;
          callback(translatedText);
        }
      });
    });
    observer.observe(document.body, {childList: true, subtree: true});
  }
</script>

<main>
	  <section class="py-5 text-center container">
	    <div class="row py-lg-5">
	      <div class="col-lg-6 col-md-8 mx-auto">
	        <h1 class="fw-light" style="font-weight=bold; font-size=50px">E Shoe</h1>
	      </div>
	    </div>
	  </section>
	  
	<div class="album py-5 bg-light">
  <div class="container">
    <div class="row row-cols-1 row-cols-md-3 g-3">
      <c:forEach items="${shoesList}" var="dto">
        <div class="col">
          <a href="pay_view.do" style="text-decoration: none;">
            <div class="card shadow-sm">
              <svg class="bd-placeholder-img card-img-top" width="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                <title>Placeholder</title>
                <img src="${dto.image}" alt="Shoe Image">
                <text x="10%" y="10%" fill="#eceeef" dy=".3em" align="center">${dto.brand}</text>
              </svg>
              <div class="card-body">
                <p class="card-text" align="center">${dto.name}</p>
                <p class="card-text" align="center">₩ ${dto.price}</p>
              </div>
            </div>
          </a>
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
    <p class="mb-1">Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
    <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="../getting-started/introduction/">getting started guide</a>.</p>
  </div>
</footer>


    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

      
  </body>
</html>

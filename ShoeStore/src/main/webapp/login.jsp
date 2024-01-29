<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>신발가게 : 로그인</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <!-- 디자인 -->
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
    <!-- Custom styles for this template -->
    <link href="login.css" rel="stylesheet">
  </head>
  <script type="text/javascript">
		function checkMember() {
			
			//정규식 
			let regExpId = /^[a-z][a-zA-Z0-9]{3,11}$/;
			let regExpPw = /^[a-zA-Z0-9]{4,12}$/;
			
			let form = document.Member;
			
			let id = form.id.value;
			let pw = form.pw.value;

			
			if(id === ""){
				alert("아이디를 입력해 주세요.");
				form.id.focus();
				return false;
			}
			if(!regExpId.test(id)){
				alert("아이디는 영문자로 시작하고, 4~12자리여야 합니다.");
				form.id.select();
				return false	;
			}
			if(pw === ""){
				alert("비밀번호를 입력해 주세요.");
				form.pw.focus();
				return false;
			}
			if(!regExpPw.test(pw)){
				alert("비밀번호는 4~12자리의 영문과 숫자 조합이어야 합니다.");
				form.pw.select();
				return false	;
			}			
			return true;	
		}

</script>
  <body class="text-center">
    
<main class="form-signin">
  <form action="login.do" name ="Member" onsubmit="return checkMember()" method="post">
    <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">신발가게</h1>

    <div class="form-floating">
      <input type="text" name="id" class="form-control" id="floatingInput" placeholder="아이디">
      <label for="floatingInput">아이디</label>
    </div>
    <div class="form-floating">
      <input type="password" name="pw"  class="form-control" id="floatingPassword" placeholder="비밀번호">
      <label for="floatingPassword">비밀번호</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2024</p>
  </form>
</main>


    
  </body>
</html>


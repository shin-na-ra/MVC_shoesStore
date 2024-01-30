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
    <title>E SHOE</title>
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
      .title {
	 font-family: 'Single Day', cursive;
	 font-size : 80px;
	 }
	
	 /* "회원가입" 버튼의 색상을 변경하는 스타일 추가 */
	.btn-log-in {
	    background-color: #FF0000;
	    /* 버튼에 대한 다른 스타일도 필요한 경우 추가하세요 */
	    color: #fff; /* 텍스트 색상 */
	    border-color: #FF0000; /* 테두리 색상 */
	}
	
	/* "회원가입" 버튼에 스타일 적용 */
	.w-100.btn.btn-lg.btn-primary-log-in {
	    background-color: #FF0000;
	    color: #fff;
	    border-color: #FF0000;
	}
	
	/* "회원가입" 버튼의 색상을 변경하는 스타일 추가 */
	.btn-sign-up {
	    background-color: #808080;
	    /* 버튼에 대한 다른 스타일도 필요한 경우 추가하세요 */
	    color: #fff; /* 텍스트 색상 */
	    border-color: #808080; /* 테두리 색상 */
	}
	
	/* "회원가입" 버튼에 스타일 적용 */
	.w-100.btn.btn-lg.btn-primary-sign-up {
	    background-color: #808080;
	    color: #fff;
	    border-color: #808080;
	}
	
	#loginBtn {
 	margin-bottom : 10px;
	}
	
	/* 하이퍼링크에 밑줄 제거 스타일 추가 */
      .title {
        font-family: 'Single Day', cursive;
        font-size: 80px;
        text-decoration: none; /* 밑줄 제거 */
        color: inherit; /* 기본 텍스트 색상 유지 */
      }
	
	
    </style>
    <!-- Custom styles for this template -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
    <link href="login.css" rel="stylesheet">
  </head>
  <script type="text/javascript">
		function checkMember() {
			
			//정규식
			let regExpId = /[A-Za-z0-9]{3,}/;
			let regExpPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,100}$/;
			
			let form = document.Member;
			
			let id = form.id.value;
			let pw = form.pw.value;
			
			if(id === ""){
				alert("아이디를 입력해 주세요.");
				form.id.focus();
				return false;
			}
			if(!regExpId.test(id)){
				alert("아이디는 영문자로 시작하고, 3자리 이상이여야 합니다.");
				form.id.select();
				return false	;
			}
			if(pw === ""){
				alert("비밀번호를 입력해 주세요.");
				form.pw.focus();
				return false;
			}
			if(!regExpPw.test(pw)){
				alert("비밀번호는 영문 대소문자, 숫자, 특수문자 중 하나 이상 포함하여야 하고 8~100자까지 작성할 수 있습니다.");
				form.pw.select();
				return false	;
			}			
			return true;	
		}
</script>
  <body class="text-center">
<main class="form-signin">
  <form action="login.do" name ="Member" onsubmit="return checkMember()" method="post">
    <!--<img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">-->
    <a href="list.do" class="title">E Shoe</a>
    <div class="form-floating">
      <input type="text" name="id" class="form-control" id="floatingInput" placeholder="아이디">
      <label for="floatingInput">아이디</label>
    </div>
    <div class="form-floating">
      <input type="password" name="pw"  class="form-control" id="floatingPassword" placeholder="비밀번호">
      <label for="floatingPassword">비밀번호</label>
    </div>
    <!--<div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>-->
    <button class="w-100 btn btn-lg btn-primary btn-log-in" type="submit" id="loginBtn">로그인</button><br>
  </form>
  <form action="signUpForm.do">
	<button class="w-100 btn btn-lg btn-primary btn-sign-up" type="submit">회원가입</button>
          <p class="mt-5 mb-3 text-muted">&copy; 2024</p>
  </form>
</main>
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
    // 페이지가 로드되면 실행될 JavaScript 코드
    window.onload = function() {
        <%-- "loginResult" 속성 값을 가져와서 알림을 표시하는 JavaScript 코드 --%>
        var loginResult = '<%= request.getAttribute("loginResult") %>';

        if (loginResult === 'admin') {
            alert("관리자로 로그인하셨습니다!");
            // 필요에 따라 다른 페이지로 리다이렉트할 수 있습니다.
            // window.location.href = 'adminDashboard.jsp';
        } else if (loginResult === 'success') {
            alert("로그인에 성공하셨습니다!");
            // 필요에 따라 다른 페이지로 리다이렉트할 수 있습니다.
            // window.location.href = 'userDashboard.jsp';
        } else if (loginResult === 'fail') {
            alert("로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.");
            // 필요에 따라 로그인 페이지로 리다이렉트할 수 있습니다.
            // window.location.href = 'login.jsp';
        }
    };
</script>

</body>
</html>
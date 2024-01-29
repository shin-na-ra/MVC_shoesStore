<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Login Result</title>
</head>
<body>

<c:choose>
    <c:when test="${loginResult eq 'admin'}">
        <script>alert('관리자로 로그인되었습니다.');
        window.location.href = 'loadProducts.do';
        </script>
    </c:when>
    <c:when test="${loginResult eq 'success'}">
        <script>alert('로그인 성공했습니다.');
        window.location.href = 'shoesList.do';
        </script>
    </c:when>
    <c:when test="${loginResult eq 'fail'}">
        <script>alert('로그인에 실패했습니다.');
        window.location.href = 'list.do';
        </script>
    </c:when>
</c:choose>

</body>
</html>
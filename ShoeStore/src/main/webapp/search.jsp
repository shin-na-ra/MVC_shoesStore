<%@page import="com.javalec.dto.SListDto"%>
<%@page import="java.util.List"%>
<%@page import="com.javalec.dao.SListDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String searchInput = (String) request.getAttribute("searchInput");
	SListDao dao = new SListDao();
	List<SListDto> dto = dao.shoesList();
	out.print(searchInput);
	boolean checkFlag = false;
	
	for(int i =0; i<dto.size(); i++) {
		out.print(i);
		if(dto.contains(searchInput)) {
			checkFlag = true;
		}
	}
	
	request.setAttribute("checkFlag", checkFlag);
	
	response.sendRedirect("product.jsp");
%>
</body>
</html>
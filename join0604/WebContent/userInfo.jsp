<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="co.model.MemberBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입처리 JSP</title>
</head> 
<body>
	
	<%
		//registerForm.jsp에서 입력한 정보를 넘겨 받아 처리한다
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
	%>
	
	<h3><%=name%>님 가입을 축하드립니다!</h3>
</body>
</html>

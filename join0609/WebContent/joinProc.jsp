<%@page import="co.model.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<jsp:useBean id="user" class="co.model.DTO" /><!-- 객체생성 -->
	<jsp:setProperty property="*" name="user" /><!-- 객체생성한 자바빈의 프로퍼티를 읽어올수있다 -->	
	
	
<% 
	DAO dao=DAO.getInstance("jointest");
	String name = user.getName();
	int rn=dao.insertUser(user);
	
	//유효성검사를 한번더 한다*****
	//정보 확인을 해준다. 고객한테
	
	
	
	if(rn!=1){
%>
	
	<jsp:forward page="login.jsp">
		<jsp:param value="welcome!" name="msg"/>
	</jsp:forward>
	
<% } else { %>
	
	<script>
		history.back();
	</script>
	
<% } %>	
	
	
	

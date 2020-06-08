<%@page import="co.model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

	<jsp:useBean id="user" class="co.model.DTO" /><!-- 객체생성 -->
	<jsp:setProperty property="*" name="user" /><!-- 객체생성한 자바빈의 프로퍼티를 읽어올수있다 -->	
	
	
<% 
	DAO dao=DAO.getInstance("jointest");
	String name = user.getName();
	int rn=dao.insertUser(user);
	//아닌경우***
	
	if(rn==1){
%>
	
	<jsp:forward page="login.jsp">
		<jsp:param value="welcome!" name="msg"/>
	</jsp:forward>
	
<% } else { %>
	
	<script>
		history.back();
	</script>
	
<% } %>	
	
	
	

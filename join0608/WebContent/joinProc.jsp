<%@page import="co.model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

	<jsp:useBean id="user" class="co.model.DTO" /><!-- ��ü���� -->
	<jsp:setProperty property="*" name="user" /><!-- ��ü������ �ڹٺ��� ������Ƽ�� �о�ü��ִ� -->	
	
	
<% 
	DAO dao=DAO.getInstance("jointest");
	String name = user.getName();
	int rn=dao.insertUser(user);
	//�ƴѰ��***
	
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
	
	
	

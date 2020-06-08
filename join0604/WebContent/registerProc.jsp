<%@page import="co.model.MemberBean"%>
<%@page import="co.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

	<jsp:useBean id="user" class="co.model.MemberBean" /><!-- 객체생성 -->
	<jsp:setProperty property="*" name="user" /><!-- 객체생성한 자바빈의 프로퍼티를 읽어올수있다 -->	
	
	
<% 
	MemberDAO mdao=MemberDAO.getInstance("jointest");
	String name = user.getName();
	mdao.insertUser(user);
	//아닌경우***

%>


	<jsp:forward page="userInfo.jsp">
		<jsp:param name="name" value="<%=name %>" />
	</jsp:forward>


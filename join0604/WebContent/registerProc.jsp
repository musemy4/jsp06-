<%@page import="co.model.MemberBean"%>
<%@page import="co.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

	<jsp:useBean id="user" class="co.model.MemberBean" /><!-- ��ü���� -->
	<jsp:setProperty property="*" name="user" /><!-- ��ü������ �ڹٺ��� ������Ƽ�� �о�ü��ִ� -->	
	
	
<% 
	MemberDAO mdao=MemberDAO.getInstance("jointest");
	String name = user.getName();
	mdao.insertUser(user);
	//�ƴѰ��***

%>


	<jsp:forward page="userInfo.jsp">
		<jsp:param name="name" value="<%=name %>" />
	</jsp:forward>


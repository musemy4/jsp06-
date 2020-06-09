<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
    }
  </style>  
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
</head>
<body>
<%
	//
	String isLogin=(String)session.getAttribute("loginid");
	String logChk=(isLogin!=null)?"Logout":"Login";
	
	HttpServletRequest req=(HttpServletRequest)request;
	String uri = req.getRequestURI();
	//System.out.println("헤더에서 uri:"+uri);

	String logTo=(logChk=="Logout")?"/join0608/LoginAction":"/join0608/login.jsp?subpage="+uri;

%>

<div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="/join0608/index.jsp">OurBoard</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="" ><a href="/join0608/index.jsp" >Home</a></li>
        <li class="" ><a href="/join0608/about.jsp">About</a></li>
        <li class="" ><a href="/join0608/board.jsp">Board</a></li>
        <li class="" ><a href="/join0608/lecture.jsp">Lecture</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class=""><a href="<%=logTo%>"><span class="glyphicon glyphicon-log-in"></span> <%=logChk %></a></li>
         <li class=""><a href="/join0608/join.jsp">JOIN</a></li>
      </ul>
    </div>
  </div>
  
 <%--작동이가 안됨 ㅠㅠ  --%> 

<script type="text/javascript">
//$(document).ready(function(){
//	$('li').click(function(){
//		$('li').removeClass("active");
//		this.classList = "active";
//		$(this).addClass("active");
//	})
	
	
	/* jQuery(document).ready(function(){
		jQuery("#myNavbar ul li").click(activeChange);
	}); */
	
	/*function activeChange(){
		jQuery.each(jQuery("#myNavbar ul li"),function(i){
			jQuery(this).attr("class","");
		});
		System.out.println("function");
		jQuery(this).addClass("active"); 
		$('a[href$="/filter_0601/index.jsp"]').addClass('active');
	}*/

//});
	
</script>

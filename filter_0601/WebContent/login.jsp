

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
   
  </style>
</head>
<body>
<%! 
	
	String getCookieValue(Cookie[] cookies,String key){
		if(cookies!=null){
			for(int i=0;i<cookies.length;i++){
				if(cookies[i].getName().equals(key)){
					return cookies[i].getValue();
				}
			}
		} return null;
	}	
	
%>

<%
	
	String uri=request.getParameter("uri");
	String msg=request.getParameter("msg"); //board나 lecture에서 넘어왔다면 "u should login"
	String from="/filter_0601/index.jsp";//from= 끝나고 보내야할곳
	if(uri!=null){
		from=uri;
	}
	if(msg!=null){
%>
	<script>alert("<%=msg%>");</script>

<% } 
	//c.쿠키가 있는지 확인한다
	String rememberid = getCookieValue(request.getCookies(),"rememberid");
	System.out.println("리멤버아이디"+rememberid);
	String chk="";
	System.out.println("rememberid!-null?"+rememberid!=null);
	if(rememberid!=null){//0-1.쿠키가 있으면 
		//1.쿠키의 내용을 읽어서 id에 보내준다
		//2.체크박스를 체크한다
		chk="checked";
	}else{
		rememberid="";
		chk="";//0-2.없으면 아무일도 안한다
	}
%>


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="/filter_0601/index.jsp">OurBoard</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="/filter_0601/index.jsp">Home</a></li>
        <li><a href="/filter_0601/about.jsp">About</a></li>
        <li><a href="/filter_0601/board.jsp">Board</a></li>
        <li><a href="/filter_0601/lecture.jsp">Lecture</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="/filter_0601/login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
    <!-- 비워둠 -->
    </div>
    <div class="col-sm-8 text-center"> 
    	<div class="login" style="margin-top:100px">
  		<h1>LOGIN</h1>
		<form action="/filter_0601/LoginAction" method="get">	
			<table width="200px" align="center">
				<tr>
					<td>ID: <input type="text" size="10" name="inputid" value="<%=rememberid%>"></td>			
				</tr>
				<tr>
					<td>pw: <input type="password" size="10" name="inputpw"><br><br>
					</td>			
				</tr>
			</table>
			
			<input type="checkbox" name="remember" <%=chk %>>remember this ID
			<input type="hidden" name="from" value="<%=from%>"><%--공갈용 --%>
			&nbsp;&nbsp;<input type="submit" value="login">
		</form>
		</div>
	</div>
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <jsp:include page="inc/footer.jsp"></jsp:include>
</footer>

</body>
</html>

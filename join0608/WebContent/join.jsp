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
	    
	   	span{
			font-size: 7px;
		}
	
	</style>
</head>


<body>
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
        <li><a href="/join0608/index.jsp">Home</a></li>
        <li><a href="/join0608/about.jsp">About</a></li>
        <li><a href="/join0608/board.jsp">Board</a></li>
        <li><a href="/join0608/lecture.jsp">Lecture</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class=""><a href="/join0608/login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
       <li class="active"><a href="/join0608/join.jsp">JOIN</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
    <!-- ë¹ìë  -->
    </div>
    <div class="col-sm-8 text-center"> 
    	<div class="join">
  		<h1>Joinform</h1>
		<form  id="form" name="form" onsubmit="return validate()" action="/join0608/joinProc.jsp" method="get">	
			<table width="310px" align="center" border="1">
				<tr>
					<td width="50px">ID:</td><td align="left"><input type="text" size="10" id="id" name="id" readonly="true" value="">&nbsp;&nbsp;
					<button type="button" onclick="idAlready()">idchk</button></td>	
				</tr>
				<tr>
					<td>pw:</td><td align="left"> <input type="password" size="10" id="pw" name="pw">&nbsp;
					<span id=ispw></span><br><span>*ENG,num 8-12</span></td>			
				</tr>
				<tr>
					<td>pwChk:</td><td align="left"> <input type="password" size="10" id="pw2" name="pw2"><span id="pwchk"></span></td>			
				</tr>
				
				<tr>
					<td>Name:</td><td align="left"> <input type="text" size="10" name="name" id="name"><span id="namechk"></span></td>			
				</tr>
				<tr>
					<td>Code:</td>
					<td align="left">
						<input type="text" size="8" name="code1" id="code1">&nbsp; - &nbsp;<input type="text" name="code2" size="8" id="code2">
						<br><span id="codechk"></span>
					</td>			
					
				</tr><!-- 123456-1234567 -->
				<tr>
					<td>Birth:</td>
					<td ><input type="text" size="3" name="birthY" id="years" readonly="true">yyyy
						<input type="text" size="1" name="birthM" id="month" readonly="true">mm
						<input type="text" size="1" name="birthD" id="day" readonly="true">dd
					</td>			
				</tr>
				
				<tr>
					<td>Phone:</td><td align="left"><input type="phone" size="15" name="phone" id="phone"></td>			
				</tr>
				<tr>
					<td>Email:</td><td align="left"><input type="email" size="20" name="email" id="email"></td>			
				</tr>
				<tr>
					<td>Address:</td>
					<td align="left">
						<button type="button" onclick="goPopup()">search</button>
						<input type="text" size="30" id="address" name="address" readonly="true" required />
					</td>			
				</tr>
			</table><br>
			
			<!-- window.open('jusopopup.jsp','주소검색하기','width=430,height=500,location=no,status=no,scrollbars=yes')" -->
			
			&nbsp;&nbsp;<input type="submit" value="JOIN NOW">&nbsp;&nbsp;<input type="reset" value="Reset">
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
	<!-- 유효성 검사 -->
	<script language="javascript" charset="utf-8">
	function validate(){
		
		var re0 = /^[a-zA-Z0-9]{4,12}$/ //아이디
		var re =/^[a-zA-Z0-9]{8,12}$/ 
			///(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}/   //소문자,대문자,숫자하나가 포함되어있어야함
				///^[a-zA-Z0-9]{8,12}$/
		var ren = /^[a-zA-Z]+$/ // 이름이 적합한지 검사할 정규식
		     	///^[가-힣a-zA-Z]+$/
		var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
     	// 이메일이 적합한지 검사할 정규식
		       		
     	
		
		var id=document.getElementById("id");
		var pw=document.getElementById("pw");
		var pw2=document.getElementById("pw2");
		var name=document.getElementById("name");
		var code1=document.getElementById("code1");
		var code2=document.getElementById("code2");
		var years=document.getElementById("years");
		var month=document.getElementById("month");
		var day=document.getElementById("day");
		var phone=document.getElementById("phone");
		var email=document.getElementById("email");
		var address=document.getElementById("address");
		
		function check(re,what,msg){//정규식검사
			if(re.test(what.value)){
				return true;
			}
			alert(msg);
			what.value="";
			what.focus();
		}
		
		if(!check(re0,id,"id only 4-12 eng,num")){
			return false;			
		}
		
		if(!check(re,pw,"pw 8-12 eng,num")){
			return false;			
		}
		
		if(!check(ren,name,"cant quot,num in name")){
			return false;			
		}
		
		if(!check(re2,email,"no match email-reg")){
			return false;			
		}
		
		//우선 다들어왔나
		if(id.value==""){
			alert("input id plz");
			return false;
		}
		
		if(pw.value==""){
			alert("input pw plz");
			return false;
		}
		
		if(pw2.value==""){
			alert("input pw2 plz");
			return false;
		}
		
		if(pw.value!=pw2.value){
			alert("pw!=pw2");
			
			pw2.value="";
			return false;
		}
		
		if(name.value==""){
			alert("input name plz");
			return false;
		}
		
		if(code1.value==""){
			alert("input code plz");
			return false;
		}
		
		if(code2.value==""){
			alert("input code plz");
			return false;
		}
		
		if(phone.value==""){
			alert("input phone number");
			return false;
		}
		
		if(email.value==""){
			alert("input email plz");
			return false;
		}
		
		if(address.value==""){
			alert("input address plz");
			return false;
		}
	
		alert("join complete!");
		return true;
	}		

	</script>

	<!-- 중복아이디 검사 -->
	<script language="javascript" charset="utf-8">
	function idAlready(){//그냥 열기만해요~ 
		var popid = window.open("idchk.jsp","pop","width=570,height=150, scrollbars=yes, resizable=yes"); 
	}
	
	function idBack(idchked){//값을 갖고 들어와서 넣는다
			document.form.id.value = idchked;		
	}
	</script>
	<script language="javascript" charset="utf-8">
		<!-- 비번 유효성 검사1 -->
		var re =/(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}/
			///^[a-zA-Z0-9]{8,12}$/
		var target=document.getElementById('pw');
		target.addEventListener('change',function(event){
			var target0=document.getElementById('pw');
			if(re.test(target0.value)){//맞지않을경우
				document.getElementById('ispw').style.color="red";
				document.getElementById('ispw').innerHTML="*chk again!";
				target0.value="";
				target0.focus();
			}else {
				document.getElementById('ispw').style.color="green";
				document.getElementById('ispw').innerHTML="*good password";
			}
						
		})
	
		<!-- 비번, 재확인이 서로 같은지 검사 -->
		var target=document.getElementById('pw2');
		target.addEventListener('change',function(event){
			var target0=document.getElementById('pw');
			var target1=document.getElementById('pw2');
			
			
			if(target0.value===target1.value){
				document.getElementById('pwchk').style.color="green";
				document.getElementById('pwchk').innerHTML="* confirm password";
			} else {
				document.getElementById('pwchk').style.color="red";
				document.getElementById('pwchk').innerHTML="*pw!=pw2";
				target1.value="";
				target1.focus();
			}
			
		})
		
		<!-- 이름 검사 -->
		var ren = /^[a-zA-Z]+$/ ///^[가-힣a-zA-Z]+$/ 
		var target=document.getElementById('name');
		target.addEventListener('change',function(event){
			if(!checkPw(ren,target)){//옳지않을시
				document.getElementById('namechk').style.color="red";
				document.getElementById('namechk').innerHTML=" *only eng!";
				target.value="";
				target.focus();
			}else {
				document.getElementById('namechk').style.color="green";
				document.getElementById('namechk').innerHTML=" *good name!";
			}
			
			function checkPw(re,what){//정규식검사
				if(re.test(what.value)){
					return true;
				}else 
					return false;
			}
			
		})
	</script>
	<!-- 자동으로 주민번호 검사, 생일 입력 -->
	<script language="javascript" charset="utf-8">
		var target1=document.getElementById('code1');
		var target2=document.getElementById('code2');
		var arrNum1=new Array(); //주민번호 앞자리숫자 6개
		var arrNum2=new Array(); //주민번호 뒷자리숫자 7개

		var codechk=document.getElementById('codechk');

		target2.addEventListener('change',function(event){//2번째 코드가 완성되면
		
			
			//주민번호 > 생일 자동등록 
			for(var i=0;i<code1.value.length;i++){
				arrNum1[i]=code1.value.charAt(i); //배열에 번호를 하나씩 담는다
			}
			
			for(var i=0;i<code2.value.length;i++){
				arrNum2[i]=code2.value.charAt(i); //배열에 번호를 하나씩 담는다
			}
			
			var tempSum=0;
			
			for(var i=0;i<6;i++){
				//alert("더한다1:"+arrNum1[i]*(2+i));
				tempSum+=arrNum1[i]*(2+i);
			}
			
			for(var i=0;i<6;i++){
				
				if(i>=2){
					//alert("더한다2:"+arrNum2[i]*i);
					tempSum+=arrNum2[i]*i;
				}else{
					//alert("더한다2:"+arrNum2[i]*(8+i));
					tempSum+=arrNum2[i]*(8+i);
				}
			}
			
			if((11-(tempSum%11))%10!=arrNum2[6]){//마지막것과 같지않으면
				document.getElementById('codechk').style.color="red";
				document.getElementById('codechk').innerHTML="*not good code";
				
				code2.value="";
				code1.focus();
				return false;
			} else{//같으면 생일 자동입력!
				document.getElementById('codechk').style.color="green";
				document.getElementById('codechk').innerHTML="*confirmed code!";
				
				if(arrNum2[0]==1||arrNum2[0]==2){//20세기 소년소녀들
					var y = parseInt(code1.value.substring(0,2));//두자리
					var m = parseInt(code1.value.substring(2,4));//두자리씩 
					var d = parseInt(code1.value.substring(4,6));//얻어옴 
					years.value=1900+y;
					month.value=m;
					day.value=d;
				}else if(arrNum2[0]==3||arrNum2[0]==4){
					var y = parseInt(code1.value.substring(0,2));//두자리
					var m = parseInt(code1.value.substring(2,4));//두자리씩 
					var d = parseInt(code1.value.substring(4,6));//얻어옴 
					years.value=2000+y;
					month.value=m;
					day.value=d;	
				}
			}
						
		})
	</script>
	<script language="javascript" charset="utf-8">
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("jusopopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	
	function jusoCallBack(roadFullAddr){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
			document.form.address.value = roadFullAddr;		
	}
	</script>
	
	 <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	 <script>
	 	
	 
	 
	 </script>
	
	

</html>
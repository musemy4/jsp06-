<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Insert title here</title>
</head>
<style>
	span{
		font-size: 8px;
	}
	
	#letsgo{
		color: green;
		display:none;
	}
</style>
<%
	request.setCharacterEncoding("UTF-8");
	String ischked=(String)request.getAttribute("idchked");
	String chkedok=(String)request.getAttribute("chkedok");
	
	if(ischked!=null){
	}else ischked="";
	System.out.println("idchk.jsp:chked:!"+ischked);
	System.out.println("idchk.jsp:chkedok:!"+chkedok);
	
	
%>


<body>
	<div align="center">
		<form onsubmit="return validate()" action="/join0608/IdchkProc">
			<input id="id" name="id" type="text" size=5 value="<%=ischked%>">
			<input type="hidden" id="new" value="<%=chkedok %>">
			<input type="submit" value="search">
		</form>
			<span>*4-12 id length plz<span><br>
			<div id="letsgo">
				<div>U CAN USE THIS ID!</div>
				<br><br><button id="ok2" onclick="goback()">ID confirmed</button>
			</div>
</div>
	<script type="text/javascript"charset="utf-8">

	function validate(){
		var re0 = /^[a-zA-Z0-9]{4,12}$/
		if(!check(re0,id,"아이디는 4~12자의 영문자 숫자만 허용됨")){
			return false;			
		}
		
		function check(re,what,msg){//정규식검사
			if(re.test(what.value)){
				return true;
			}
			alert(msg);
			what.value="";
			what.focus();
		}	
	}
	</script>
	<script type="text/javascript"charset="utf-8">
		window.onload=function(){
			var target=document.getElementById('new');

			var letsgo=document.getElementById('letsgo');
			//alert("target"+target.value);
			if(target.value==="new"){
				letsgo.style.display="block";
			}else{
				letsgo.style.display="none";	
			}
		}
	
	</script>
	
	<script>
		function goback(){
			var idchked=document.getElementById('id').value;
			//alert(idchked);
			opener.idBack(idchked);
			window.close();
		}
	</script>
</body>
</html>
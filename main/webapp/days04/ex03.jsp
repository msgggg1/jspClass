<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String error = request.getParameter("error");
	String loginName = request.getParameter("name");
	String auth = request.getParameter("auth");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 26. 오전 9:01:51</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }   
 #login, logout{
 	border: 1px solid gray;
 	width: 300px;
 	padding: 20px;
 	border-radius: 10px;
 }
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">msg HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code"> 
   로그인 페이지
   아이디
   비밀번호
   [로그인] 
   	ex03.jsp 메인페이지 + 로그인
   	
   	설문조사	인증 O + 권한 O	admin
   	일정관리	인증 O
   	게시판	인증 X
   	
  </xmp>
  
  <div id="login">
  <form action="ex03_ok.jsp" method="get">
  	아이디 : <input type="text" name="id" value="admin"><br>
  	비밀번호 : <input type="password" name="passwd" value="1234" ><br>
  	<input type="submit">
  	<input type="reset">
  </form> 
  </div>
  
  <div id="logout" style="display:none">
  	[<%= loginName %>]님 로그인 하셨습니다.<br>
  	<button>로그아웃</button>
  </div>
  <br>
  <%
  	if (loginName != null ){
  		if(auth.equals("true")){
  %>
  <a href="#">설문조사</a><br>  
  <%
  		}
  %>
  <a href="#">일정관리</a><br>  
  
  <script>
  	alert("로그인 성공");
  	$("#login").hide();
  	$("#logout").show();
  </script>
  <%
  	}
  %>
  <a href="#">게시판</a><br>
  </div>
  
  
<%
	if(error != null && error.equals("")){
%>
<script>
	alert("로그인 실패 후 다시 ex02.jsp 리다이렉트 되었다.");
</script>
<%
	}
%>

<script>
	$("#logout button").on("click", function(){
		location.href = "ex03_logout.jsp";
		
	});
</script>
</body>
</html>
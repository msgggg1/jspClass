<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String error = request.getParameter("error");
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
   [로그인] ex02_ok.jsp 로그인 인증처리
   			ㄴ 로그인 성공	ex02_main 메인페이지 이동
   			ㄴ 로그인 실패 ex02.jsp   로그인 페이지 이동
   			
   			ex02.jsp				null
   			ex02.jsp?error			""
   			ex02.jsp?error=1000		"1000"
  </xmp>
  
  <form action="ex02_ok.jsp" method="get">
  	아이디 : <input type="text" name="id" value="admin"><br>
  	비밀번호 : <input type="password" name="passwd" value="1234" ><br>
  	<input type="submit">
  	<input type="reset">
  </form>
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


</body>
</html>
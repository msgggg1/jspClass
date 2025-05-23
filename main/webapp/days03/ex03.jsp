<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 23. 오후 3:40:59</title>
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
   	[JSP 구성 요소] // JSP도 내부적으로 Servlet이다. (-> 클래스 파일)
   	1. jsp 스크립트
   	   ㄱ. 스크립트릿	%
   	   ㄴ. 표현식		%=
   	   ㄷ. 선언문		%!
  </xmp>
  
  <%
  	// 스크립트릿 - 자바코딩.
  	String name = "홍길동";
    for(int i = 1; i <= 10; i++){
   %>
   i=<%= i%><br><% 	
    }
  %>
  <br>
  이름 : <%= name %><br>
  나이 : <%= age %><br>
  getMessage() 메서드 호출 : <%= getMessage("Admin") %><br>
  
  <%!
  	// 선언문(Declaration) - 변수, 메서드 선언
  	int age = 20;
    
  public String getMessage(String msg){
	  return "안녕 - " + msg;
  }
  	
  %>
</div>
</body>
</html>



















<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 28. 오전 9:02:48</title>
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
	   p132 JSP 기본 객체와 영역(scope)
	   1. 웹 어플리케이션의 4가지 영역(scope)
	   
		   	1) PAGE SCOPE 	 - 하나의 JSP 페이지에서 사용되는 영역	
		   		ㄴ pageContext 객체
		   		
		   	2) REQUEST SCOPE - 하나의 http 요청에서 사용되는 영역. (요청이 끝날때 가지 살아있는 기억공간. 포워딩 시 계속 하나의 요청 객체. 리다이렉트: 새로운 요청) 
		   		ㄴ request 객체
		   		
		   	3) SESSION SCOPE - 하나의 웹 브라우저와 관련되는 영역. (로그인한 특정 사용자만 이용할 수 있는 저장공간)
		   		ㄴ session 객체
		   		
		   	4) APPLICATION SCOPE - 하나의 웹 애플리케이션과 관련된 영역. (톰캣이 살아있는 동안. 모든 사용자가 공유해야하는 )
		   		ㄴ application 객체
		2. 메서드
		   getAttribute()
		   setAttribute()
		   removeAttribute()
		   getAttributeNames()
  </xmp>
</div>
</body>
</html>
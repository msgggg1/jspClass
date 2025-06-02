<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 2. 오전 11:35:11</title>
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
   EL 기본 내장 객체 : cookie
   	ㄴ Map 형태이다.
   	ㄴ 키 		+ 값  
   	  쿠키이름		  Cookie 객체
   	 
   	예)	(달러){cookie.ID} : 쿠키이름이 ID인 Cookie 객체 반환
   
   		쿠키 사용 예제)
  </xmp>
  
  <%
  	Cookie c = Cookies.createCookie("user", "admin");
  	response.addCookie(c);
  	
  	c = Cookies.createCookie("age", "20");
  	response.addCookie(c);
  	
  	c = Cookies.createCookie("addr", "seoul");
  	response.addCookie(c);
  %>
  
  <a href="ex05_03_ok.jsp">ex05_03_ok.jsp</a>
</div>
</body>
</html>
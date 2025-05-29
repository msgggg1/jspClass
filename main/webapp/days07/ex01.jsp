<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 29. 오전 9:00:51</title>
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
   [p155 페이지 모듈화와 요청 흐름 제어]
   하나의 웹 사이트(애플리케이션)을 구성하는
   페이지의 상단, 하단 , 메뉴 등등 모든 웹 페이지의
   공통적인 부분을 모율화(다른 jsp 페이지로 만든다) 시켜서 코드의 중복 제거
   생산성 향상, 유지, 보수, 확장성이 용이
   
   webapp 폴더 
   		ㄴ layout 폴더 : webapp 안의 전체(모든페이지) 공통적으로 사용할 모듈을 담겠다. (ex.상하단 메뉴)
   			ㄴ top.jsp
   			ㄴ bottom.jsp
   			
   		ㄴ days07 폴더  
   			ㄴ layout 폴더: 
   				ㄴ left.jsp
   				ㄴ right.jsp
  </xmp>
</div>
</body>
</html>
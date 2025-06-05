<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 5. 오후 2:11:00</title>
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
   [ p.696 파일 업로드 ]
   1. 업로드
   		클 -> 서
   2. 다운로드
   		서 -> 클
   3. 예) 쇼핑몰 사이트 : 상품 정보 등록
   					 (상품이미지 등록)
   		 회원가입		: 회원 이미지 등록
   		 자료실		: 첨부파일 등록
   		 등등
   4. JSP/Servlet에서 파일 업로드 작업
   
   					 ex06.jsp
   					 ex06_ok.jsp
  </xmp>
  
  <!-- 메서드 반드시 post, multipart/form-data -->
  <form method="post" enctype="multipart/form-data"></form>
</div>
</body>
</html>
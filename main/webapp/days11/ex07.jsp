<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 5. 오후 2:47:54</title>
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
   ex07.jsp
   [파일 업로드 방법]
   1. 개발자 직접 구현 X
   request.getInputStream();
   name = " 홍길동"
   upload 파일명	파일내용
   
   2. 외부 라이브러리 사용
   		ㄱ.http://www.servlets.com
   		ㄴ. lib
   			ㄴ cos.jar 추가
   			
   			form method="post"
   				encoding = "multipart/form-data"
   				
   			request.getParameter() x
   			[multipartRequest]클래스를 사용해서 첨부파일, 파라미터 읽어와서 처리
   			
   			         (개념 이해)
	   MultipartRequest mrequest = new MultipartRequest(ㄱ,ㄴ,ㄷ,ㄹ,ㅁ);  
	       ㄱ - JSP의 request 객체    
	       ㄴ - 서버에 저장될 위치(업로드 경로) 
	       ㄷ - 최대 파일 크기
	       ㄹ - 파일의 인코딩 방식
	       ㅁ - 파일 중복 처리위한 인자(클래스  제공)
	       
	       a.txt 존재			a.txt 업로드
			a(1).txt		a(1).txt  -> 실제 저장된 이름, 올린 이름 다를 수 있음   			
   3. 서블릿 3 제공하는 기능
  </xmp>
</div>
</body>
</html>







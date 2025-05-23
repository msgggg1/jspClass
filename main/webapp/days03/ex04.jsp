<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 23. 오후 4:19:00</title>
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
   	[ JSP 구성 요소 ] pdf p.74
   	1. jsp 스크립트
   	2. jsp 기본 내장 객체
  </xmp>
  *** 꼭 기억
  ***클라이언트IP = <%= request.getRemoteAddr() %><br>
  요청정보길이 = <%= request.getContentLength() %><br>
  요청정보 인코딩 = <%= request.getCharacterEncoding() %><br>
  요청정보 컨텐츠타입 = <%= request.getContentType() %><br>
  요청정보 프로토콜= <%= request.getProtocol() %><br>
  ***요청정보 전송방식= <%= request.getMethod() %><br>
  ***요청 URI= <%= request.getRequestURI() %><br>
  ***요청 URL= <%= request.getRequestURL() %><br>
  *** 컨텍스트 경로= <%= request.getContextPath() %><br>
  서버이름 = <%= request.getServerName() %><br>
  서버포트= <%= request.getServerPort() %><br>
</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 21. 오전 11:32:50</title>
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
   
  </xmp>
  <!-- jsp EL(표현언어) 기본 객체 : param -->
  책 제목: ${param.title}<br><!-- 출력하겠다 -->
  저자 : ${param.author}<br>
  나이 : ${param.age}
  
  <br>
  <br>
  <a href="javascript:history.go(-1);">뒤로가기</a><br> <!-- 브라우저에 남아있던 페이지 -->
  <a href="ex02.jsp">뒤로가기</a> <!-- 서버요청해서 다시 받아옴 -->
</div>
</body>
</html>


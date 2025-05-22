<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 22. 오후 2:32:39</title>
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
  <!-- 상대경로 -->
  <img alt="" src="../images/img_chania.jpg">
  <!-- 절대경로 : 바뀔 수 있음. -> 쓰면안됨-->
  <img alt="" src="http://localhost/jspPro/images/img_chania.jpg">
  
  <%
  	String contextPath = request.getContextPath();
  %> 
  
  <!-- /jspPro -->
  contextPath = <%= contextPath %><br>
  <!-- http://localhost/jspPro/days02/img_chania.jpg -->
  <img alt="A" src="img_chania.jpg">
  <!-- http://localhost/img_chania.jpg : 도메인까지 잡힌다.-->
  <img alt="B" src="/img_chania.jpg">
  <hr>
  <img alt="" src="<%=contextPath%>/images/img_chania.jpg">
</div>
</body>
</html>
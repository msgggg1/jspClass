<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 2. 오후 3:16:20</title>
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
   	c:out 태그: JspWriter 출력
  </xmp>
  <!-- c:if  c:choose  c:forEach -->
  <c:set var="names" value="홍길동, 서영학, 정창기"></c:set>
  <c:forTokens items="${names}" delims=",/." var="name">
  	<li>${ name }</li>
  </c:forTokens>
  
  <hr>
  
  <%
  	String message = "<h3>Hello World</h3><br>홍길동<br>";
  	
  	/* < &lt;
  	> &gt;
  	개행 <br> */
  %>
  <p id="demo">
  	<%= message %>
  	<br>
  	<c:out value="<%= message %>" escapeXml="false"></c:out><!-- 태그도 문자로 인식 (escapeXml = true) -->
  </p>
</div>
</body>
</html>
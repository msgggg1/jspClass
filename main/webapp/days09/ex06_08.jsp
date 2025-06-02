<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 2. 오후 4:25:39</title>
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
   p.333
   JSTL은 EL에서 사용할 함수를 제공.
   (문자열 등등)
   
   직접 클래스를 구현해서 EL안에서 메서드를 호출(사용)
  </xmp>
  
  <%
  	String message = "<h3>Hello World</h3>";
  %>
  
  <c:set value="<%= message %> var="msg"></c:set>
  <li>${msg }</li>
  <li>${fn:escapeXml(msg)}</li>
  <li>${fn:length(msg)}</li>
  <li>${fn:toUpperCase(msg)}</li>
  <li>${fn:trim(msg)}</li>
  <li>${fn:contains(msg, "llo")}</li>
  <li>${fn:substring(msg, 1, 4)}</li>
</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 2. 오후 2:49:56</title>
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
   	EL : c:forEach 문 사용, c:set 문 사용
   	1+2+3+..+9+10=55 출력
  </xmp>
<%--   
  <c:set var="sum" value="0"></c:set>
  <c:forEach begin="1" end="10" step="1" var="i" >
  	${i}+
  	<c:if test="${i eq 10}"></c:if>
  	<c:if test="${i ne 10}">+</c:if>
  	
  	<c:set var="sum" value="${sum + i }"></c:set>
  </c:forEach>
  =${sum} 
  
--%>

<!-- [2] -->
<c:set var="sum" value="0"></c:set>
<c:forEach begin="1" end="10" step="1" var="i" varStatus="vs" >
	${ i += (vs.last ? "" : "+")}
	<c:set var="sum" value="${sum + i }"></c:set>
</c:forEach>
= ${sum}
</div>
</body>
</html>
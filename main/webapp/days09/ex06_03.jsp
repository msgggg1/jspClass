<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 2. 오후 2:18:42</title>
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
   1) 코어 태그
   	  (1) 변수 선언, 삭제
   	  		  set remove 태그
   	  (2) 흐름 제어
   	  	  [ c:if  c:choose  c:forEach ]  c:forTokens
   	  (3) URL
   	  	  import  redirect  url
   	  (4) 기타
   	  	  catch  out
   
   ex06_03.jsp?kor=100
   90~100 수
   80~89  우
  </xmp>
  
  <form>
  	국어 : <input type="text" name="kor"> <!-- form 태그 안에 input태그 하나 -> 자동 submit -->
  </form>
  
  kor = ${ param.kor}<br>
  empty kor = ${ empty param.kor}<br>
  ! empty kor = ${ ! empty param.kor}<br>
  not empty kor = ${ not empty param.kor}<br>
  
  <c:if test="${not empty param.kor}">
  	<!-- JSTL 변수 선언 -->
  	<!-- value 속성: EL, 표현식, 정적 문자열 -->
  	<%-- <c:set var="score" value="<%= request.getParameter("kor") %>"></c:set> --%>
  	<c:set var="score" value="${ Math.floor(param.kor / 10)}" scope="page">	</c:set>
  	
  	<c:choose>
  		<c:when test="${score == 10 or score eq 9 }">수</c:when>
  		<c:when test="${score eq 8 }">우</c:when>
  		<c:when test="${score eq 7 }">미</c:when>
  		<c:when test="${score eq 6 }">양</c:when>
  		<c:otherwise>가</c:otherwise>
  	</c:choose>
  	
  </c:if>
  
</div>
</body>
</html>
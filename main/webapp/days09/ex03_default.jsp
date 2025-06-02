<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 인증정보 + 권한
	// 인증처리 -> 세션 값 저장. auth 쿠키이름으로 로그인ID 저장.
	String sessionName = "auth";
	String logonId = null;
	
	//			object -> String 형 변환
	logonId = (String)session.getAttribute(sessionName);
	
	request.setAttribute("logonId", logonId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 30. 오전 9:03:10</title>
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
   ex01_default
  </xmp>
  
  <c:choose>
  	<c:when test="${not empty logonId }">
	  <div id="logout" >
	  	[홍길동]님 로그인 하셨습니다.<br>
	  	<a href="ex03_logout.jsp">로그아웃</a>
	  </div>  		
  	</c:when>
  	<c:otherwise>
	  <div id="logon">
	  <form action="ex03_logon.jsp" method="get">
	  	아이디 : <input type="text" name="id" value="admin"><br>
	  	비밀번호 : <input type="password" name="passwd" value="1234" ><br>
	  	<input type="submit">
	  	<input type="reset">
	  	<span style="color:red;display:none">로그인 실패</span>
	  </form> 
	  </div>
  	
  	</c:otherwise>
  </c:choose>
  
  <br>   
  <!-- 로그인 X -->
  <a href="/jspPro/board/list.do">게시판</a><br>
  
  <%
     if( logonId != null ){
  %>
  <!-- 로그인 O -->
  <a href="#">자료실</a><br>
  <a href="#">일정관리</a><br>   
  <%
        if( logonId.equals("admin")){
  %>
  <!-- 로그인 O + admin 관리자로 로그인 -->
  <a href="#">급여관리</a><br>
  <a href="#">인사관리</a><br> 
  <%         
        } // if
     } // if
  %>
  
  <script>
  	// ~~~~?logon=fail
  	if(${param.logon eq "fail"}){
  		$("#logon span")
  				.fadeIn()
  				.fadeOut(3000);
  	}
  	
  </script>
  
  
</div>
</body>
</html>
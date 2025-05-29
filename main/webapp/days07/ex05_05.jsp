<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 29. 오후 4:12:43</title>
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
    ?ckbCookie=bgColor
  </xmp>
  
  <%!
  	// JSP 스크립트 종류 3가지 : 스크립트릿, 표현식, [선언부- 변수, 메서드]
  		public String getCookieValue(String cookieName, HttpServletRequest request){
	  	Cookie [] cookieArr = request.getCookies();
	  	for(Cookie c : cookieArr ){
	  		if(c.getName().equals(cookieName)){
	  			try{
	  				return URLDecoder.decode(c.getValue(),"UTF-8");
	  			}catch(Exception e){
	  			}
	  		}
	  	}
	  				return null;
  }
  %>
  
  <form action="ex05_05_ok.jsp">
  <%
	// ?ckbCookie=bgColor&~~
	String [] updateCookieNameArr = request.getParameterValues("ckbCookie");
	// 유효시간 : 0 
	for(int i = 0 ; i < updateCookieNameArr.length ;  i++){
		
		String cookieName = updateCookieNameArr[i];
		String cookieValue = getCookieValue(cookieName, request);
  %>
  <li>
  	<%= cookieName %> : <input type="text" name="<%= cookieName%>" value="<%= cookieValue%>"><br>
  </li>
  <%	
	
	}
  %>
	</form>
  	<br>
  	<input type="submit" value="쿠키 수정">
</div>
</body>
</html>
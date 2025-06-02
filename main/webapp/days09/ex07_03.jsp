<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 필터	com.filter.CharacterEncodingFilter
	// request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 2. 오후 5:06:17</title>
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
   ex07_03.jsp
  </xmp>
  <%
  	// JSP  GET/POST get 한글 안깨짐. post 깨짐/ POST - ISO 8859-1 인코딩
  	// 서블릿 GET/POST
  	String name = request.getParameter("name");
  	String age = request.getParameter("age");
  %>
  
  전달된 한글이름 : <%= name %><br>
  전달된 나이	  : <%= age %><br>
  
  <hr>
  전달된 한글이름 (EL) : ${param.name }<br>
  전달된 나이 (EL) 	   : ${param.age }<br>
  
  <a href="ex07_02.jsp">ex07_02.jsp</a>
</div>
</body>
</html>
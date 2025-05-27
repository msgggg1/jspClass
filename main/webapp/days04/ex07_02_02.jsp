<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 26. 오후 5:16:58</title>
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
  
  <%
  	
  
  	String name = request.getParameter("name");
  	// String age = request.getParameter("age");
  %>
  
  <form action="ex07_03.jsp">
  	address: <input type="text" name="address" value="서울 역삼동"><br>
  	tel: <input type="text" name="tel" value="010-111-111"><br>
  	<input type="button" value="Prev" onclick="history.back();">
  	<input type="submit" value="Next">
  	
  	<input type="hidden" name="name" value="<%=name%>"><br><!-- 다음 페이지로 넘기고자 하는 목적 -->
  	<%-- <input type="hidden" name="age" value="<%= age%>"><br> --%>
  	<input type="hidden" name="age" value=`${param.age}`><br>
  </form>
  
</div>
</body>
</html>
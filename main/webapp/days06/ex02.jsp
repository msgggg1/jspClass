<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 28. 오후 4:04:19</title>
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
   p 140 JSP 페이지에서 에러 발생할 때 처리하는 방법
   	1) try~catch 문 사용
  </xmp>
  
  <%
  	String name = null;
   	
   	try{
	name = request.getParameter("name");
	// name 파라미터값을 대문자로 변환해서 저장
	name.toUpperCase(); // null 대문자로 변환하려고하니 오류 떨어짐
	%>
  > name = <%= name %>
	<%	
   	}catch(NullPointerException e){
   		out.println("오류: name 파라미터 X");
   	}catch(Exception e){
   		e.printStackTrace();
   	}finally{
   		// 마무리 작업 코딩
   	}
  %>
  
  <br>
  <br>
	<!-- 404 -> 예외 처리 페이지로 응답 -->
	<a href="ex1000.jsp">ex1000.jsp</a>
	<br>
	<a href="ex1001.jsp">ex1001.jsp</a>
	<br>
  
</div>
</body>
</html>
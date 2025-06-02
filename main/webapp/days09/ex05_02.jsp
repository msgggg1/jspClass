<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 2. 오전 11:22:28</title>
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
  	String name ="admin";
  	request.setAttribute("name", name);
  %>
  
  요청 URI : <%=request.getRequestURI()%><br>
  EL 요청 URI : ${pageContext.request.requestURI}<br>
  <!-- pageContext -> JSP 모든 기본 객체 얻어올 수 있음. -->
  
  name = <%= request.getAttribute("name") %><br> 
  EL name = ${requestScope.name}<br>
  
  <!-- pageScope, requestScope, sessionScope, applicationScope 
  		를 모두 차례대로 찾는다.(다 뒤짐) 
  		영역.name		
  -->
  EL name = ${name}<br>
   
  request의 name 속성 : ${requestScope.name }<br>
  
  code: <%= request.getParameter("code") %><br>
  EL code파라미터: ${param.code}<br>
</div>
</body>
</html>
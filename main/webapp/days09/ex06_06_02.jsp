<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 2. 오후 3:24:25</title>
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
   배열	c:forEach 문
   Map	c:forEach 문
  </xmp>
  
  <%
  	Map<String, String> map = new HashMap<>();
  	map.put("id", "admin");
  	map.put("name", "홍길동");
  	map.put("age", "20");
  %>
  
  <c:set value="<%= map %>" var="mm"></c:set>
  <%-- <c:forEach items="<%= map %>" var="entry"> --%>
  <c:forEach items="${mm}" var=entry>
  	<li>${entry.key} - ${entry.value}</li>
  </c:forEach>
  
  <hr>
  
  ID = <%= map.get("id") %><br>
  
  <hr>
  
  <%
  	int [] m = { 3, 15, 2, 4, 1};
  	request.setAttribute("m", m);
  %>
  
  <c:set var="m" value="<%= m %>"></c:set>
    <c:forEach items="${  m }" var="i" varStatus="vs">
  	<li>m[${vs.index }]=${i }</li>
  </c:forEach>
  
<%--   
  <c:forEach items="<%= m %>" var="i" varStatus="vs">
  	<li>m[${vs.index }]=${i }</li>
  </c:forEach>
  --%>
</div>
</body>
</html>
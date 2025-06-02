<%@page import="days07.MemberInfo"%>
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
<title>2025. 6. 2. 오후 2:31:15</title>
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
  	Map<String, String> map = new HashMap<>();
  	map.put("id", "admin");
  	map.put("passwd", "1234");
  	
  	request.setAttribute("map", map);
  %>
  
  id = <%= map.get("id") %><br>
  passwd = <%= map.get("passwd") %><br>
  
  <hr>
 <%--  <c:set var="map" value="<%= map %>"></c:set> --%>
  <c:set var="map" value="${ map }"></c:set>
  id = ${map.id }<br>
  passwd = ${map.passwd }<br>
  
  <hr>
  
  <%
  	MemberInfo member = new MemberInfo();
  	member.setId("admin");
  	member.setName("홍길동");
  	// member.setEmail("admin@naver.com");
  %>
  
  <%-- <c:set var="vo"><%= member %></c:set> 아래와 동일 코딩--%>
  <c:set var="vo" value="<%= member %>" ></c:set>
  <c:set target="${vo}" property ="email" value="admin@naver.com" ></c:set> <!-- 위 member.setEmail("admin@naver.com"); 동일 -->
  id = ${vo.id}<br>
  name = ${vo.name}<br>
  email = ${vo.email}<br>
  
  <hr>
 	<%
 		// c:set 태그의 value 속성값 : 표현식, EL, 정적 문자열 가능
 		String name = "hong";
 		request.setAttribute("name"	, name);
 	%> 
 	
 	<c:set value="<%= name %>" var="n1"></c:set>
 	
 	name(표현식) : <%= name %><br>
 	name(el) : ${ name }<br>
 	
</div>
</body>
</html>
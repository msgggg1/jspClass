<%@page import="java.util.Date"%>
<%@page import="days07.MemberInfo"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 29. 오후 2:19:30</title>
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
   ex04_04.jsp
   jsp: useBean 액션 태그를 사용.
  </xmp>
  
    <%
  	String id = request.getParameter("id");
  	String name = request.getParameter("name");
  	String passwd = request.getParameter("passwd");
  	String email = request.getParameter("email");
  	
  	/* 
  	MemberInfo mi = new MemberInfo();
  	mi.setId(id);
  	mi.setName(name);
  	mi.setPasswd(passwd);
  	mi.setEmail(email); 
  	*/
  %>
  <!--                       풀네임                    MemberInfo mi = new MemberInfo();와 완전히 동일한 코딩 -->
  <jsp:useBean id="mi" class="days07.MemberInfo" scope="page"></jsp:useBean>
  <jsp:setProperty property="id" name="mi" value="<%= id %>"/><!-- mi.setId(id);  id라고 적었지만 setter(setId)를 준 것임. 따라서 @Setter없으면 오류-->
  <jsp:setProperty property="name" name="mi" value="<%= name %>"/>
  <jsp:setProperty property="passwd" name="mi" value="<%= passwd %>"/>
  <jsp:setProperty property="email" name="mi" value="<%= email %>"/>
  <jsp:setProperty property="registerDate" name="mi" value="<%= new Date()%>"/>
 
  아이디 : <jsp:getProperty property="id" name="mi"/><br>
  이름 : <jsp:getProperty property="name" name="mi"/><br>
  비밀번호 : <%= mi.getPasswd() %><br>
  이메일 : <%= mi.getEmail() %><br> 
  
</div>
</body>
</html>
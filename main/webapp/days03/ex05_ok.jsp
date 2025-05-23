<%@page import="java.util.Arrays"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 23. 오후 4:42:46</title>
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
  	String gender = request.getParameter("gender");
  	
  	String [] petArr = request.getParameterValues("pet");
  	
  	
  %>
  
  > 이름 : <%= name %><br>
  > 이름(EL) : ${ param.name }<br>
  > 이름 : <%= gender.equals("m") ? "남자": "여자" %><br>
  > 좋아하는 동물 : <%=Arrays.toString(petArr) %><br>
  
  <hr>
  
  <%
  	Enumeration<String> en = request.getParameterNames();
  	while(en.hasMoreElements()){
  		String pName = en.nextElement();
  	
  %>
  >> 전송된 파라미터 이름: <%= pName %><br>
  <%
  	} 
  %>
</div>
</body>
</html>
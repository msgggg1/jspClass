<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 23. 오후 5:06:27</title>
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
   	p.90
   	[요청 헤드 정보]
   	request.getHeader(String name)
   	request.getHeaders(String name)
   	request.hetHeaderNames()
   	request.getIntHeader(String name)
   	request.getDateHeader(String name)
   	
   	[헤드 정보 설정]
   	setHeader()
   	setIntHeader()
   	setDateHeader()
   	
   	addHeader(name, value);
   	addIntHeader(name, value);
   	addDateHeader(name, value);
  </xmp>
  
  <h3>요청 헤드 정보 조회</h3>
  <ol>
  	<%
  		Enumeration<String> en= request.getHeaderNames();
  		while(en.hasMoreElements()){
  			String headerName = en.nextElement();
  			String headerValue = request.getHeader(headerName);
  	%>
  		<li><%=headerName %>: <%= headerValue %>
  	<%
  		}
  	%>
  </ol>
</div>
</body>
</html>
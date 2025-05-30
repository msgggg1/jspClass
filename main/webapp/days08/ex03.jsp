<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 30. 오후 4:09:04</title>
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
   	ex03.jsp
   	[ 커넥션 풀( Connection Pool )]
   	
   	META-INF
   		ㄴ context.xml 추가
   		
   		com.util.DBConn.java 오늘부터 사용X
   		com.util.ConnectionProvider.java 커넥션 풀 사용 라이브러리
  </xmp>
  
  <%
 /*  
  Context initContext = new InitialContext();
  Context envContext  = (Context)initContext.lookup("java:/comp/env");
  DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
  Connection conn = ds.getConnection(); 
  */
  
  Connection conn = ConnectionProvider.getConnection();
  %>
  > conn = <%=conn %>
  <%
  	conn.close();// 커넥션 객체 소멸x, 커넥션 풀에 돌려줌(반환)
  %>
</div>
</body>
</html>
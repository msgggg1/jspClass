<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 27. 오전 9:02:01</title>
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
  
  	(1) 게시글 목록
  	 	요청 URL: /jspPro/cstvsboard/list.htm
  	 	서블릿  : days05.board.List.java
  	 			포워딩
  	 			days05/board/list.jsp 	
  	(2) days05.board.domain 패키지
  		ㄴ BoardDTO.java
  	(3) days05.board.persistance 패키지
  		ㄴ BoardDAO.java
  		ㄴ BoardDAOImpl.java
  </xmp>
  
  <a href="/jspPro/cstvsboard/list.htm">게시글 목록</a>
  
  
</div>
</body>
</html>
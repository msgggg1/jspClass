<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 26. 오후 5:12:06</title>
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
   	[상태관리] - DB, 세션, 쿠키 등
			 - input type="hidden"
	ex07.jsp -> ex07_02.jsp -> ex07_03.jsp
	이름			주소				이름/나이/주소/연락처 출력
	나이			연락처
	[다음]   		[이전][다음]
   	
  </xmp>
  
  <form action="ex07_02.jsp">
  	name: <input type="text" name="name" value="홍길동"><br>
  	age: <input type="text" name="age" value="20"><br>
  	<input type="submit" value="Next">
  </form>
</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 23. 오후 4:35:59</title>
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
   	[요청 파라미터 읽기 메서드 정리] p.78
   	ex05.jsp?name=홍길동&age=20 ...
   	1. request.getParameter();
   	2. request.getPara_Values();
   	3. request.getParameter_Names();
   	4. request.getParameter_Map();
	
  </xmp>
  
  <form action="ex05_ok.jsp" method="get">
  	이름 : <input type="text" id="name" name="name" placeholder="이름을 입력하세요." value="홍길동"><br>
  	성별 : 
  	<input type="radio" name="gender" value="m" checked>남자
  	<input type="radio" name="gender" value="f">여자
  	<br>
  	좋아하는 동물 :
  	<input type="checkbox" name="pet" value="dog" checked>개  	
  	<input type="checkbox" name="pet" value="cat" >고양이  	
  	<input type="checkbox" name="pet" value="pig" >돼지  	
  	
  	<input type="submit">
  </form>
</div>
</body>
</html>
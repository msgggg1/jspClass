<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 5. 오후 3:06:36</title>
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
  
  <form action="ex08_ok.jsp" method="post" enctype="multipart/form-data">
  메세지: <input type="text" name="msg" value="Hello World"><br>
  <button type="button">첨부파일 추가</button>
  <div id="filebox">
  첨부파일 1 : <input type="file" name="file1"><br>  	
  </div>
  <input type="submit">
  </form>
  
  <script>
  	$(function(){
  		$("button").on("click", function(){
  			let no = $("#filebox :file").length + 1;
  			$("#filebox").append(
  				`첨부파일 \${no} : <input type="file" name="file\${no}"><br>`		
  			);
  		})
  	})
  </script>
  
</div>
</body>
</html>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 4. 오후 12:21:01</title>
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
   ex03_02.jsp
   jquery ajax 처리 - load() jquery 메서드 존재
  </xmp>
  
   서버 요청 시간 : <%= new Date().toLocaleString()%>
  <br>
  
  <input type="button" value="jquery ajax test" >
  <br>
  <p id="demo"></p>
  
</div>

<script type="text/javascript">
	$(function(){
		$(":button").on("click", function(){
			//alert("버튼클릭");
			$("#demo").load("ex03_ajax_info.txt", function(responseText, textStatus, jqXHR){ // 로딩 후 호출(콜백함수)
				if (textStatus == "success") {
					let replyText = responseText;
					let nameArr = replyText.split(",");
					$("#demo").empty();
					for ( let name of nameArr) {
						$("#demo")
							.append($("<li></li>").text(name));
					}
				}
			});
		})
	});
</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 10. 오전 9:00:53</title>
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
   days13.ex01.jsp
  </xmp>
  
  <a href="ex01_02.jsp?lat=37.499294&lng=127.0331883">(주)쌍용교육센터</a>
  <br>
  <br>
  
  <!-- 지도를 출력할 컨테이너 div 태그 선언  -->
  <div id="googleMap" style="width: 100%; height: 400px"></div>
  
  <script>
  	// 영국 런던 위도, 경도
  	function myMap(){
	  	var  mapOptions = {
	  			center:	new google.maps.LatLng(51.508742, -0.120850)
	  			, zoom: 5 // 확대 축소 값
	  	};
  		var map = new google.maps.Map(
  				document.getElementById("googleMap") // 컨테이너
  				, mapOptions
  		);
  		
  	}
  </script>
  
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBNkOPhB9o1tiBTO2fgY1zFa3N40HeZWmE&callback=myMap"></script>
  
</div>
</body>
</html>
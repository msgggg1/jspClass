<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 4. 오후 4:48:35</title>
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
   구글 맵 
  </xmp>
  
  <div id="googleMap" style="width: 100%; height:400px;"></div>
  
  <script>
  	function myMap(){
  		var mapProp = {
  				center: new google.maps.LatLng(51.508742,-0.120850),
  				zoom: 5,
  		};
  		var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
  	}
  </script>
  
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBNkOPhB9o1tiBTO2fgY1zFa3N40HeZWmE&callback=myMap"></script>
  
</div>
</body>
</html>
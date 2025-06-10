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
   days13.ex01_02.jsp
  </xmp>
  
  <br>
  
  <!-- 지도를 출력할 컨테이너 div 태그 선언  -->
  <div id="googleMap" style="width: 100%; height: 400px"></div>
  
  <script>
  	
  	
  	function myMap(){
  		// 쌍용교육센터 위도, 경도
  		let lat = <%= request.getParameter("lat")%>;
  		let lng = ${param.lng};
  		const mapCanvas = document.getElementById("googleMap");
  		let mapCenter = new google.maps.LatLng(lat, lng);

  		var  mapOptions = {
	  			center:	mapCenter
	  			, zoom: 15 // 확대 축소 값
	  	};
  		var map = new google.maps.Map(
  				mapCanvas // 컨테이너
  				, mapOptions
  				
  		);
  		
  	// 구글맵 - 오버레이(마커, 폴리라인, 원, 사각형, 정보창 등등)
  		let marker = new google.maps.Marker({
  			position: mapCenter
  			//, animation: google.maps.Animation.BOUNCE
  			, icon: "pinkball.png"
  		});
  		marker.setMap(map);
  		
  		// 오버레이(Overlays) - 정보창
  		// let message = "<a href='http://www.sist.co.kr'>(주)쌍용교육센터</a>";
  		let message = "<a href='http://www.sist.co.kr'><img alt='lezhin.com 로고' src='//img-s-msn-com.akamaized.net/tenant/amp/entityid/BBFwET1.img'></a>";
  		let infoWindow = new google.maps.InfoWindow();
  		infoWindow.open(map, marker);
  		
  	}
  </script>
  
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBNkOPhB9o1tiBTO2fgY1zFa3N40HeZWmE&callback=myMap"></script>
  
</div>
</body>
</html>
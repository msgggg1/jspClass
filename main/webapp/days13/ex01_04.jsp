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
   days13.ex01_04.jsp
   마우스 클릭 이벤트 처리
   마커 클릭하면 그 때 정보창 출력 
  </xmp>
  
  <br>
  
  
  <!-- 지도를 출력할 컨테이너 div 태그 선언  -->
  <div id="googleMap" style="width: 100%; height: 400px"></div>
  
  <script>
	function getRndNumber(min, max) {
	      return (Math.random() * (max - min) ) + min;
	   }
  	
  	function myMap(){
  		// 쌍용교육센터 위도, 경도
  		let lat = 37.499294;
  		let lng = 127.0331883;
  		const mapCanvas = document.getElementById("googleMap");
  		let mapCenter = new google.maps.LatLng(lat, lng);

  		var  mapOptions = {
	  			center:	mapCenter
	  			, zoom: 5 // 확대 축소 값
	  	};
  		var map = new google.maps.Map(
  				mapCanvas // 컨테이너
  				, mapOptions
  				
  		);
  		
  		let marker = new google.maps.Marker({
  			position: mapCenter
  		});
  		marker.setMap(map);
		
  		// 오버레이(Overlays) - 정보창
  		// let message = "<a href='http://www.sist.co.kr'>(주)쌍용교육센터</a>";
  		let message = "<a href='http://www.sist.co.kr'><img alt='lezhin.com 로고' src='//img-s-msn-com.akamaized.net/tenant/amp/entityid/BBFwET1.img'></a>";
  		let infoWindow = new google.maps.InfoWindow({
  				content : message
  		});
  		
 		// 지도를 클릴할 때 정보창 표시 
 		google.maps.event.addListener(marker, "click", function(){
 			map.setZoom(15);
 			map.setCenter( marker.getPosition() );
 			
 			infoWindow.open(map, marker);
 			
 			// 3초 후에 정보창을 자동으로 닫히게
 			window.setTimeout( function(){
 				infoWindow.close();
 				map.setZoom(5);
 			} , 3000);
 		});
  		
  	}
  </script>
  
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBNkOPhB9o1tiBTO2fgY1zFa3N40HeZWmE&callback=myMap"></script>
  
</div>
</body>
</html>
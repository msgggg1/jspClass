<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 4. 오후 12:20:53</title>
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
   js ajax 처리
  </xmp>
  
  서버 요청 시간 : <%= new Date().toLocaleString()%>
  <br>
  
  <input type="button" value="js ajax test" onclick="load('ex03_ajax_info.txt');">
  <br>
  <p id="demo"></p>
  
  
</div>

<script>
	let xhRequest; 
	
	function getXMLHttpRequest(){
	      if (window.ActiveXObject) { // IE 브라우저 옛날꺼
	       try{
	        return  ActiveXObject("Msxml2.XMLHTTP");
	       }catch(e){
	          try{
	             return new ActiveXObject("Microsoft.XMLHTTP");
	          }catch(e){
	             return null;
	          }
	       }
	      }else if( window.XMLHttpRequest  ){
	         return new XMLHttpRequest();
	      }else {
	         return null;
	      }
	   }
	
	function load(url) {
		// 1. XMLhttpRequest 객체 생성 // 일할 직원
		xhRequest = getXMLHttpRequest(); // 브라우저가 제공
		xhRequest.onreadystatechange = callback; // 상태 바뀔 때마다 계속 호출
		// 2. 설정
		xhRequest.open("GET", url, true);
		// 3. 일시키기
		xhRequest.send();
	}
	
	function callback() {
		if (xhRequest.readyState == 4) {//갔다왔는지
			if (xhRequest.status == 200) {// 성공했는지
				let replyText = xhRequest.responseText;
				//alert(replyText);
				let nameArr = replyText.split(",");
				$("#demo").empty();
				for ( let name of nameArr) {
					$("#demo")
						.append($("<li></li>").text(name));
				}
			}
		}
	}
</script>
</body>
</html>
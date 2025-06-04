<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 4. 오후 12:02:29</title>
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
   	1. [Ajax]
   		Asynchronous javascript and xml
   		비동기적인	      자바스크립트  + xml
   								요즘은 JSON -> 가볍다
   	2. 네이버 메인페이지 : 날씨, 환율, 증시 정보
   	3. js ajax 처리 순서 (과정)
   		(1) 웹 페이지에서 이벤트 발생
   		(2) XMLHttpRequest 객체 생성
   		(3) XMLHttpRequest 객체 + 할 일 설정
   			open() : 비동기적으로 처리할 설정. 연다X
   			
   		(4) 비동기적으로 요청 -> 응답 데이터 처리
   			send()
   			
   		예)
   		A) get 방식                                                비동기적 처리O/  동기적 처리 false
              XMLHttpRequest객체.open("GET", "/test.jsp?id=admin", true);
              XMLHttpRequest객체.send();
        B) post 방식
              XMLHttpRequest객체.open("POST", "/test.jsp", true);
              XMLHttpRequest객체.send("id=admin");
               
        ㄴ. XMLHttpRequest 객체 - on readystatechage 이벤트 속성  
               if( state = 200 + readState == 4 ) 성공200 갔다왔다 4
                   // 응답 데이터(d/t 성공)
                   1) 텍스트(JSON) - responseText 속성 (json도 text, 문자열임)
                   2) xml        - responseXML 속성    
                   				ex03.jsp
                   				ex03_02.jsp
                   				ex03_ajax_info.txt
  </xmp>
</div>
</body>
</html>
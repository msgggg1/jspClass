<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 2. 오전 9:02:12</title>
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
   [ MVC 패턴 - 게시판 구현 ]
   모델2 구조
   [ C - 컨트롤러 (서블릿) ] ***
   *.do
   모든 요청 list.do, write.do, edit.do 등등
   web.xml 서블릿 등록
   path
   commandHandler.properties 설정파일 - load~ start 1 (시작 시 자동으로 등록되게)
   CommandHandlerMap(key 요청url, value 모델 객체)
   init(){
   		
   }
   
   doPost(){ doGet(); }
   doGet(){
   	1. 요청 URL 분석	/board/list.do
   	2. 모델 - 로직 처리
   		CommandHandler handler =commandHandlerMap.get("/board/list.do");
   		String view = handler.process(); 일
    						ㄴ request/session 저장
    						ㄴ 리다이렉트
    4. 
    5. 포워딩
   }
   
   [ M - 모델]
   CommandHandler.java 인터페이스
   	ㄴ String process(r,r)	
   ListHandler.java
   WriteHandler.java
   
   	ㄴ BoardDTO, VO
   	ㄴ BoardDAO, BoardDAOImpl.java
   	
   	[ V - 뷰 ]
   	list.jsp
   	write.jsp
   	
   	[ list.do -> 요청 ]
   
   
   
   1. DispatcherServlet: 모든 요청을 받아서, 맞는 handler에 분배한다.
   						 web.xml에 서블릿을 등록하고, commandHandler.properties에 매핑 설정한다.
   2. 모든 Handler는 CommandHandler를 상속받는다. 각 핸들러는 DAO와 연계하여 해당하는 작업이 일어나거나 리다이렉션 혹은 포워딩 주소(뷰)를 반환한다.   
  </xmp>
</div>
</body>
</html>
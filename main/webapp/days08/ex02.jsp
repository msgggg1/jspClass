<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 30. 오전 9:43:44</title>
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
   [ p516 chapter 18 MVC 패턴 구현 ]
   
   .htm?type=list
   .htm?type=edit
   .htm?type=write&seq=10
   
   /board/delete/10
   /board/view/10
   /board/edit/10
   /board/list/1
   주소 속에 명령어의 의미 포함되어있음.
   
   [ days05.board 게시판 -> MVC 패턴으로 변경(수정) ]
   
   days08.mvc.domain 패키지 추가
   		ㄴ BoardDTO.java
   		ㄴ PagingVO.java
   		
   days08.mvc.persistence 패키지 추가
   		ㄴ BoardDAO.java
   		ㄴ BoardDAOImpl.java
   		
   x days08.mvc.service 패키지 추가
   
   days08.mvc.command 패키지 추가 - [M]VC 모델 저장
   		ㄴ CommandHandler.java 인터페이스 구현
   		
   days08.mvc.controller 패키지 추가 -MV[C] 컨트롤러 (유일한 서블릿)
   		ㄴ DispatcherServlet.java
   		
   명령어 = 모델객체(CommandHandler)		설정파일
   WEB-INF
   		ㄴ CommandHandler.properties 설정파일 생성
   		
   	web.xml 복붙 -> web_days07.xml
   
  </xmp>
</div>
</body>
</html>
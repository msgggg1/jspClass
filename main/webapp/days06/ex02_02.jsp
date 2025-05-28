<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page errorPage="/WEB-INF/error/viewErrorMessage.jsp"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 28. 오후 4:15:52</title>
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
   HTTP 상태 500 - 내부 서버 오류
   1) 응답 상태 코드 
   	 404: 요청 URL을 처리하기 위한 자원 존재 X
   	 500: 서버 내부 에러 (자바 코딩 X)
   	 200: 요청을 정상적으로 처리
   	 401: 접근 허용 X (접근권한) 
   	 403: get/post 요청 방식, PUT 요청 X
   	 400: 클라이언트의 요청이 잘못된 구문으로 구성.
   	 
   	2) 아래 코딩의 500번 에러에 대한 에러페이지 지정
   	   WEB-INF 폴더 안에 자원 넣어두면 외부에서 직접 요청할 수 없음 -> 여기에 넣어놓는다
   	   	ㄴ error 폴더 생성
   	   		ㄴ viewErrorMessage
   	   		
   	   		페이지 지시자에 지시
   	   		WEB.xml 에 명시. 내부적으로 포워딩됨 . 셋팅만해놓고 제일 마지막에 활성화.(오류메세지 확인해야함. )
   	   		
   	   		
  </xmp>
  
 name : <%= request.getParameter("name").toUpperCase()%>
</div>
</body>
</html>
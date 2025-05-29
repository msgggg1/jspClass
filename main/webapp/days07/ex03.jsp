<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 29. 오전 10:42:09</title>
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
   [ Chapter 05 (p.116) JSP 기본 내장 객체 정리 ]
   1. request 		: HttpServletRequest*** (자료형)	  - 영역(SCOPE)
   2. response 		: HttpServletResponse***
   3. out			: JspWriter
   4. exception 	: Throwable
   5. session   	: HttpSession  - 영역(SCOPE) session
   6. application 	: ServletContext- 영역(SCOPE) application
   	  웹 사이트(애플리케이션)에 대한 정보를 저장.
   	  [web.xml]
   	  웹 사이트 전체에서 사용할 공통 환경 설정
   	  
   	  
   	  ex03_02.jsp
   8. config 		: ServletConfig 설정 정보 저장
   
   7. pageContext 	: PageContext - 영역(SCOPE) page
   		ㄴ jsp 페이지의 정보를 저장하는 객체. 데이터 저장(set), get 하기 위한 객체. 저장소 영역을 나타냄
   9. page 			: Object
   		ㄴ jsp 페이지 자체(서블릿 클래스) -> 서블릿 객체를 나타냄
  </xmp>
</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 2. 오후 12:13:25</title>
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
   EL 비교연산자
   		== != <  >   <=  >= 
   		eq ne lt gt  le  ge
   EL 수치연산자
   		+ - * /(div 도 가능) %(mod 가능)
   EL 논리연산자
   		&& and
   		|| or
   		!  not
  </xmp>
  
  null			long 0 으로 처리된다
  ${null + 3 }<br>      <!--3 출력  -->
 ${"10" + 3 } == 13<br>  <!-- 숫자로 자동 변환 -->
  <%-- ${"문자열" + 3 }<br> --%> <!-- 오류남 -->
  
  <hr>
  <!-- EL 3.0
  1) n 변수를 생성하고 2) 10값을 할당한 후에 3) 출력 
  -->
  ${ n = 10}
  
  <!-- EL 3.0
  여러 개의 수식을 세미콜론으로 연결할 수 있다.  
  출력은 제일 마지막 것만 출력됨.
  -->
  ${ 1+1 ; 10+10 ; 3+3}<br>
  
  <hr>
  
   ${10 == 3 }<br>
   ${10 eq 3 }<br>
   ${10 != 3 }<br>
   <%-- ${10 ne 3 }<br> --%>
   ${10 < 3 }<br>
   ${10 lt 3 }<br>
   ${10 > 3 }<br>
   ${10 gt 3 }<br>
   ${10 <= 3 }<br>
   ${10 le 3 }<br>
   ${10 >= 3 }<br>
   ${10 ge 3 }<br>
  
  <hr>
  
  ${10 + 3 }<br>
  ${10 - 3 }<br>
  ${10 * 3 }<br>
  <%-- ${10 / 3 }<br> --%>
  <%-- ${10 div 3 }<br> --%>
  ${10 % 3 }<br>
  ${10 mod 3 }<br>
  
  ${ -3 }<br>
</div>
</body>
</html>
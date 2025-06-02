<%@page import="days09.FormatUtil"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 2. 오후 12:27:04</title>
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
  
  	empty 연산자
  	empty null 			true
  	empty ""			true
  	empty 0 			true
  	empty map			true
  	empty collection	true
  	empty ArrayList  	true
  	
  	
  	그 외 전부 false
  	
  
   	EL - method 호출
   	FormatUtil
   		ㄴ 인스턴스 메서드 선언 -> 호출
   		ㄴ 클래스 메서드 선언 -> 호출
  </xmp>
  
  <%
  	long price = 22345;
  
  	request.setAttribute("price", price); // 그래야 el에서 사용할 수 있음. 
  	
  	FormatUtil f = new FormatUtil();
  	request.setAttribute("f", f);
  %>
  
  price(EL) : ${ FormatUtil.staticNumber(price, "#,##0") }<br>
  price(EL) : ${ f.number(price, "#,##0") }<br>
  
  price(JSTL) : <fmt:formatNumber value="${price}" pattern="#,##0" /><br>
  
  <hr>
  
  price1 : <%= price %><br>
  
  
  <!-- 세 자리마다 콤마를 찍어서 단가를 출력 -->
  price : <%= String.format("%,d", price) %><br>
  
  <%
  	String pattern = "##,###";
  	DecimalFormat df = new DecimalFormat(pattern);
  %>
  
  
</div>
</body>
</html>
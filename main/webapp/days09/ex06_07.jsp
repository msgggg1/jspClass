<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 2. 오후 3:34:55</title>
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
   국제화 fmt 접두어
   	ㄴ 특정 지역에 따라 알맞은 메시지 출력할 때
   	예) 화폐단위 : 원/엔
   	ㄴ 주로 사용 : 숫자, 날짜 포맷팅
   	
   	fmt: formatNumber
   	fmt: formatDate
   	
   	fmt: parseNumber
   	fmt: parseDate
  </xmp>
  
  <%
  	String strPrice = "1,200.34";
  	// String -> Double 형 변환
  	strPrice= strPrice.replaceAll(",", "");
  	double dPrice = Double.parseDouble(strPrice);
  %>

	double price = <%= dPrice %><br>
	
	<hr>
	<fmt:parseNumber value="<%= strPrice %>" pattern="0,000.00" var="dPrice2" />
	double price2 = ${dPrice2 }<br>
	
	<hr>
	
	<%
		long price = 22345;
		// "22,345.00"
	%>
	<c:set value="<%=price %>" var="lPrice"/>
	<fmt:formatNumber value="${lPrice }" type="number" pattern="##,###.00" var="sPrice" />
	String sPrice = ${sPrice }<br>
	
</div>
</body>
</html>
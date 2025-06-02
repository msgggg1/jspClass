<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="javax.sound.midi.Patch"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 2. 오후 4:07:30</title>
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
   	fmt:parseDate
   	fmt:formatDate
  </xmp>
  
  <%
  	//String -> Date 변환 -> 출력
  	String strNow = "2025년 06월 02일";
  	
  	// [3]
  	String pattern = "yyyy년 MM월 dd일";
  	SimpleDateFormat sdf = new SimpleDateFormat(pattern);
  	Date now = sdf.parse(strNow);
  	  	
  	// [2] java 정규화 클래스 2개 : Pattern, Matcher 클래스
  	/*
  	Pattern pattern = Pattern.compile("(\\d{4})년\\s(\\d{2})월\\s(\\d{2})일");
  	Matcher matcher = pattern.matcher(strNow);
  	
  	if(matcher.find()){
  		String year = matcher.group(1);
  		String month = matcher.group(2);
  		String day = matcher.group(3);
  	}
  	*/
  	
  	// [1]
  	
/*   	int year = Integer.parseInt(strNow.substring(0, 4));
  	int month = Integer.parseInt(strNow.substring(6,8));
  	int date = Integer.parseInt(strNow.substring(10, 12));
  	
  	Date now = new Date(year-1900, month-1, date);
 	System.out.println(now.toLocaleString()); */
 	
 	
  %>
  
  <fmt:parseDate value="<%= strNow %>" pattern="yyyy년 MM월 dd일" var="now"/>
  now = ${now}<br>
  <hr>
  <li><fmt:formatDate value="${now}"/></li>
  <li><fmt:formatDate value="${now}" type="date"/></li>
  <li><fmt:formatDate value="${now}" type="time" /></li>
  <li><fmt:formatDate value="${now}" type="both" /></li>
  
  <li><fmt:formatDate value="${now}" pattern="yyyy년 MM. dd a h:mm" /></li>
  
</div>
</body>
</html>
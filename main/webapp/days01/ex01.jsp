<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!-- @ -> jsp 지시자. 이 경우에 페이지 지시자  -->
<%
	// 스크립트릿(Scriptlet) - jsp서버에서 실행됨
	// 자바코딩(변수, 제어문 등)
	Date now = new Date();
	// 2025-05-21 10:31:22
	String pattern = "yyyy-MM-dd hh:mm:ss";
	SimpleDateFormat sdf = new SimpleDateFormat(pattern);
	String strNow = sdf.format(now);
	System.out.printf("> strNow : %s\n", strNow);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 21. 오전 10:28:19</title>
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
   jsp
  </xmp>
  
  <h3>ex01.jsp(동적페이지) - <%= strNow %></h3><!-- expression 표현식. 출력담당--><!-- 출력하기 위한 용도의 스크립트. 클라이언트 전송(응답) 시 -->
  <h3>ex01.jsp(동적페이지) - <% out.print(strNow); %></h3><!-- 기본 내장 jsp 객체(출력담당) -->
  <h3>ex01.jsp(동적페이지) - <span id="now"></span></h3>
  <!-- <%-- <%--> 서버에서 실행된다는 뜻. 그 안의 코딩은 모두 자바 코딩  --%>-->
  <!-- 서버에서 처리되기때문에 페이지 소스보기에서 안 나타남  -->
</div>

<script>
	let now = '<%= strNow %>'; /* 서버에서 처리 후 처리된 결과물을 JS 변수에 할당. 문자열 -> '', "" 안붙이면 오류남 */
	$("#now").html(now);
</script>
</body>
</html>
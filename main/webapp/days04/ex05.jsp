<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 26. 오전 11:12:56</title>
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
   [ 구현 방식 이해 ]
   1) 브라우저 주소창 [ http://localhost/jspPro/scott/dept ] + Get 방식
   2) ScottDept.java 서블릿 호출 - doGet(){
   		// DB 처리
   		// ArrayList 저장
   		// 포워딩 path = "ex05_dept.jsp"
   }
   3) ex05_dept.jsp 
   	  ArrayList 출력
   4) 하나의 부서를 선택하면 jquery
      /scott/emp 요청
   5) ScottEmp.java 서블릿 호출 - doGet()
   	  // DB 처리
   	  // ArrayList 저장
   	  // 포워딩 path="ex05_emp.jsp"
  </xmp>
  
  <%
  	String contextPath = request.getContextPath();
  %>
  
  <a href="<%=contextPath %>/scott/dept">/scott/dept</a>
  
  
</div>
</body>
</html>
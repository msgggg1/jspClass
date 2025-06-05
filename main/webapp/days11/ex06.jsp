<%@page import="java.io.DataInputStream"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 5. 오후 2:21:16</title>
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
   ex06.jsp
   
   enctype ="multipart/form-data" 설정했을 경우에는
   request 객체로 전송되어져 오는 파라미터를 얻어올 수 없다.
   => 직접 스트림으로부터 개발자가 코딩으로 얻어와야 한다.
   	 (1. 웹에서 라이브러리를 제공한다. - 업로드 컴포넌트)
   	  2. 서블릿 3 - 라이브러리를 제공
  </xmp>
  
  <form action="ex06_ok2.jsp" method="post" enctype="multipart/form-data">
  이름: <input type="text" name="name" value="홍길동"><br>
  첨부파일 : <input type="file" name="upload" multiple="multiple"><br>
  <input type="submit">
  </form>
  <%
  /*
  	// 바이트스트림 : InputStream, OutputStream
  	ServletInputStream sis = request.getInputStream();
  
  	int b = -1;
  	while ( (b = sis.read()) != -1){
  		System.out.printf("[%d]", b);
  	}
  	*/
  %>
  <%
  
  	out.print("> 전송된 스트림 정보 출력<br>");
  	ServletInputStream sis = request.getInputStream();
  	DataInputStream dis = new DataInputStream(sis);
  	String line = null;
  	
  	while((line = dis.readLine()) != null){
  		out.print(line + "<br>");
  	}
  %>
</div>
</body>
</html>









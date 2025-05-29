<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 29. 오후 3:49:15</title>
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
   ex05_03.jsp
   모든 쿠키값을 출력 / 수정, 삭제, 생성
  </xmp>
  
  <form>
  	<%
  		Cookie [] cookieArr = request.getCookies();
  		for(Cookie c : cookieArr){
  			String cn = c.getName();
  			// URLEncoder.encode()
  			// URLDecoder.decode()
  			String cv = URLDecoder.decode(c.getValue(), "UTF-8");
	%>
	<input type="checkbox" name="ckbCookie" value="<%= cn %>">
	<%= cn %> - <%= cv %>
	<br>
	<%
  		}
  	%>
  </form>
  
  <br>
  
  <a href="ex05.jsp">쿠키 Home</a><br>
  <a href="ex05_02.jsp">쿠키 생성</a><br>
  
  수정, 삭제할 쿠키를 체크 한 후 쿠키 수정, 삭제<br>
  
  <a href="ex05_04.jsp">쿠키 삭제</a><br>
  <a href="ex05_05.jsp">쿠키 수정</a><br>
  
</div >

<script>
	// 삭제 링크 클릭
	/* [1]
	$("div a").eq(2).on("click", function(){
		event.preventDefault();
		let url = $(this).attr("href");
		// alert(url);
		let queryString = $("form").serialize();
		// alert(queryString);
		location.href = `\${url}?\${queryString}`;
	});
	*/
	//[2]
	$("div a").eq(2).on("click", function(){
		event.preventDefault();
		let url = $(this).attr("href");
		$("form")
			.attr("action", url)
			.submit();
	});
</script>

<script>
	// 체크 후 쿠키 수정 버튼 클릭할떄
	$("div a").last().on("click", function(){
		event.preventDefault();
		let url = $(this).attr("href"); // ex05_05.jsp
		$("form")
			.attr("action", url)
			.submit();
	});
</script>
</body>
</html>
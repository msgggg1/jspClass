<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 어디있든 서버에서 먼저 처리됨.
	String content = "";
	int sum = 0;
	for(int i = 1; i <= 10 ; i++){
		/* out.print(i+ "+"); */
		content += String.format("%d+", i);
		sum+= i ;
	}
	/* out.print("="+sum); */
	content += String.format("=%d", sum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 21. 오후 2:30:33</title>
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
   
  </xmp>
  
  <p id="demo"><%= content %></p>
  
</div>
</body>
</html>
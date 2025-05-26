<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 26. 오전 10:35:18</title>
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
   	[포워딩, 리다이렉트 개념 이해]
   	ex04.jsp
   	ex04_forward.jsp
   	ex04_redirect.jsp
   	ex04_finish.jsp
  </xmp>
  
<%
	String name = "admin";
	int age = 20;	
	
%>
	<%-- <a href="ex04_redirect.jsp?name=<%=name%>&age=<%=age%>">리다이렉트</a><br>
	<a href="ex04_forward.jsp?name=<%=name%>&age=<%=age%>">포워딩</a><br> --%>
	
	<a href="ex04_redirect.jsp">리다이렉트</a><br>
	<a href="ex04_forward.jsp">포워딩</a><br>
</div>

<script>
$("a").on("click", function(){
		$(this).attr("href", function(index, oldHref){
			return `\${oldHref}?name=<%= name%>&age=<%=age%>`;
		})
});
</script>
</body>
</html>
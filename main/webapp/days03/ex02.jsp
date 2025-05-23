<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 23. 오후 12:15:48</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }   
</style>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
</script>
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
   	1. JSP 테스트
   		1) get 방식 요청 - 홍길동 O
   		2) post 방식 요청 - 홍길동 X 깨짐
   				UTF-8 -> ISO 8859-1
   					request.setCharacterEncoding("UTF-8");
   		
   	2. Servlet 테스트
   		1) get 방식 요청
   		2) post 방식 요청
   		
   		url-patterns = "/method/info.html"
   		days03.Info.java 서블릿 클래스 선언
   		web.xml
   		-> @WebServlet 어노테이션
  </xmp>
  
  <div id="tabs">
  <ul>
    <li><a href="#tabs-1">jsp - get 방식 요청</a></li>
    <li><a href="#tabs-2">jsp - post 방식 요청</a></li>
  </ul>
  <div id="tabs-1">
    <p>
    	1. 웹 브라우저 : 주소창 url 입력 후 요청 - get 방식 요청<br>
    	2. <a>링크 태그 요청<br> 
    	3. location.href 요청<br>
    	4. form method = 'get' 요청<br>
    	
    	<br>
    	정수 : <input type="text" id="n" name="n" value="10"><br>
    	<a href="ex02_ok.jsp">ex02_ok.jsp</a>
    </p>
  </div>
  <div id="tabs-2">
    <p>
    	<!-- form method = "post" -->
    	<form>
    		Name : <input type="text" id="name" name="name" value="홍길동"><br>
    		age : <input type="text" id="age" name="age" value="20"><br>
    		
    		<input type="radio" id="method"  name="method" value="get" checked>GET 요청
    		<input type="radio" id="method"  name="method" value="post">POST 요청
    		
    		<br>
    		<button type="button">전송(submit)</button>
    	</form>
    </p>
  </div>
</div>
  
</div>

<script>
// JSP 페이지에 get/post 요청 클릭 이벤트
<%--
 $("#tabs-2 button").on("click", function(){
	// "get"/"post"
	let method = $(":radio[name=method]:checked").val();
	$(this).parent() // <form>
				.attr({
					"method":method,
					"action": `<%=contextPath%>/days03/ex02_ok_02.jsp`
				})
				.submit();
 });
 --%>
 
 
 $("#tabs-2 button").on("click", function(){
		// "get"/"post"
		let method = $(":radio[name=method]:checked").val();
		$(this).parent() // <form>
					.attr({
						"method":method,
						"action": `<%=contextPath%>/method/Info.htm`
					})
					.submit();
	 }); 

</script>

<script>
		
	$("#tabs-1 a").on("click", function(){
		/*
		let n = $("#n").val();
		let oldHref = $(this).attr("href");
		let newHref = `\${oldHref}?n=\${n}`;
		$(this).attr("href", newHref);
		*/
		
		 
		
		// 풀이 2
		$(this).attr("href", function(index, oldHref){
			
			let n = $("#n").val(); 
			return `\${oldHref}?n=\${n}`;
			
		});
		
	});
</script>
</body>
</html>
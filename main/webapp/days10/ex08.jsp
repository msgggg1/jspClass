<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 4. 오후 4:17:32</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }   
</style>

<script src="httpRequest.js"></script>

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
   dept 부서정보 : xml, json
   ex08.jsp에서 ajax 요청해서 출력
   
   ex08_dept.xml
   ex08_dept.json
  </xmp>
  
   <button type="button">ex08_dept.json -> ajax 요청 처리</button>
  
   <p id="demo"></p>
   
   
   <script>
   		$("button").on("click", function(){
   			// alert("이벤트 확인")
   			sendRequest("ex08_dept.json", null, callback, "GET");
   		});
   		
   		function callback(){
   			if( httpRequest.readyState == 4 ){ // 서버 요청 완료
   	         if( httpRequest.status == 200 ){ // 응답 성공
   	        	 // 텍스트 (JSON)
   	            let replyJSON = httpRequest.responseText;
   	         	// json -> js Object 변환해서 사용하는 것이 편리
   	         	const deptObj = JSON.parse(replyJSON);
   	         
   	         	const deptArr = deptObj.departments; // 배열
   	         	for (let dept of deptArr) {
					console.log(`\${dept.deptno}/\${dept.dname}`);
   	         	$("#demo").append(`<li>\${dept.deptno} / \${dept.dname} / \${dept.loc}</li>`);
				}
   	         
   	         } else{
   	        	 alert("Ajax 실패 : " + httpRequest.status)
   	         }
   	      }
   		}
   </script>
   
</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 4. 오후 4:01:02</title>
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
   ex07.jsp
   xml -> JSON 형식으로 ajax 더 많이 사용
   
   쿠키/세션/DB 저장
   [ 로컬 저장소 읽기/쓰기 ] 
  </xmp>
  
  <button onclick="getPersonJSON();">로컬 저장소의 personJSON 사용</button>
  
  <p id="demo"></p>
  
  <script>
  	// 1. js object
  	const person = {
  			
  				name: "admin",
  				age: 20,
  				city: "seoul"
  	};
  	
  	//2. js Object -> JSON 변환	JSON.stringify()  <-> parse()
  	let personJSON = JSON.stringify(person);
  	// JSON 데이타: {"name":"admin","age":20,"city":"seoul"}
  	// $("#demo").html(personJSON);
  	
  	// 3. 로컬 저장소에 위의 JSON 데이터를 저장. (쿠키 X)
  	localStorage.setItem("personJSON", personJSON)
  	
  	// 4. 로컬 저장소에 저장된 값을 읽어와서 demo에 출력
  	function getPersonJSON(){
  		let pjText = localStorage.getItem("personJSON");
  		// JSON -> js Object 변환 JSON.parse()
  		const person2 = JSON.parse(pjText);
  		
  		$("#demo").html(`\${person2.name} / \${person2["age"]} `);
  		
  		// 로컬 저장소 삭제
  		localStorage.removeItem("personJSON");
  	}
  </script>
  
  
</div>
</body>
</html>
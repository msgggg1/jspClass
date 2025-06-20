<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 20. 오전 9:01:37</title>
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
  	비동기처리 작업 3가지
   1. jquery ajax	: $.ajax()
    get, post 이외
   	put: update
   	delete: delete
   	요청 url속에서 알 수 있음(restful)
   	CRUD 자동으로 매칭됨
   2. html5			: fetch api
   	  fetch API는 
 		ㄴ  JavaScript에서 네트워크 요청(HTTP 요청)을 비동기적으로 처리하기
     		위해 사용하는 최신 웹 API입니다.
 		ㄴ  웹 브라우저에서 서버로 데이터를 요청하거나, 서버에서 데이터를 
     		가져오는 데 사용됩니다. 
 		ㄴ  XMLHttpRequest(xhr)보다 간단하고 가독성이 좋습니다. 다른 프레임워크 사용 시 충돌가능성
 		
 		* fetch 선언 형식
 		  fetch(url, options) // 비동기적으로 url 요청 -> 응답결과 (404, 500 , 200)
 		  .then(response => { // 응답결과 JSON 변환 반환
 		  		// 응답결과		
 		  		// 응답처리 !reponse.ok
 		  				  json, text 등등 원하는 형태로 바꿈
 		  		// 화면 처리 혹은 아래에서 
 		  })
 		  [ .then(jsonData =>{
 		  		// 화면처리
 		  }) ]
 		  .catch(error =>{
 		  		// 오류처리
 		  });
 		  
 		 ㄱ. url    
		fetch("https://example.com/api/data")
		    
		ㄴ. options    
		| 옵션            | 설명                                                                          |
		| ------------- | --------------------------------------------------------------------------- |
		| `method`      | HTTP 요청 메서드 (`GET`, `POST`, `PUT`, `DELETE` 등)                              |
		| `headers`     | 요청 헤더 (`Content-Type`, `Authorization` 등)                                   |
		| `body`        | 요청 본문 (POST, PUT 등에서 사용)                                                    |
		| `cache`       | 캐시 사용 방식 (`default`, `no-cache`, `reload`, `force-cache`, `only-if-cached`) |
		| `credentials` | 쿠키 전송 여부 (`omit`, `same-origin`, `include`)                                 |
		
		a. GET 요청 (기본)
		  fetch("api/users")            // response 객체 반환
		    .then(res => res.json())   // 응답 객체를 JSON으로 파싱해서 다음 then 에 넘겨줌. Promise<JSON 데이터> 반환
		    .then(data => console.log(data)) // 여기서 data 는 응답된 결과 JSON 데이터 객체.. 
		                                     // 여기서 화면에 랜더링 등 작업... 
		    .catch(err => console.error(err));
		  
		  
		  b. GET 요청 + 쿼리 파라미터
		  const params = new URLSearchParams({ page: 1, limit: 10 });
		  fetch(`api/users?${params.toString()}`)
		  
		  c. POST 요청 (JSON 데이터 전송)
		  fetch("api/users", {
		    method: "POST",
		    headers: {
		        "Content-Type": "application/json"
		    },
		    body: JSON.stringify({ name: "Alice", age: 25 })
		})
		.then(res => res.json())
		.then(data => console.log(data))
		.catch(err => console.error(err));
		  
		  d. 응답 처리 (response 객체)
		     fetch("api/test")
		    .then(response => {
		        if (!response.ok) {
		            throw new Error("Network response was not ok");
		        }
		        return response.json();  // 또는 .text(), .blob(), .arrayBuffer(), .formData()
		    });
		  
		  e. 요약
		| 용도               | 사용 방법                                   |
		| ----------         | ------------------------------------------- |
		| 간단한 GET 요청    | `fetch(url)`                                |
		| 서버에 데이터 전송 | `fetch(url, { method: "POST", body: ... })` |
		| JSON 응답 처리     | `.then(res => res.json())`                  |
		| 에러 처리          | `.catch(error => { ... })`                  |
		  
 		
   3. 				: async, await 키워드
    
  </xmp>
</div>
</body>
</html>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 5. 오전 10:17:56</title>
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
    ex02_empjson.jsp
  </xmp>
  
  <h3><%= new Date().toLocaleString() %></h3>
  
  <input type="button" value="jq ajax + emp json">
  <br>
  <select id="cmbEmp"></select>
  <p id="demo"></p>
  
  <script>
  	$(function(){
  		$(":button").on("click", function(){
  			 
  			fetch("ex02_empjson_lib.jsp", {
                 method: "GET",
                 cache: "no-cache" // jQuery의 cache: false와 동일한 효과
             })
             .then(response => {
                 if (!response.ok) {
                     throw new Error("Network response was not ok");
                 }
                 return response.json(); // JSON 형식으로 파싱
             })
             .then(data => {
                 data.emp.forEach(emp => {
                     $("#cmbEmp").append(`<option value='\${ emp.empno}'>\${ emp.ename}</option>`);
                        $("#demo").append(`<li>\${ emp.empno} : \${ emp.ename}</li>`); 
                 });
             })
             .catch(error => {
                 alert("에러~~");
                 console.error("Fetch error:", error);
             });
  			/* 			
  			$.ajax({
  				url: "ex02_empjson_lib.jsp"
  				, type : "GET"
  				//, data : params
  				, cache: false  
  				, dataType: "json"
  				, success : function(data, textStatus, jqXHR){ 
  					// console.log(data.emp); // []
  					$(data.emp).each(function(index, emp){
  						$("#cmbEmp").append(`<option value="\${emp.empno}">\${emp.ename}</option>`);
  						$("#demo").append(`<li>\${emp.empno} : \${emp.ename}</li>`);
  					});
  				}
  				, error: function(){
  					alert("에러")
  				}
  			});
  			*/
  			
  		// [3]  
  		  $(function (){
  		      const params = { deptno: 30, job: "CLERK" }; 
  		     
  		       $("#btn1").on("click", function (){   
  		       // URLSearchParams를 이용해 쿼리 문자열 생성
  		          const queryString = new URLSearchParams(params).toString();
  		          alert( queryString)

  		          // 최종 URL에 쿼리 문자열 추가
  		          fetch(`ex01_emp_json_lib.jsp?\${queryString}`, {
  		              method: "GET",
  		              cache: "no-cache"
  		          })
  		          .then(response => {
  		              if (!response.ok) {
  		                  throw new Error("Network response was not ok");
  		              }
  		              return response.json();
  		          })
  		          .then(data => {
  		             $("#cmbEmp").empty();
  		             $("#demo").empty();
  		              data.emp.forEach(emp => {
  		                 $("#cmbEmp").append(`<option value='\${ emp.empno}'>\${ emp.ename}</option>`);
  		                   $("#demo").append(`<li>\${ emp.empno} : \${ emp.ename}</li>`);
  		              });
  		          })
  		          .catch(error => {
  		              alert("에러~~");
  		              console.error("Fetch error:", error);
  		          });
  		          
  		       }); // click       
  		  }); // ready 
  			
  			
  		})
  	});
  </script>
</div>
</body>
</html>
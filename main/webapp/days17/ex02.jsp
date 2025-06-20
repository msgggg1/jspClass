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
  		})
  	});
  </script>
</div>
</body>
</html>
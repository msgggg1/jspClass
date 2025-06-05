<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 5. 오전 9:02:27</title>
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
   회원가입 중에  
   > id 중복 체크 => Ajax 사용 + JSON
   
   (가정 : emp 테이블의 empno (아이디) 사용 )
   
   ex01.jsp
   ex01_idcheck.jsp
     
   
  </xmp>
  
  <h2>회원가입 페이지</h2>
  
  <form>
  	deptno : <input type="text" name="deptno" value="10" /> <br>
  	empno : <input type="text" name="empno" value="7369" />
  	<input type="button" id="btnEmpnoCheck" value="ID 중복체크- jquery" />
  	<p id="notice"></p>
  	
  	<br>
  	ename : <input type="text" name="ename" /> <br>
  	job : <input type="text" name="job" value="" /><br>
  	: 
  	<br>
  	<input type="submit" value="회원(emp) 가입">
  	
  </form>
  
  <script>
  	$(function (){
  		let idcheck = false;
  		// [3] 많은 파라미터를 넘겨야하는 경우
  		$("#btnEmpnoCheck").on("click",function(){
  			let params = $("form").serialize();
  			// alert(params);
  			
  			$.ajax({
  				url: "ex01_idcheck.jsp"
  				, type : "GET"
  				, data : params
  				, cache: false  
  				, dataType: "json"
  				, success : function(data, textStatus, jqXHR){ 
  					// alert(data.count);
  					if (data.count == 1) {
						$("#notice").css("color", "red").text("이미 사용 중인 ID 입니다.")
					}else{
						$("#notice").css("color", "black").text("사용 가능한 ID 입니다.");
						idcheck = true;
					}
  				}
  				, error: function(){
  					alert("에러")
  				}
  			});
  		
  		}); 
  		
  		
  		//[2]
  		/*
  		$("#btnEmpnoCheck").on("click",function(){
  			//alert($(":[name='empno']").val());
  			const empno = $("input[name='empno']").val();
  			$.ajax({
  				url: "ex01_idcheck.jsp"
  				, type : "GET"
  				, data : { // 자바스크립트 객체로 넘기기
  						empno : empno
  						}  
  				, cache: false  
  				, dataType: "json"
  				, success : function(data, textStatus, jqXHR){ 
 
  					alert(data.count);
  				}
  				, error: function(){
  					alert("에러")
  				}
  			});
  		}); 
  		*/
  		
  		/* [1]
  		$("#btnEmpnoCheck").on("click",function(){
  			//alert($(":[name='empno']").val());
  			const empno = $("input[name='empno']").val();
  			$.ajax({
  				url: `ex01_idcheck.jsp?empno=\${empno}` // 파라미터로 넘기기
  				, type : "GET"
  				//, data : {empno : 10}  
  				, cache: false  /잊지말고 꼭 false. 같은 요청이어도 꼭 서버갔다오라는 뜻 
  				, dataType: "json"
  				, success : function(data, textStatus, jqXHR){ // jquery data 값은 객체 변환 자동으로 해줌
  					//{"count" : 1} JSON
  					// json -> js Object 변환 (p.count 등 쉽게 사용하기 위해)
  					alert(data.count);
  				}
  				, error: function(){
  					alert("에러")
  				}
  			});
  		}); 
  		*/
  	});
  </script>
  
</div>
</body>
</html>
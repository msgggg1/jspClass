<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 21. 오전 11:27:57</title>
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
  
  <!-- <form action="ex02_ok.jsp" onsubmit="validate();"> -->
 <form action="ex02_el_ok.jsp">
  책 제목 : <input type="text" id="title" name="title" autofocus><br>
  저자 :<input type="text" id="author" name="author"><br>
  나이 :<input type="text" id="age" name="age"><br>
  <button type="button" id="submitBtn">제출</button>
  <!-- <input type="button" value="제출"> --><!-- 후 유효성 검사 -->
 <!-- <input type="submit">  -->
  <input type="reset"> 
  </form>
    
    	  // jsp ${n} 표현언어EL 기호이다. 서버에서 처리해버림
</div>

<script>
	ageRegex = /^(?:\d|[1-9]\d|1[0-2]\d|130)$/,
	title = $( "#title" ),
	author = $( "#author" ),
	age = $( "#age" ),
	allFields = $( [] ).add( title ).add( author ).add( age )
	
	function checkLength( o, n , min, max ) {
      if ( o.val().length > 0 ) {
        return true;
      } else {
    	  alert(`\${n} 필수 입력`);
    	  o.focus();
        return false;
      }
    }
 
    function checkRegexp( o, regexp, n ) {
      if ( !( regexp.test( o.val() ) ) ) {
       	alert( n );
       	o.select();
        return false;
      } else {
        return true;
      }
    }
    
    $("#submitBtn").on("click", function(){
    	var valid = true;
   
        valid = valid && checkLength( title, "책 제목" );
        valid = valid && checkLength( author, "저자" );
        valid = valid && checkLength( age, "나이");
   
        valid = valid && checkRegexp( age,ageRegex, "0~130살 유효" );
       
   
        if ( valid ) {
          $("form").submit();
        }
    })
</script>

<script>
	/*
	function validate(){
		alert("입력값에 대한 유효성 검사한 후 ")
		// 이벤트취소
		event.preventDefault();
		// event.stopPropagation();
	}
	*/
	/*
	let ageRegex = /^(\d|[1-9][\d]|1[0-2][\d]|130)$/;
	let title = $("#title");
	let author = $("#author");
	let age = $("#age");
	
	let valid = true;
		
	function checknull(o){
		if (o.val()) {
			return true;
		} else{
			return false;
		}
	}
	
	function checkRegex(o, regex){
		if (regex.test(o.val())) {
			return true;
		}else{
			return false;
		}
	}
	
	$("button").on("click", function(){
		
		valid = checknull( title  ) && checknull( author  ) && checkRegex( age, ageRegex );
		
		if (!valid) {
			alert("입력값을 확인하세요");
			event.preventDefault();
		} else{
			$("form").submit();
		}
	
	});
	*/
		
</script>
</body>
</html>
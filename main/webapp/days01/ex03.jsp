<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 21. 오후 2:14:47</title>
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
  
  <!-- <p id="demo">1+2+3+4+5+6+7+8+9+10=55</p> -->
  <p id="demo">
  <%
  	// 스크립트릿 : 자바 코딩
  	int sum = 0;
  	for(int i = 1 ; i <= 10; i++){
  		//System.out.printf("%d+", i);
  		out.print(i+"+"); 
  		/* out.println(i+"+"); */ // '\n' 단순히 포함 (개행은 <br>)
  		sum += i;
  	}// for
  	//System.out.printf("=%d\n", sum);
  	out.println("=" + sum);
  %>
  </p>
  
</div>
<script>
/*
	const arr = [];
	for (var i = 1; i <= 10; i++) {
		arr.push(i);
	}// for
	let result = arr.reduce((total, value) => total + value);
	$("#demo").html(arr.join("+") + "=" + result);
	*/
</script>
</body>
</html>
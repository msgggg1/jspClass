<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 21. 오후 3:03:40</title>
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
  	js or juery 사용
  </xmp>
  
  정수 : <input type="text" id="num" autofocus>
  <br>
  <p id="demo">1+2+3=6</p>
  <!-- 숫자만 입력되게, 엔터치면 입력받은 숫자까지의 함 -->
</div>

<script>
	// on(), one(), off()
	$("#num")
		.css("text-align", "center")
		.on({
				"keydown": function(e){
					// 취소O
					if( 	!(
							(e.which >= 48 && e.which <= 57) // 일반 숫자 키값
							||(e.which >= 96 && e.which <= 105) // 숫자 키패드
							|| e.which == 13
							|| e.which == 8
							|| e.which == 229 // 문자 아직 만들어지지 않은 경우
								)
							){
						alert("숫자만 입력하세요");
						e.preventDefault();
					}
				}
				,"keyup": function(e){
					//이벤트 취소 못함
					if (e.which == 13) {
						$("#demo").empty(); // 자식들 초기화
						let n = $(this).val();
						let sum = 0;
						for (var i = 1; i < n; i++) {
							sum += i;
							$("#demo").html(function(index, oldHtml){
								return oldHtml + i + (i==n? "": "+");
							})
						}
						$("#demo").html(function(index, oldHtml){
							return oldHtml + "=" + sum;
						})
						
						$(this).select();
					}
				}
		});
</script>
<script>
	/*
	$("#num").on("keydown", function(e){
		if (e.key === 'Enter') {
			t = $("#num").val() 
			if (isNaN(t) ) {
				alert("숫자만 입력하세요");
				$("#num").val('');
			} else {
				let content = "";
				let sum = 0;
				for (var i = 1; i <= t ; i++) {
					content += `\${i} + `
					sum += i;
				}
				content += `=\${sum}`;
				$("#demo").text(content);
			}
		}
	});
	*/
</script>
</body>
</html>
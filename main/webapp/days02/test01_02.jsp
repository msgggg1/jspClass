<%@page import="java.util.Objects"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	String pN = request.getParameter("n"); 
	String pM = request.getParameter("m"); 
	// if( pNum == null)  pNum = ""; 
	int n = 0, m = 0;
	String content = "";
	
	if(pN != null && !pN.equals("")
			&& pM != null && !pM.equals("")
			){
		n = Integer.parseInt(pN);	
		m = Integer.parseInt(pM);	
		
		int min = Math.min(n,m);
		int max = Math.max(n,m);
		
	int sum = 0;
	for(int i = min; i <= max ; i++){
		content += String.format("%d+", i);
		sum+= i ;
		}
	  content += String.format("=%d", sum);

	}// if
%>
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
  	js or jquery 사용
  </xmp>
  <form action="">
 정수 1(n): <input type="text" id="n" name="n" autofocus >
 정수 2(m): <input type="text" id="m" name="m"  >
  <br>
  <input type="button" value="제출">
  </form>
  <p id="demo"><%=content %></p>
  <!-- 숫자만 입력되게, 엔터치면 입력받은 숫자까지의 함 -->
</div>

<script>
	$("#n, #m")
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
						
						let n = $(this).val();
						if (n) {
							$(this).next().select();
						} else{
							alert("정수 입력하세요!")
						}
					} // if
				}
		});
	
	$(":button").on("click", function(){
		$("form").submit();
	});
	
	$("#n").val(${param.n}).select();
	$("#m").val(${param.m});
</script>
</body>
</html>
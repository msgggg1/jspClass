<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String strn = request.getParameter("num1");
	String strm = request.getParameter("num2");
	
	if(strn == null){strn = "";}
	if(strm == null){strm = "";}
	

		String content = "";
	if((strn != null && strn != "")&&(strm != null && strm != "")){
		int n = Integer.parseInt(strn);
		int m = Integer.parseInt(strm);
		int sum = 0;
		int min = Math.min(m, n);
		int max = Math.max(m, n);
		for(int i = min; i <= max ; i++){
			sum += i;
			content += String.format("%d +", i);
		}
		content += String.format("= %d", sum);
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 22. 오전 8:59:58</title>
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
        문제1) 두 정수를 n, m을 입력하는 <input> 태그를 
            선언하고 실행버튼<button>을 클릭하면 
            서버 두 정수 사이의 합을 출력하는 코딩을 하세요
            ( test01.jsp )
  </xmp>
  <form action="test01.jsp">
  <input type="text" id="num1" name="num1" autofocus value=<%=strn %>><br>
  <input type="text" id="num2" name="num2" value=<%=strm %>><br>
  </form>
  <button id="exec">실행</button>
  <p id="demo"><%=content %></p>
</div>

<script>	
	
	$("#exec").on("click", function(e){
		if (!($("#num1").val() && $("#num2").val())) {
			alert("정수를 두 개 입력하세요");
			e.preventDefault();
		}else{
			$("form").submit();
		}
		
	});
	
	$("input")
		.on({
			"keydown":function(e){
					if (!(
						e.which >= 46 && e.which <= 57
						|| e.which == 13
						|| e.which == 8
						|| e.which == 229
					)
					) {
						alert("정수만 입력하세요");
						e.preventDefault();
					}
			},
			
			"keyup": function(e){
				if(e.which == 13){
					if ($("#num2")==="") {
						$("#num2").focus();
					}
				}
			}
		});
</script>
			
			
			
		
</body>
</html>
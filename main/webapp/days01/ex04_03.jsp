<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String pNum = request.getParameter("num"); 
	int num = 0;
	String content = "";
	if(pNum != null && !pNum.equals("")){
		num = Integer.parseInt(pNum);	
%>
<%
	int sum = 0;
	for(int i = 1; i <= num ; i++){
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
<title>2025. 5. 21. 오후 5:12:46</title>
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
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kEnik HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code"> 
    ex04_02.jsp 를 form 태그로 서브밋 수정.
  </xmp>
<form>
  <%-- 정수 : <input type="text" id="num" name="num" autofocus value="<%=pNum%>"> --%>
 <%--  정수 : <input type="text" id="num" name="num" autofocus value="<%= Objects.toString(pNum, "") %>"> --%>
 정수 : <input type="text" id="num" name="num" autofocus >
  </form>
  <br>
  <p id="demo"><%=content %></p>
</div>

<script>
	$("#num")
		.css("text-align", "center")
		.val('${param.num}')
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
					if (e.which == 13) {
						
						let n = $(this).val();
						if (n) {
							$("form").attr("action", `ex04_02.jsp?num=${n}`);
							$("form").submit();
						} else{
							alert("정수 입력하세요!")
						}
					} // if
				}
		})
		.select();
</script>
</body>
</html>
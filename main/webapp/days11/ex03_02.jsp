<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 23. 오전 10:16:57</title>
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
  
  <select id="deptno" name="deptno"></select>
  
  
</div>

<script>
$(function (){
	
	function loadDepartments(){
		
		let deptno = $(this).val()

		$.ajax({
				url: "ex03_deptjson.jsp"
				, type : "GET"
				, cache: false  
				, dataType: "json"
				, success : function(data, textStatus, jqXHR){ 
					$(data.dept).each(function(index, dept){
						$("#deptno").append(`<option value="\${dept.deptno}">\${dept.dname}</option>`);
					});
				}
				, error: function(){
					alert("에러")
				}
				
		});
		
	}
});
 
		
	
	//EL(표현언어) request.getParameter("deptno")
	$("#deptno").val(${param.deptno}); 
	

</script>
<script>
	$("#deptno").on("change", function(){});
</script>
<script>

	//모두 선택 체크박스
	$("#ckbAll").on("click", function(){
		$("table tbody tr")
			.find("td:first-child :checkbox")
				.prop("checked", $(this).prop("checked"));
	});
	
	$("table tbody tr")
	.find("td:first-child :checkbox").on("click", function(){
		let flag = $("tbody :checkbox").length == $("tbody :checkbox:checked").length ; 
		$("#ckbAll").prop("checked", flag);
	});
	
	//풀이 2
	$("tfoot button").on("click", function(){
		
		let empnoArr = [];
		
		$("tbody :checkbox:checked").each(function (index, element){
			// data-속성명="속성값"
			let empno = $(element).data("empno");
			empnoArr.push(empno);
		});
		
		location.href = `ex01_02.jsp?empno=\${empnoArr.join("&empno=")}`;
		
	});
</script>
</body>
</html>


<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ArrayList<DeptVO> list = (ArrayList<DeptVO>)request.getAttribute("list");
	Iterator<DeptVO> ir = null;
	DeptVO vo = null;
	int deptno;
	String dname, loc;   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 26. 오전 11:18:35</title>
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
   ex05_dept.jsp
  </xmp>
  
  <select id="deptno" name="deptno">
    <option>부서 선택...</option><!-- text값만 설정  -> value값없으면 value값으로 들어감 -->
    <%
        ir = list.iterator();
        while( ir.hasNext() ){
        	vo = ir.next();
        	deptno = vo.getDeptno();
        	dname = vo.getDname();
   %>
   <option value="<%= deptno %>"><%= dname %></option> 
   <%        	
        } // while
    %>
  </select>
</div>
<%
	String contextPath = request.getContextPath();
%>
<script>
	$("#deptno")
		.wrap("<form></form>")
		.on("change", function(){
			$(this)
				.parent()
					.attr({
						method: "get",
						action: `<%=contextPath%>/scott/emp`
					})
					.submit();
		});
		
</script>
</body>
</html>
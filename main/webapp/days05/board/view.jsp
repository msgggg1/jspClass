<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// /jspPro
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 27. 오전 11:45:37</title>
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
   	view.jsp
  </xmp>
  
    <h2>글 내용 보기</h2>
    
    <table>
    	<tbody>
    		<tr>
    			<td>이름</td>
    			<td>${dto.writer }</td>
    			<td>등록일</td>
    			<td>${dto.writedate }</td>
    		</tr>
    		<tr>
    			<td>Email</td>
    			<td>${dto.email }</td>
    			<td>조회수</td>
    			<td>${dto.readed }</td>
    		</tr>
    		<tr>
    			<td>제목</td>
    			<td colspan="3">${dto.title }</td>
    		</tr>
    		<tr>
    			<td>내용</td>
    			<td colspan="3" class="full" style="height: 200px; verticle-align:top">${dto.title }</td>
    		</tr>
    	</tbody>
    	<tfoot>
    		<tr>
    			<td colspan="4" align="center">
    				<a href="<%= contextPath%>/cstvsboard/edit.htm?seq=${dto.seq}">수정하기</a>
    				<a href="<%= contextPath%>/cstvsboard/delete.htm?seq=${dto.seq}">삭제하기</a>
    				<a href="<%= contextPath%>/cstvsboard/list.htm">Home</a>
    				<input type="button" id="btnModalDelete" value="모달창 삭제">
    			</td>
    		</tr>
    	</tfoot>
    </table>

   

</div>

<%
	// 목록보기 -> 내용보기 이동  view.htm?seq=156		null
	// 수정하기 -> 내용보기 이동 : view.htm?seq=156&edit=success/fail
	// String edit = request.getParameter("edit");
	// EL 연산자 : empty, !, not, eq, == 
%>
<script>
<c:if test='${param.edit eq "success"}'>
	alert("수정 성공");	
</c:if>
<c:if test='${param.edit eq "fail"}'>
	alert("수정 실패");	
</c:if>
</script>

</body>
</html>
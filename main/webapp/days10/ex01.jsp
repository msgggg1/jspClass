<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// String contextPath = request.getContextPath();
%>
<%-- <%@ include file="/WEB-INF/inc/include.jspf" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 4. 오전 9:06:20</title>
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
    <c:choose>
    	<c:when test="${empty auth}"><!-- 자동으로 하나씩 뒤져서 가져옴 -->
		    <li><a href="${pageContext.request.contextPath}/days10/member/logon.jsp">로그인</a></li>
    	</c:when>
    	<c:otherwise>
    		<li>[${auth}]<a href="${pageContext.request.contextPath}/days10/member/logout.jsp">로그아웃</a></li>
    	</c:otherwise>
    </c:choose>
    <li><a href="${pageContext.request.contextPath}/days10/member/addmember.jsp">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code"> 
   	- 필터 -
   	days10 폴더
   		ㄴ ex01.jsp
   		ㄴ admin 폴더 생성 (관리자 계정으로 인증)
   			ㄴ 회원관리 페이지(membermanage.jsp)
   			ㄴ 급여관리 페이지(paymanage.jsp)
   		ㄴ board 폴더 생성
   			ㄴ 글목록페이지(list.jsp) - 인증 X
   			ㄴ 글쓰기페이지(write.jsp) - 인증 O (로그인)
   			ㄴ 글삭제페이지(delete.jsp) - 인증 O (로그인) + (작성자 == 인증)
   		ㄴ member 폴더 생성 		  - 인증 X
   			ㄴ 회원가입 페이지 (addmember.jsp)
   			ㄴ 로그인 페이지 (logon.jsp) + logon_ok.jsp
   			ㄴ 로그아웃 페이지 (logout.jsp)
   			
   		 필터		com.filter.loginCheckFilter.java
  </xmp>
  <!-- 인증 X  -->
  <a href="${pageContext.request.contextPath}/days10/board/list.jsp">게시판 글 목록</a><br>
  
  <!-- 인증 O -->
  <a href="${pageContext.request.contextPath}/days10/board/write.jsp">게시판 글 쓰기</a><br>
  
  <!-- 인증O + 관리자 계정 -->
  <a href="${pageContext.request.contextPath}/days10/admin/membermanage.jsp">회원 관리</a><br>
  
</div>

<script>
  let authority = '${ param.authority}';
  if( authority == 'no'){
     alert("권한 없음!!!");
  }
</script>
</body>
</html>
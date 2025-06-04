<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 4. 오전 9:12:37</title>
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
    write.jsp(글 쓰기)
  </xmp>
</div>
</body>
</html>
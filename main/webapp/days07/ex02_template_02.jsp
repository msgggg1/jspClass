<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<%
	// WEB-INF > inc > include.jspf
	String contextPath = request.getContextPath();
%> 
--%>
<%@ include file="/WEB-INF/inc/include.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 29. 오전 10:17:39</title>
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
<%-- <jsp:include page="/layout/top.jsp" flush="false"></jsp:include> --%>
<%@ include file="/layout/top.jsp" %>
<div>
  <xmp class="code"> 
  	일정관리 - 페이지들의 기본 틀
  </xmp>
  
  <table>
  	<tr height="500px">
  		<td>
  			<%-- <jsp:include page="/days07/layout/left.jsp" flush="false"></jsp:include> --%>
  			<%@ include file="/days07/layout/left.jsp" %>
  		</td>
  		<td>
  			일정관리내용부분<br>
  			일정관리내용부분<br>
  			일정관리내용부분<br>
  			일정관리내용부분<br>
  			일정관리내용부분<br>
  		</td>
  		<td>
  			<%-- <jsp:include page="/days07/layout/right.jsp" flush="false"></jsp:include> --%>
  			<%@ include file="/days07/layout/right.jsp" %>
  		</td>
  	</tr>
  </table>
    
</div>

<%-- <jsp:include page="/layout/bottom.jsp" flush="false">
	<jsp:param value="contextPath" name="cp"/>
</jsp:include> --%>
<%@ include file="/layout/bottom.jsp" %>
</body>
</html>
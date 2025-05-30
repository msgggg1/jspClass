<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// ?ckbCookie=bgColor&~~
	String [] deleteCookieNameArr = request.getParameterValues("ckbCookie");
	// 유효시간 : 0 
	for(int i = 0 ; i < deleteCookieNameArr.length ;  i++){
		
		String cookieName = deleteCookieNameArr[i];
		
		Cookie c = new Cookie(cookieName, "");
		c.setPath("/");
		c.setMaxAge(0); // 가자마자 삭제
		response.addCookie(c);
		
	}
	
	//String location = "ex05_03.jsp";
	//response.sendRedirect(location);
	
%>
<script>
	alert("쿠키 삭제 완료");
	location.href = "ex05_03.jsp";
</script>
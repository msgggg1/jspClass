<%@page import="com.util.Cookies"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cookieName = "auth";
	String logonId = null;

	Cookies cookies = new Cookies(request);
	if(cookies.exists(cookieName)){
		/*
		Cookie c = new Cookie(cookieName, "");
		c.setPath("/");
		c.setMaxAge(0); // 가자마자 삭제
		*/
		
		logonId = cookies.getValue(cookieName);
		
		Cookie c =Cookies.createCookie(cookieName, "X", "/", 0);

		response.addCookie(c);
		
	}
	
	
	
	//String location = "ex05_03.jsp";
	//response.sendRedirect(location);
%>
<script>
	alert("<%=logonId%>님 로그아웃 완료");
	location.href = "ex01_default.jsp";
</script>
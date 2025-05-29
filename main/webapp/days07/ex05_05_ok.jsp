<%@page import="java.util.Enumeration"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// ex05_05_ok.jsp?name=김길동&color=blue
	
	Enumeration<String> en = request.getParameterNames();
	while(en.hasMoreElements()){
		String cookieName = en.nextElement();
		String cookieValue = request.getParameter("cookieValue");
		Cookie c = new Cookie(cookieName, URLEncoder.encode( cookieValue, "UTF-8"));
		c. setPath("/");
		response.addCookie(c);
	}
	
	
	String location = "ex05_03.jsp";
	response.sendRedirect(location);
%>
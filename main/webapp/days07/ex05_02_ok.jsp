<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cookieName = request.getParameter("cookieName");
	String cookieValue = request.getParameter("cookieValue");
	
	// 응답되면 쿠키 저장
	// (주의할 점) 한글, 콤마, 세미콜론, 공백 X
	Cookie c = new Cookie(cookieName, URLEncoder.encode( cookieValue, "UTF-8"));
	c.setMaxAge(-1);// 음수 브라우저 종료(닫으면) 쿠키 삭제
	// domain, path 기본값
	c. setPath("/");
	response.addCookie(c);
	
	String location = "ex05_03.jsp";
	response.sendRedirect(location);
%>

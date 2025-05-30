<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.net.URLEncoder"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	// JDBC id/pwd DB처리 (지금은 고정값으로 처리)
	String location = "ex01_default.jsp";
	boolean auth ;
	if(id.equals("admin") && passwd.equals("1234")){
		Cookie cookie = Cookies.createCookie("auth", id, "/", -1);
		response.addCookie(cookie);
	}else if(id.equals("hong") && passwd.equals("1234")){
		Cookie cookie = Cookies.createCookie("auth", id, "/", -1);
		response.addCookie(cookie);
	}else if(id.equals("kim") && passwd.equals("1234")){
		Cookie cookie = Cookies.createCookie("auth", id, "/", -1);
		response.addCookie(cookie);
	}else{
		location = "ex01_default.jsp?logon=fail";
	}
	
	// [1] 리다이렉트
	 response.sendRedirect(location); // 클라이언트로 와서 다시 요청 -> jsp?error
	
%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 인증 X, 권한 X 초기화 작업들은 하고 난 후 
	// 메인 페이지로 이동..
	
	// [1] 리다이렉트
	String location = "ex03.jsp";
	response.sendRedirect(location); // 클라이언트로 와서 다시 요청 -> jsp?error
	
%>
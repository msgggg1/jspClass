<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String location = "/jspPro/days10/ex01.jsp";
	// JDBC id/pwd DB처리 (지금은 고정값으로 처리)
	String referer = (String) session.getAttribute("referer");
	boolean isAuthority = false;  // 권한


	
	boolean auth ;
	if(id.equals("admin") && passwd.equals("1234")){ // 관리자계정
		isAuthority = true; // 권한 있다
		session.setAttribute("auth", id);
	}else if(id.equals("hong") && passwd.equals("1234")){
		session.setAttribute("auth", id);
	}else if(id.equals("kim") && passwd.equals("1234")){
		session.setAttribute("auth", id);
	}else{
		location = "logon.jsp?logon=fail";
	}
	
	if (referer != null) {
		session.removeAttribute("referer"); // 일회용이므로 제거
	    response.sendRedirect(referer); 
	} else {
		response.sendRedirect(location);
	}	
%>
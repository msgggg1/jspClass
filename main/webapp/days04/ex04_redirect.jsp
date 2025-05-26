<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");

	// 리다이렉트
	/* String location = "ex04_finish.jsp?name="+name+"&age="+age; */
	String location = String.format("ex04_finish.jsp?name=%s&age=%s", name, age); // 이전 값 유지 안됨. 파라미터 값 계속 넘겨줘야함. x-> 쿠키나 세션에 저장
	response.sendRedirect(location);
%>
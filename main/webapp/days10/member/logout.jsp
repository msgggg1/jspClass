<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionName = "auth";
	String logonId = null;
	logonId = (String)session.getAttribute(sessionName);

	// 강제로 세션을 종료하는 메서드 : invalidate()
	session.invalidate();
	
%>
<script>
	alert("<%=logonId%>님 로그아웃 완료");
	location.href = "/jspPro/days10/ex01.jsp";
</script>
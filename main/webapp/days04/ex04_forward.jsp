<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 포워딩
	String path = "ex04_finish.jsp";
	RequestDispatcher dispatcher = request.getRequestDispatcher(path);
	dispatcher.forward(request, response); // 포워딩은 파라미터값 넘길 필요 없음. 서버에서 읽어서 바로 응답. 전달 파라미터값 남아잇음. 바로 받아서 사용
%>
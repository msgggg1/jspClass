<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	// JDBC id/pwd DB처리 (지금은 고정값으로 처리)
	String location ;
	String name = "";
	boolean auth ;
	if(id.equals("admin") && passwd.equals("1234")){
		name = "관리자";
		auth = true;
		location = "ex03.jsp?name="+URLEncoder.encode(name)+ "&auth="+auth; // 브라우저 url 상 한글 입력 x -> %시작 16진수 값
		// 인증 정보를 쿠키, 세션, DB에 저장해서
		// 페이지가 이동하더라도 상태 유지되도록 처리
	}else if(id.equals("hong") && passwd.equals("1234")){
		name ="홍길동";
		auth = false;
		location = "ex03.jsp?name="+URLEncoder.encode(name)+ "&auth="+auth;
	}else if(id.equals("kim") && passwd.equals("1234")){
		name="김도훈";
		auth = false;
		location = "ex03.jsp?name="+URLEncoder.encode(name)+ "&auth="+auth;
	}else{
		location = "ex03.jsp?error";
	}
	
	// [1] 리다이렉트
	 response.sendRedirect(location); // 클라이언트로 와서 다시 요청 -> jsp?error
	// [2] 포워딩
	// Dispatcher 발송담당자, 급파하는 사람
	/*
	RequestDispatcher dispatcher = request.getRequestDispatcher(location); // 이 경로로 발송함
	dispatcher.forward(request, response); // ok에 적용한거 밖에 모름
	*/
	// 로그인 성공 시  - 인증정보 저장. 다른 페이지로 변환되어도 인증정보 계속 저장되어야. 
	//				 어디에? DB, 쿠키, 세션
%>
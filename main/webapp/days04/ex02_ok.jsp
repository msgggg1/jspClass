<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	// JDBC id/pwd DB처리 (지금은 고정값으로 처리)
	String location ;
	if(id.equals("admin") && passwd.equals("1234")){
		location = "ex02_main.jsp";
		// 인증 정보를 쿠키, 세션, DB에 저장해서
		// 페이지가 이동하더라도 상태 유지되도록 처리
	}else if(id.equals("hong") && passwd.equals("1234")){
		location = "ex02_main.jsp";
	}else if(id.equals("kim") && passwd.equals("1234")){
		location = "ex02_main.jsp";
	}else{
		location = "ex02.jsp?error";
	}
	
	// [1] 리다이렉트
	// response.sendRedirect(location); // 클라이언트로 와서 다시 요청 -> jsp?error
	// [2] 포워딩
	// Dispatcher 발송담당자, 급파하는 사람
	RequestDispatcher dispatcher = request.getRequestDispatcher(location); // 이 경로로 발송함
	dispatcher.forward(request, response); // ok에 적용한거 밖에 모름
	
	// 로그인 성공 시  - 인증정보 저장. 다른 페이지로 변환되어도 인증정보 계속 저장되어야. 
	//				 어디에? DB, 쿠키, 세션
%>
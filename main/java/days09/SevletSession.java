package days09;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import days07.MemberInfo;


//@WebServlet("/SevletSession")
public class SevletSession extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SevletSession() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서블릿에서 세션을 사용하는 방법 (세션객체 없음)
		// 회원정보 객체 -> 세션에 저장
		MemberInfo mi = new MemberInfo();
		mi.setId("admin");
		mi.setName("관리자");
		mi.setPasswd("1234");
		mi.setEmail("admin@n.com");
		
		HttpSession session = request.getSession();
		session.setAttribute("auth", mi);
		
		
		// 세션 인증 사용자 정보를 얻어와서 사용하는 코딩
		MemberInfo auth_mi = (MemberInfo) session.getAttribute("auth");
		if (auth_mi != null) {
			// 코딩..
			//
			//
		}
		
		// 두가지 getSession
		//request.getSession(); == request.getSession(true); 안주면 true
		// 세션이 존재하면 존재하는 세션 객체를 반환하고
		// 세션이 존재하지 않으면 새로운 세션 객체를 생성해서 반환
		
		// request.getSession(false);
		// 세션이 존재하면 존재하는 세션 객체를 반환하고
		// 세션이 존재하지 않으면 null 반환.
		
		//(주의)
		/*
		HttpSession session= request.getSession(); -> false 넣어줘야 함
		if (session ==null) {} 안 만남 
		*/
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

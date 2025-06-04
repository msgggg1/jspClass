package com.filter;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(		dispatcherTypes = {DispatcherType.REQUEST}
					,
				urlPatterns = { 
						"/days10/admin/*", 
						"/days10/board/write.jsp" 
				})
public class LoginCheckFilter extends HttpFilter implements Filter {
       
    public LoginCheckFilter() {
        super();
    }

	public void destroy() {
		System.out.println(">LoginCheckFilter destroy()");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println(">LoginCheckFilter doFilter()");
		// 인증 + 권한 체크
		// 세션 auth 체크
		HttpServletRequest hrequest =  (HttpServletRequest) request;
		HttpServletResponse hresponse = (HttpServletResponse) response;
		HttpSession session = hrequest.getSession();
		
		String logonId = null;
		boolean isAuth = false;
		
		if (session != null) {
			logonId = (String) session.getAttribute("auth");
			if (logonId != null) isAuth = true;
		}
		
		String referer = hrequest.getRequestURI();
		System.out.println("> 원래 요청한 URL : " + referer);
		
		if (isAuth ) {
			// 인증(로그인)을 받았는지만 체크, 관리자 여부 체크 X
			
		} else {
	        session.setAttribute("referer", referer);
	        
			String location = "/jspPro/days10/member/logon.jsp";
			hresponse.sendRedirect(location);
		}
		
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println(">LoginCheckFilter init()");
	}

}

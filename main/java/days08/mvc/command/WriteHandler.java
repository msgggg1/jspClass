package days08.mvc.command;

import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days05.board.domain.BoardDTO;
import days05.board.persistance.BoardDAO;
import days05.board.persistance.BoardDAOImpl;

public class WriteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String requestMethod = request.getMethod();
		if (requestMethod.equals("GET")) {
			
			// [2] DB처리
			System.out.println("> WriteHandler.process() GET 호출");
		
			// [3]포워딩
			return "/days08/board/write.jsp";
			
		}else if(requestMethod.equals("POST")) {
			request.setCharacterEncoding("UTF-8");
			// [2] DB처리
			System.out.println("> WriteHandler.process() POST 호출");
			
			String writer = request.getParameter("writer");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int tag = Integer.parseInt(request.getParameter("tag"));
			BoardDTO dto = new BoardDTO(0,writer, pwd, email, title, null, 0 , tag, content);
			
			Connection conn = ConnectionProvider.getConnection();
			BoardDAO dao = new BoardDAOImpl(conn);
			
			int rowCount = 0;
			
			try {
				rowCount = dao.insert(dto);
			} catch (Exception e) {
				System.out.println("> WriteHandler.process() POST exception");
				e.printStackTrace();
			} finally {
				conn.close();
			}
			
			// [3]포워딩 -> write.htm : 서블릿 거치지 않고, list.jsp로만 이동 => 등록된 게시물이 없다.  
			// -> 리다이렉트
			String location = "/jspPro/board/list.do?write="; // 클라이언트에서 리다이렉트 -> contextPath 부터 경로 줘야. 서버: 서버안임 -> contextPath 필요 x
			location+= rowCount == 1 ? "success" : "fail";
			response.sendRedirect(location);
		}
		
		return null;
		
	}

}

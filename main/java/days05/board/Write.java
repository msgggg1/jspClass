package days05.board;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days05.board.domain.BoardDTO;
import days05.board.persistance.BoardDAO;
import days05.board.persistance.BoardDAOImpl;

/*@WebServlet({"/cstvsboard/write.htm" })*/
public class Write extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Write() {
        super();
        // TODO Auto-generated constructor stub
    }


    // 목록 - 글쓰기 버튼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// [2] DB처리
		System.out.println("> Write.doGet() 호출");
	
		// [3]포워딩

		String path = "/days05/board/write.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	// 글쓰기 - 작성완료 버튼
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// [2] DB처리
		System.out.println("> Write.doPost() 호출");
		
		String writer = request.getParameter("writer");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int tag = Integer.parseInt(request.getParameter("tag"));
		BoardDTO dto = new BoardDTO(0,writer, pwd, email, title, null, 0 , tag, content);
		
		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		
		int rowCount = 0;
		
		try {
			rowCount = dao.insert(dto);
		} catch (Exception e) {
			System.out.println("> Write.doPost() exception");
			e.printStackTrace();
		} finally {
			DBConn.close();
		}
		
		// [3]포워딩 -> write.htm : 서블릿 거치지 않고, list.jsp로만 이동 => 등록된 게시물이 없다.  
		// -> 리다이렉트
		//String path = "/days05/board/list.jsp";
		//String path = "/days05/cstvsboard/list.htm";
		String location = "/jspPro/cstvsboard/list.htm?write="; // 클라이언트에서 리다이렉트 -> contextPath 부터 경로 줘야. 서버: 서버안임 -> contextPatg 필요 x
		location+= rowCount == 1 ? "success" : "fail";
		response.sendRedirect(location);
	}

}

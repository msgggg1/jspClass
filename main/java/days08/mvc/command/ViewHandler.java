package days08.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days05.board.domain.BoardDTO;
import days05.board.persistance.BoardDAO;
import days05.board.persistance.BoardDAOImpl;

public class ViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// [2] DB처리
		System.out.println("> ViewHandler.process()...");	
		
		// 제목 클릭하면 view.htm?seq=150 -> View.java 서블릿 doGet() 호출
		//referer == 참조자 (기억)
		String referer = request.getHeader("referer");
		System.out.println("> referer :" + referer);
		
		long pseq = Long.parseLong(request.getParameter("seq")); // null ""
		
		Connection conn = ConnectionProvider.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		
		BoardDTO dto = null;
		int rowCount = 0;
		
		// 트랜잭션 처리

		try {
			//[ 1+2 트랜잭션 처리 작업 ]
			conn.setAutoCommit(false);
			// 1) 조회수 증가
			dao.increaseReaded(pseq);
			// 2) 해당 글 번호의 dto 객체를 얻어오는 작업
			dto = dao.view(pseq);
			
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			System.out.println("> ViewHandler.process() exception");
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			conn.close();
		}
		
		// [3]포워딩
		request.setAttribute("dto", dto);
		
		return "/days08/board/view.jsp";
	}

}

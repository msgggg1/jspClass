package days05.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

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

/*@WebServlet({ "/cstvsboard/view.htm" })*/
public class View extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public View() {
        super();
        // TODO Auto-generated constructor stub
    }

    // view.htm?seq=3
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// [2] DB처리
		System.out.println("> View.doGet()...");	
		
		// 제목 클릭하면 view.htm?seq=150 -> View.java 서블릿 doGet() 호출
		//referer == 참조자 (기억)
		String referer = request.getHeader("referer");
		System.out.println("> referer :" + referer);
		
		long pseq = Long.parseLong(request.getParameter("seq")); // null ""
		
		Connection conn = DBConn.getConnection();
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
			System.out.println("> view.doGet() exception");
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBConn.close();
		}
		
		// [3]포워딩
		request.setAttribute("dto", dto);
		
		String path = "/days05/board/view.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

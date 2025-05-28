package days05.board;

import java.io.IOException;
import java.io.PrintWriter;
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

/*@WebServlet({ "/cstvsboard/delete.htm" })*/
public class Delete extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public Delete() {
		super();
		// TODO Auto-generated constructor stub
	}

	// delete.htm?seq=3
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("> Delete.doGet()...");

		// [3]포워딩
		String path = "/days05/board/delete.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		long pseq =Long.parseLong(request.getParameter("seq"));
		String ppwd =request.getParameter("pwd");
		String currentPage = request.getParameter("currentPage");
		
		// [2] DB처리
		System.out.println("> Delete.doPost()...");

		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		
		int rowCount = 0;
		String originalPwd ;
		String location = "/jspPro/cstvsboard/";
		
		try {
			originalPwd = dao.getOriginalPwd(pseq);
			if (originalPwd.equals(ppwd)) {
				rowCount = dao.delete(pseq,ppwd);
				location += "list.htm?delete=success&currentPage="+currentPage;
			} else {
				//location += "delete.htm?seq="+pseq +"&delete=fail";
				//historyback()
				// 모달창
				location += "view.htm?seq="+pseq+"&delete=fail";
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}catch (Exception e) {
			System.out.println("> Delete.doPost() exception");
			e.printStackTrace();

		} finally {
			DBConn.close();
		}

		// [3] 리다이렉트
		
		 response.sendRedirect(location);
		 

		// [2] 수정 성공 view.htm?seq=156 + 경고창
		// 수정 실패 수정경로 이동
		// [2] 수정 성공 view.htm?seq=156 + 경고창
		// 수정 실패 수정 경로 이동.
		/*
		PrintWriter out = response.getWriter();

		String location = "/jspPro/cstvsboard/list.htm";
		if (rowCount == 1) {
			out.println("<script>");
			out.println("alert('글이 성공적으로 삭제되었습니다.');");
			out.println("location.href='" + location + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('글 삭제에 실패했습니다. 다시 시도해주세요.');");
			out.println("history.back();");
			out.println("</script>");
		}
		*/
	}
	/*// 내 풀이
	 * protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * request.setCharacterEncoding("UTF-8");
	 * response.setContentType("text/html; charset=UTF-8"); // [2] DB처리
	 * System.out.println("> Delete.doPost()...");
	 * 
	 * Connection conn = DBConn.getConnection(); BoardDAO dao = new
	 * BoardDAOImpl(conn); long seq =Long.parseLong(request.getParameter("seq"));
	 * String pwd = null; try { pwd = dao.getPwd(seq); } catch (SQLException e1) {
	 * e1.printStackTrace(); }
	 * 
	 * int rowCount = 0;
	 * 
	 * try { rowCount = dao.delete(seq, pwd); } catch (Exception e) {
	 * System.out.println("> Edit.doPost() exception"); e.printStackTrace();
	 * 
	 * } finally { DBConn.close(); }
	 * 
	 * // [3] 리다이렉트
	 * 
	 * String location = "/jspPro/cstvsboard/view.htm?seq="+pseq+"&edit="; location
	 * += rowCount == 1 ? "success" : "fail"; response.sendRedirect(location);
	 * 
	 * 
	 * // [2] 수정 성공 view.htm?seq=156 + 경고창 // 수정 실패 수정경로 이동 // [2] 수정 성공
	 * view.htm?seq=156 + 경고창 // 수정 실패 수정 경로 이동. PrintWriter out =
	 * response.getWriter();
	 * 
	 * String location = "/jspPro/cstvsboard/list.htm"; if (rowCount == 1) {
	 * out.println("<script>"); out.println("alert('글이 성공적으로 삭제되었습니다.');");
	 * out.println("location.href='"+ location+"'"); out.println("</script>"); }
	 * else { out.println("<script>");
	 * out.println("alert('글 삭제에 실패했습니다. 다시 시도해주세요.');");
	 * out.println("history.back();"); out.println("</script>"); } }
	 */

}

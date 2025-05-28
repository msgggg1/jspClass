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

/*@WebServlet({ "/cstvsboard/edit.htm" })*/
public class Edit extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public Edit() {
		super();
		// TODO Auto-generated constructor stub
	}

	// edit.htm?seq=3
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// [2] DB처리
		System.out.println("> Edit.doGet()...");	

		// 제목 클릭하면 view.htm?seq=150 -> View.java 서블릿 doGet() 호출
		//referer == 참조자 (기억)
		String referer = request.getHeader("referer");
		System.out.println("> referer :" + referer);

		long pseq = Long.parseLong(request.getParameter("seq")); // null ""

		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		
		BoardDTO dto = null;
		

		// 트랜잭션 처리

		try {
			dto = dao.view(pseq);

		} catch (Exception e) {
			System.out.println("> Edit.doPost() exception");
			e.printStackTrace();
		} finally {
			DBConn.close();
		}

		// [3]포워딩
		request.setAttribute("dto", dto);

		String path = "/days05/board/edit.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		// [2] DB처리
		System.out.println("> Edit.doPost()...");	

		long pseq = Long.parseLong(request.getParameter("seq")); // null ""
		
		String pwd = request.getParameter("pwd");
		String title = request.getParameter("title");
		String email = request.getParameter("email");
		String content = request.getParameter("content");
		int tag = Integer.parseInt(request.getParameter("tag"));
		
		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);

		int rowCount = 0;
		BoardDTO dto = BoardDTO.builder()
							.seq(pseq)
							.pwd(pwd)
							.email(email)
							.title(title)
							.content(content)
							.tag(tag)
							.build();

		// 트랜잭션 처리

		try {
			// 2) 해당 글 번호의 dto 객체를 얻어오는 작업
			rowCount = dao.update(dto);
		} catch (Exception e) {
			System.out.println("> Edit.doGet() exception");
			e.printStackTrace();
			
		} finally {
			DBConn.close();
		}

		// [3] 리다이렉트
		/*
		String location = "/jspPro/cstvsboard/view.htm?seq="+pseq+"&edit=";
		location += rowCount == 1 ? "success" : "fail"; 
		response.sendRedirect(location);
		*/
		
		// [2] 수정 성공 view.htm?seq=156 + 경고창
		// 	   수정 실패 수정경로 이동
		// [2] 수정 성공   view.htm?seq=156 + 경고창
	      //     수정 실패   수정 경로 이동.
	      PrintWriter out = response.getWriter();
	      
	      String location = "/jspPro/cstvsboard/view.htm?seq="+pseq;
	        if (rowCount == 1) {
	            out.println("<script>");
	            out.println("alert('글이 성공적으로 작성되었습니다.');");
	            out.println("location.href='"+ location+"'");
	            out.println("</script>");
	        } else {
	            out.println("<script>");
	            out.println("alert('글 작성에 실패했습니다. 다시 시도해주세요.');");
	            out.println("history.back();");
	            out.println("</script>");
	        }
	}


}

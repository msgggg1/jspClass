package days08.mvc.command;

import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days05.board.domain.BoardDTO;
import days05.board.persistance.BoardDAO;
import days05.board.persistance.BoardDAOImpl;

public class EditHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String requestMethod = request.getMethod();
		if (requestMethod.equals("GET")) {
			
			// [2] DB처리
			System.out.println("> EditHandler.process Get()...");	

			String referer = request.getHeader("referer");
			System.out.println("> referer :" + referer);

			long pseq = Long.parseLong(request.getParameter("seq")); 

			Connection conn = ConnectionProvider.getConnection();
			BoardDAO dao = new BoardDAOImpl(conn);
			
			BoardDTO dto = null;


			try {
				dto = dao.view(pseq);

			} catch (Exception e) {
				System.out.println("> EditHandler.process Get() exception");
				e.printStackTrace();
			} finally {
				conn.close();
			}

			// [3]포워딩
			request.setAttribute("dto", dto);

			return "/days08/board/edit.jsp";
			
		}else if(requestMethod.equals("POST")) {
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			// [2] DB처리
			System.out.println("> EditHandler.process Post()...");	

			long pseq = Long.parseLong(request.getParameter("seq")); 
			
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

			try {
				rowCount = dao.update(dto);
			} catch (Exception e) {
				System.out.println("> EditHandler.process Post() exception");
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
		      
		      String location = "/jspPro/board/view.do?seq="+pseq;
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
		
		return null;
	}

}

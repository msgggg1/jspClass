package days08.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days08.mvc.persistence.BoardDAO;
import days08.mvc.persistence.BoardDAOImpl;

public class DeleteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String requestMethod = request.getMethod();
		if (requestMethod.equals("GET")) {
			
			// [2] DB처리
			System.out.println("> DeleteHandler.process() GET 호출");
			// [3]포워딩
			return "/days08/board/delete.jsp";
			
		}else if(requestMethod.equals("POST")) {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			long pseq =Long.parseLong(request.getParameter("seq"));
			String ppwd =request.getParameter("pwd");
			String currentPage = request.getParameter("currentPage");
			
			// [2] DB처리
			System.out.println("> DeleteHandler.process() Process...");

			Connection conn = ConnectionProvider.getConnection();
			BoardDAO dao = new BoardDAOImpl(conn);
			
			int rowCount = 0;
			String originalPwd ;
			String location = "/jspPro/board/";
			
			try {
				originalPwd = dao.getOriginalPwd(pseq);
				if (originalPwd.equals(ppwd)) {
					rowCount = dao.delete(pseq,ppwd);
					location += "list.do?delete=success&currentPage="+currentPage;
				} else {
					//location += "delete.htm?seq="+pseq +"&delete=fail";
					//historyback()
					// 모달창
					location += "view.do?seq="+pseq+"&delete=fail";
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}catch (Exception e) {
				System.out.println("> DeleteHandler.process() exception");
				e.printStackTrace();

			} finally {
				conn.close();
			}

			// [3] 리다이렉트
			
			 response.sendRedirect(location);
			 
		}
		
		return null;
	}

}

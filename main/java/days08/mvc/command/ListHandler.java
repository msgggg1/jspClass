package days08.mvc.command;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days08.mvc.domain.BoardDTO;
import days08.mvc.domain.PagingVO;
import days08.mvc.persistence.BoardDAO;
import days08.mvc.persistence.BoardDAOImpl;

public class ListHandler implements CommandHandler{

	//[1]
	int currentPage = 1; 	// 현재 페이지 번호
	int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
	int numberOfPageBlock = 10; // [1] 2 3 4 5 6 7 8 9 10 >
	int totalRecords = 0; 	// 총 레코드 수
	int totalPages = 0; 	// 총 페이지 수

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// [2] DB처리
		System.out.println("> ListHandler.process()...");
		try {
			this.currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (Exception e) {
			// null
			this.currentPage = 1;
		}
		try {
			this.numberPerPage = Integer.parseInt(request.getParameter("numberPerPage"));
		} catch (Exception e) {
			// null
			this.numberPerPage = 10;
		}

		// 검색
		// 검색 관련 파라미터 넘어옴
		// list.htm?searchCondition=검색조건&searchWord=검색어&...
		String searchCondition = null;
		try {
			searchCondition = request.getParameter("searchCondition");
		} catch (Exception e) {
			// null
			searchCondition = "t";

		}		
		String searchWord = request.getParameter("searchWord"); /// null ""

		//Connection conn = DBConn.getConnection();
		Connection conn = ConnectionProvider.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);

		java.util.List<BoardDTO> list = null;
		PagingVO pvo = null;

		try {
			if (searchWord == null || searchWord.equals("")) { // 목록 출력
				pvo= new PagingVO(currentPage, numberPerPage, this.numberOfPageBlock);
				list = dao.select(currentPage, numberPerPage);
			} else { // 검색한 목록
				pvo = new PagingVO(currentPage, numberPerPage, numberOfPageBlock, searchCondition, searchWord.trim());
				list = dao.search(searchCondition, searchWord.trim(), currentPage, numberPerPage);
			}
		} catch (Exception e) {
			System.out.println("> ListHandler.process() exception");
		} finally {
			//DBConn.close();
			conn.close(); // 커넥션 풀에 반환
		}

		// [3]포워딩
		request.setAttribute("list", list);
		request.setAttribute("pvo", pvo);

		return "/days08/board/list.jsp"; // [ View ]

	}// doGet

} // class

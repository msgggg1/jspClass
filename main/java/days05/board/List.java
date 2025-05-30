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
import days05.board.domain.PagingVO;
import days05.board.persistance.BoardDAO;
import days05.board.persistance.BoardDAOImpl;

/*@WebServlet({"/cstvsboard/list.htm" })*/
public class List extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public List() {
        super();
        // TODO Auto-generated constructor stub
    }

    //[1]
    int currentPage = 1; 	// 현재 페이지 번호
    int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
    int numberOfPageBlock = 10; // [1] 2 3 4 5 6 7 8 9 10 >
    int totalRecords = 0; 	// 총 레코드 수
    int totalPages = 0; 	// 총 페이지 수
    
    
    // list.htm 				null => 1
    // list.htm?currentPage=3	
    // list.htm?numberPerPage=15
    // 검색
    // list.htm?searchCondition=c&searchWord=%EC%83%88%EA%B8%80
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// [2] DB처리
		System.out.println("> List.doGet()...");
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
		
		Connection conn = DBConn.getConnection();
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
			System.out.println("> List.doGet() exception");
		} finally {
			DBConn.close();
		}
		
		// [3]포워딩
		request.setAttribute("list", list);
		request.setAttribute("pvo", pvo);
		
		String path = "/days05/board/list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

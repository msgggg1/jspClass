package days04;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.doit.domain.DeptVO;

import com.util.DBConn;

@WebServlet("/scott/dept")
public class ScottDept extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public ScottDept() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("scottDept.doGet() 호출됨");

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql =  " SELECT * " 
				+ " FROM dept";
		ResultSet rs = null;   
		int deptno;
		String dname, loc;   
		DeptVO vo = null;
		ArrayList<DeptVO> list = null;
		Iterator<DeptVO> ir = null;

		try{
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if( rs.next() ){
				list = new ArrayList<>();
				do{

					deptno = rs.getInt("deptno");
					dname = rs.getString("dname");
					loc = rs.getString("loc");

					vo = new DeptVO().builder()
							.deptno(deptno).dname(dname).loc(loc)
							.build(); 

					/*    vo = new DeptVO(); */

					/* vo.set(); */
					list.add(vo);
				}while( rs.next() );
			} // if
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				pstmt.close();  
				DBConn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		} // try 
		
		// 포워딩 al 저장해서 넘김
		request.setAttribute("list", list); // "속성 이름"
		

		//String path = "/days04/ex05_dept.jsp";
		String path = "/days04/ex05_dept_jstl.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

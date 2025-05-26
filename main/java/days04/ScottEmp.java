package days04;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.doit.domain.EmpVO;

import com.util.DBConn;


@WebServlet("/scott/emp")
public class ScottEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public ScottEmp() {
		super();
		// TODO Auto-generated constructor stub
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("scottemp 호출");

		String pDeptno = request.getParameter("deptno");
		int deptno ;

		try{
			deptno = Integer.parseInt(pDeptno);
		} catch(Exception e){
			deptno = 10; // 안넘어오면 10번으로 처리
		}
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql =  " SELECT empno, ename, job, mgr,  "
				+ " TO_CHAR(hiredate, 'yyyy-MM-dd') hiredate, sal, comm, deptno "
				+ " FROM emp "
				+ "  WHERE deptno = ? ";
		ResultSet rs = null;   

		int empno, mgr;
		String ename, job;
		Date hiredate;
		double sal, comm ;

		EmpVO vo = null;
		ArrayList<EmpVO> list = null;
		Iterator<EmpVO> ir = null;

		try{
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();
			if( rs.next() ){
				list = new ArrayList<>();
				do{

					empno = rs.getInt("empno");
					ename = rs.getString("ename");
					job = rs.getString("job");				
					mgr = rs.getInt("mgr");
					hiredate =  rs.getDate("hiredate");
					sal = rs.getDouble("sal");
					comm = rs.getDouble("comm");
					deptno = rs.getInt("deptno");

					vo = new EmpVO().builder()
							.empno(empno).ename(ename).job(job).mgr(mgr).hiredate(hiredate).sal(sal).comm(comm).deptno(deptno)
							.build(); 

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

		
		// 포워딩
		request.setAttribute("list", list);
		//request.setAttribute("deptno", deptno);

		//String path = "/days04/ex05_emp.jsp";
		String path = "/days04/ex05_emp_jstl.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

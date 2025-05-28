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

import org.doit.domain.DeptVO;
import org.doit.domain.EmpVO;

import com.util.DBConn;

/*@WebServlet("/days04/empsearch.htm")*/
public class EmpSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmpSearch() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("empsearch 호출됨");

		// 1. 부서 정보
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql =  " SELECT * " 
				+ " FROM dept";
		ResultSet rs = null;   
		int deptno;
		String dname, loc;   

		DeptVO dvo = null;
		ArrayList<DeptVO> dlist = null;
		Iterator<DeptVO> dir = null;

		try{
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if( rs.next() ){
				dlist = new ArrayList<>();
				do{
					deptno = rs.getInt("deptno");
					dname = rs.getString("dname");
					loc = rs.getString("loc");

					dvo = new DeptVO().builder()
							.deptno(deptno).dname(dname).loc(loc)
							.build(); 

					dlist.add(dvo);

				}while( rs.next() );
			} // if
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				pstmt.close();  
				rs.close();
				//DBConn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		} // try 
		// 2. 잡 정보
		sql =  " SELECT DISTINCT job " 
				+ " FROM emp"
				+ " order by job ASC ";
		String job;   

		ArrayList<String> jlist = null;

		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if( rs.next() ){
				jlist = new ArrayList<>();
				do{
					job = rs.getString("job");

					jlist.add(job);
				}while( rs.next() );
			} // if
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				pstmt.close();  
				rs.close();
				//DBConn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		} // try 

		// 3. 사원 정보
		// ?deptno=10&deptno=30&job=X&job=y
		String pDeptno=null, pJob=null;

		String [] pDeptnoArr = request.getParameterValues("deptno");
		String [] pJobArr = request.getParameterValues("job");

		if(pDeptnoArr != null) pDeptno = String.join(",", pDeptnoArr);
		if(pJobArr != null) {
			pJob = String.join("', '", pJobArr);
			pJob = String.format("'%s'", pJob); // '' , ''
		}

		sql = "Select empno, ename, job, mgr, to_char(hiredate, 'yyyy-MM-dd') hiredate, sal,comm, deptno"
				+ " From emp ";
		// where deptno in (10, 30) AND job IN('x','y','z');
		// where job IN('x','y','z');
		// where deptno in (10, 30);

		if (pDeptno != null ) {
			sql += " WHERE deptno IN ("+ pDeptno+ ")";
		}
		if (pJob != null ) {
			sql += String.format(" %s job IN ( %s )", pDeptno == null ? "WHERE" : "AND" ,  pJob);
		}
		sql += " order by deptno ASC";
		System.out.println("[3] sql :"+ sql);

		// 실행
		int empno;
		String ename;
		int mgr;
		Date hiredate;
		double sal, comm;

		EmpVO evo = null;
		ArrayList<EmpVO> elist = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				elist = new ArrayList<EmpVO>();
				do {
					empno = rs.getInt("empno");
					ename = rs.getString("ename");
					job = rs.getString("job");
					mgr = rs.getInt("mgr");
					hiredate = rs.getDate("hiredate");
					sal = rs.getDouble("sal");
					comm = rs.getDouble("comm");
					deptno = rs.getInt("deptno");
					evo = new EmpVO(empno, ename, job, mgr, hiredate
							, sal, comm, deptno);
					elist.add(evo);
				} while (rs.next());
			}//if
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{
				pstmt.close();  
				rs.close();
				DBConn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}

		// 포워딩
		request.setAttribute("dlist", dlist); // 부서 정보 저장
		request.setAttribute("jlist", jlist); // 잡 정보 저장
		request.setAttribute("elist", elist); // 잡 정보 저장

		//String path = "ex06_emp_search_jstl.jsp";
		String path = "/days04/ex06_emp_search_jstl.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

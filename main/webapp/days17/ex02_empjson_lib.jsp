<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="netscape.javascript.JSObject"%>
<%@page import="com.util.JdbcUtil"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.Date"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page trimDirectiveWhitespaces="true"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
int deptno;

String pDeptno = request.getParameter("deptno");
int pdeptno = 10;
try {
	pdeptno = deptno = Integer.parseInt(pDeptno);
} catch (Exception e) {
	pdeptno = deptno = 10; // 안넘어오면 10번으로 처리
}

String sql = " SELECT empno, ename, job, mgr,  " + " TO_CHAR(hiredate, 'yyyy-MM-dd') hiredate, sal, comm, deptno "
		+ " FROM emp " + "  WHERE deptno = ? ";

int empno, mgr;
String ename, job;
Date hiredate;
double sal, comm;

EmpVO evo = null;
ArrayList<EmpVO> elist = null;
Iterator<EmpVO> eir = null;

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

// {}
JSONObject resultJSON = new JSONObject();

JSONArray jsonEmpArr = new JSONArray();

try {
	conn = ConnectionProvider.getConnection();
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, deptno);
	rs = pstmt.executeQuery();

	if (rs.next()) {
		elist = new ArrayList<>();
		do {
	empno = rs.getInt("empno");
	ename = rs.getString("ename");
	job = rs.getString("job");
	mgr = rs.getInt("mgr");
	hiredate = rs.getDate("hiredate");
	sal = rs.getDouble("sal");
	comm = rs.getDouble("comm");
	deptno = rs.getInt("deptno");

	evo = new EmpVO().builder().empno(empno).ename(ename).job(job).mgr(mgr).hiredate(hiredate).sal(sal)
			.comm(comm).deptno(deptno).build();

	elist.add(evo);

	JSONObject jsonEmp = new JSONObject();
	jsonEmp.put("empno", empno);
	jsonEmp.put("ename", ename);
	jsonEmp.put("mgr", mgr);
	jsonEmp.put("job", job);

	jsonEmpArr.add(jsonEmp);
		} while (rs.next());

	} // if

	// {"emp":[]}
	resultJSON.put("emp", jsonEmpArr);

} catch (Exception e) {
	e.printStackTrace();
} finally {
	try {
		pstmt.close();
		rs.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
} // try
%>
<%=resultJSON%>
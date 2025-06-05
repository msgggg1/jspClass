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
<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	
	int deptno;

	String pDeptno = request.getParameter("deptno");
	int pdeptno = 10;
	try{
		pdeptno = deptno = Integer.parseInt(pDeptno);
	} catch(Exception e){
		pdeptno = deptno = 10; // 안넘어오면 10번으로 처리
	}
	
   String sql =  " SELECT empno, ename, job, mgr,  "
		   	+ " TO_CHAR(hiredate, 'yyyy-MM-dd') hiredate, sal, comm, deptno "
		    + " FROM emp "
		    + "  WHERE deptno = ? ";
   
   	int empno, mgr;
	String ename, job;
	Date hiredate;
	double sal, comm ;
	   
   Iterator<EmpVO> eir = null;
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null; 
   
   String resultJSON = "{";
   resultJSON += "\"emp\":[";
   
   try{
	   conn = ConnectionProvider.getConnection();
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setInt(1, deptno);
	   rs = pstmt.executeQuery();
	   
	   if( rs.next() ){
		   do{
				empno = rs.getInt("empno");
				ename = rs.getString("ename");
				job = rs.getString("job");				
				mgr = rs.getInt("mgr");
				hiredate =  rs.getDate("hiredate");
				sal = rs.getDouble("sal");
				comm = rs.getDouble("comm");
			   	deptno = rs.getInt("deptno");
			   
			   resultJSON += String.format("{\"empno\": %d, \"ename\": \"%s\" , \"sal\": %.2f, \"job\": \"%s\"},", empno, ename, sal, job);
		   }while( rs.next() );
		    resultJSON = resultJSON.substring(0, resultJSON.length()-1);
	   } // if
	   
		resultJSON += "]";
		resultJSON += "}";
   }catch(Exception e){
	   e.printStackTrace();
   }finally{
	   try{
		 pstmt.close();  
		 rs.close();
	     conn.close();
	   }catch(Exception e){
		   e.printStackTrace();
	   }
   } // try 
%>
<%=resultJSON %>
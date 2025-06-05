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
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String sql =  " SELECT * " 
		       + " FROM dept";

   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;  
   
   int deptno;
   String dname;   
   
   String resultJSON = "{";
	resultJSON += "\"dept\":[";
   
   try{
	   conn = ConnectionProvider.getConnection();
	   pstmt = conn.prepareStatement(sql);
	   rs = pstmt.executeQuery();
	   while( rs.next() ){
			   deptno = rs.getInt("deptno");
			   dname = rs.getString("dname");
			   
			   resultJSON += String.format("{\"deptno\": %d, \"dname\": \"%s\" },", deptno, dname);
	   } // while
	    resultJSON = resultJSON.substring(0, resultJSON.length()-1);
	    resultJSON += "]";
		resultJSON += "}";
   }catch(Exception e){
	   e.printStackTrace();
   }finally{
	   try{
		   JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
			JdbcUtil.close(conn);
	   }catch(Exception e){
		   e.printStackTrace();
	   }
   } // try 
%>
<%=resultJSON %>
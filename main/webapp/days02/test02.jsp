<%@page import="com.util.DBConn"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "select *"
			+ " from emp "
			+  " WHERE deptno = ?";
	ResultSet rs = null;
	int deptno, empno, mgr, sal, comm ;
	String ename, job, dname, loc;
	LocalDateTime hiredate;
	EmpVO vo = null;
	ArrayList<EmpVO> list = null;
	Iterator<EmpVO> ir = null;
	try{
	conn = DBConn.getConnection();
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if(rs.next())
		list = new ArrayList<>();
		do{
			deptno = rs.getInt("deptno");
			empno = rs.getInt("empno");
			mgr = rs.getInt("mgr");
			sal = rs.getInt("sal");
			comm = rs.getInt("comm");
			
			ename = rs.getString("ename");
			job = rs.getString("job");
			loc = rs.getString("loc");
			
			hiredate =  rs.getTimestamp("hiredate").toLocalDateTime();
			
			vo = new EmpVO(empno, mgr, deptno, ename, job, loc ,sal, comm, hiredate);
			list.add(vo);
		} while(rs.next());
	}catch(Exception e){
		   e.printStackTrace();
	   }finally{
		   try{
			 pstmt.close();  
		     DBConn.close();
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 22. 오전 9:45:53</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }   
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">msg HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code"> 
    문제2) days02.test02.jsp 페이지에
          <select> 태그에 부서정보를 option 태그로
          추가하고
          하나의 부서를 선택하면 선택된 부서로
          사원의 정보를 출력하는 test02_02 .jsp 페이지에 
          출력하는 코딩을 하세요 . 
  </xmp>
  
  <select id="deptno">
  	<option>부서 번호 선택</option>
  	<%
	  	ir = list.iterator();
	    while( ir.hasNext() ){
    	vo = ir.next();
    	deptno = vo.getDeptno();
  	%>
  	<option value="<%= deptno %>"></option> 
  </select>
</div>
</body>
</html>
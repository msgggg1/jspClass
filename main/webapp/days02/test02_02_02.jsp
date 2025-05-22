<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.Date"%>
<%@page import="com.util.DBConn"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//test02_02_02.js?deptno= 29
	//test02_02_02.js?deptno= 		""
	//test02_02_02.js?				null
	
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
	   //System.out.println("> conn = " + conn);
	   //System.out.println("> isClosed = " + conn.isClosed() );
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
						.empno(empno).ename(ename).job(job).mgr(mgr).hiredate(hiredate).sal(sal).comm(comm)
						.build(); 
				
				
			/* 	vo = new EmpVO();
				
				vo.setComm(comm);
				vo.setDeptno(deptno);
				vo.setEmpno(empno);
				vo.setEname(ename);
				vo.setHiredate(hiredate);
				vo.setJob(job);
				vo.setMgr(mgr);
				vo.setSal(sal); */
				
				
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 21. 오후 5:13:52</title>
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
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kEnik HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code"> 
     Oracle + dept -> select 채워넣기.
     JSP DB 연동
  </xmp>
  
  <h2>emp list - <%=deptno %></h2>
  <table>
  	<thead>
  	  <tr>
  		<th>empno</th>
  		<th>ename</th>
  		<th>job</th>
  		<th>mgr</th>
  		<th>hiredate</th>
  		<th>sal</th>
  		<th>comm</th>
  		<th>deptno</th>
  	 </tr>
  	</thead>
  	<tbody>
  		<!-- list == null  사원존재 x -->
  		<%
  			if(list == null){
  		%>
  		
  		<tr>
  			<td colspan="8">사원이 존재 X</td>
  		</tr>
  		
  		<%
  			}else{
  				ir = list.iterator();
  				while(ir.hasNext()){
  					vo = ir.next();
  		%>	
  		<tr>
  		  <td><%= vo.getEmpno() %></td>
  		  <td><%= vo.getEname() %></td>
  		  <td><%= vo.getJob() %></td>
  		  <td><%= vo.getMgr() %></td>
  		  <td><%= vo.getHiredate() %></td>
  		  <td><%= vo.getSal() %></td>
  		  <td><%= vo.getComm() %></td>
  		  <td><%= vo.getDeptno() %></td>
  		</tr>
  		
  		<%
  				} //while
  			}// if
  		%>
  	</tbody>
	<tfoot>
		<tr>
			<td colspan="8">
				<span class="badge left red"><%= list==null ? 0 : list.size()%>명</span>
				<a href="javascript:history.back()">뒤로가기기</a>
			</td>
		</tr>
	</tfoot>
  </table>
  
  
</div>
</body>
</html>









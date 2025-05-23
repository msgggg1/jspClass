<%@page import="org.doit.domain.DeptEmpVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = " SELECT * "
				+ " FROM dept d JOIN emp e ON d.deptno = e.deptno ";
/* 				+ " WHERE dname = ? "; */
	ResultSet rs = null;
	
	int empno;
	String ename, job, dname;
	int mgr;
	Date hiredate;
	double sal, comm;
	int deptno ;
	
	DeptEmpVO vo = null;
	ArrayList<DeptEmpVO> list = null;
	Iterator<DeptEmpVO> ir = null;
	
	 try{
		   conn = DBConn.getConnection();
		   pstmt = conn.prepareStatement(sql);
 		   pstmt.setString(1, dname); 
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
				   	dname = rs.getString("dname");
				   
				   	vo = new DeptEmpVO().builder()
							.empno(empno).ename(ename).job(job).mgr(mgr)
							.hiredate(hiredate).sal(sal).comm(comm).dname(dname).deptno(deptno)
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
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 23. 오전 9:02:52</title>
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
   
  </xmp>
  
  <select id="deptno" name="deptno">
  	<%
	  	ir = list.iterator();
	    while( ir.hasNext() ){
    		vo = ir.next();
    		dname = vo.getDname();
  	%>
  	<option value="<%= dname %>"><%= dname %></option>
  	<%        	
        } // while
    %>
  </select>
  <table>
  <thead>
  	  <tr>
  	  	<th><input type="checkbox">전체선택</th>
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
  					if(vo.getDname().equals(pdname)){
  		%>
  		<tr>
  		  <td><input type="checkbox"></td>
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
  					}
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
<script>
	let pdname;
	$("select").on("change",function(){
		pdname = $(this).val();
	});
</script>
</body>
</html>
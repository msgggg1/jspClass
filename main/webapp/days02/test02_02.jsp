<%@page import="com.util.DBConn"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
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
  
  <select id="deptno" name="deptno">
    <option>부서 선택...</option><!-- text값만 설정  -> value값없으면 value값으로 들어감 -->
    <%
        ir = list.iterator();
        while( ir.hasNext() ){
        	vo = ir.next();
        	deptno = vo.getDeptno();
        	dname = vo.getDname();
   %>
   <option value="<%= deptno %>"><%= dname %></option> 
   <%        	
        } // while
    %>
  </select>
  
</div>

<script>
	$("#deptno").on("change", function(){
		let deptno = $(this).val();
		
		//if (deptno  != "부서 선택...") {
		if (!isNaN(deptno)) {
		location.href = `test02_02_02.jsp?deptno=\${deptno}`;			
		}
	});
</script>
</body>
</html>









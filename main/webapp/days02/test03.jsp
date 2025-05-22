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
			        
			        /* vo = new DeptVO(); */
			        
			       /*  vo.setDeptno(deptno);
			        vo.setDname(dname);
			        vo.setLoc(loc);
			        */
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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>

<script>
  $( function() {
    $( "fieldset :checkbox" ).checkboxradio();
  } );
  </script>
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
  
   <h2>부서를 선택하세요</h2>
  <fieldset>
    <legend>dept check: </legend>
   <!--  
    <label for="checkbox-1">2 Star</label>
    <input type="checkbox" name="checkbox-1" id="checkbox-1">
    <label for="checkbox-2">3 Star</label>
    <input type="checkbox" name="checkbox-2" id="checkbox-2">
    <label for="checkbox-3">4 Star</label>
    <input type="checkbox" name="checkbox-3" id="checkbox-3">
    <label for="checkbox-4">5 Star</label>
    <input type="checkbox" name="checkbox-4" id="checkbox-4">
    -->
   <%
        ir = list.iterator();
        while( ir.hasNext() ){
        	vo = ir.next();
        	deptno = vo.getDeptno();
        	dname = vo.getDname();
   %>
  <!--   <label for="checkbox-1">2 Star</label>
    <input type="checkbox" name="checkbox-1" id="checkbox-1"> -->
    <label for="deptno-<%= deptno %>"><%= dname %></label>
    <input type="checkbox" name="deptno" id="deptno-<%= deptno %>" value="<%= deptno %>"> 
    
   <%        	
        } // while
    %>
  </fieldset>
  <input type="button" value="사원 확인">
  
</div>

<script>


$(":button[value='사원 확인']").on("click", function(){
	
	/* let deptno = $(this).val(); */
	const cbox = $(":checkbox[name=deptno]:checked")
	if (cbox.length == 0) {
		alert("부서를 체크하세요.")
		return;
	}
	
	const deptnoArr = [];
	cbox.each(function(index,element){
			let deptno = $(element).val();
			deptnoArr.push(`deptno=\${deptno}`);
		});
	
	location.href = `test03_02.jsp?\${deptnoArr.join('&')}`;			

});
</script>
</body>
</html>









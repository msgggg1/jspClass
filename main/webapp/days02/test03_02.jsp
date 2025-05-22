<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.Date"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   // test02_02.jsp?deptno=20
   // test02_02.jsp?deptno=      ""
   // test02_02.jsp?             null

   //test03_02.jsp?deptno=10&deptno=30&deptno=40
         

   String [] deptnoArr = request.getParameterValues("deptno");
   
   int deptno;
    

   Connection conn = null;
   PreparedStatement pstmt = null;
   String sql =  " SELECT empno, ename, job, mgr, "
             + " TO_CHAR( hiredate, 'yyyy-MM-dd' ) hiredate, sal, comm, deptno "
             + " FROM emp "
             + " WHERE  ";
   
   for(int i = 0 ; i < deptnoArr.length ; i++){
      sql += " deptno = ? OR "; 
   } // for
   
   sql = sql.substring(0, sql.lastIndexOf("OR")); 
   sql +=" ORDER BY deptno ASC";      
       
   //System.out.println("> " + sql);    
  
   ResultSet rs = null; 
   
   int empno, mgr;
   String ename, job;
   Date hiredate;
   double sal, comm; 
   
   EmpVO vo = null;
   ArrayList<EmpVO> list = null;
   Iterator<EmpVO> ir = null;
   
   try{
      conn = DBConn.getConnection();
      //System.out.println("> conn = " + conn);
      //System.out.println("> isClosed = " + conn.isClosed() );
      pstmt = conn.prepareStatement(sql);
      for(int i = 0 ; i < deptnoArr.length ; i++){
          pstmt.setInt(i+1,  Integer.parseInt( deptnoArr[i] ) );         
      } // for
      rs = pstmt.executeQuery();
      if( rs.next() ){
         list = new ArrayList<>();
         do{
            
            empno = rs.getInt("empno");
            ename = rs.getString("ename");
            job = rs.getString("job");
            mgr = rs.getInt("mgr");
            hiredate = rs.getDate("hiredate");
            sal = rs.getDouble("sal");
            comm = rs.getDouble("comm");
            deptno = rs.getInt("deptno");
            
            vo = new EmpVO().builder()
                  .empno(empno).ename(ename).job(job).mgr(mgr)
                  .hiredate(hiredate).sal(sal).comm(comm).deptno(deptno)
                 .build();
            
            list.add(vo);
            
         }while( rs.next() );
         
        // System.out.println( ">>>> " + list.size() );
         
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
  </xmp>
 
  <h2>emp list</h2>
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
      <!-- list == null 사원존재 X -->
      <%
         if( list == null){
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
            }  // while
         } // if
      %>
    </tbody>
    <tfoot>
      <tr>
        <td colspan="8">
          <span class="badge left red"><%= list==null?0:list.size() %>명</span>
          <a href="javascript:history.back()">뒤로 가기</a>
        </td>
      </tr>
    </tfoot>
  </table>
   
</div>
</body>
</html>









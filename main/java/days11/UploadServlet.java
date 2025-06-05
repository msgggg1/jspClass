package days11;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

// p702 코딩 그대로~
//@WebServlet("/days11/upload")
public class UploadServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
     
    public UploadServlet() {
        super(); 
    }
 
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
   }

   // 첨부파일 처리 post
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      out.print("<html>");
      out.print("<body>");
      
      // 첨부파일 1개      request.getPart(String name)      
      Collection<Part> parts =  request.getParts();
      String contentType = request.getContentType();
      // multipart/form-data; boundary=----WebKitFormBoundary70HwoYveJK9k6a3W
      // out.print(contentType);
      if (contentType != null 
            && contentType.toLowerCase().startsWith("multipart/")) {         
         printPartInfo(request, out);
      } else {
         out.print("> multipart 아니다. ");
      } // 
      
      out.print("</body>"); 
      out.print("</html>");
   } // doPost

   private void printPartInfo(HttpServletRequest request, PrintWriter out)
         throws IOException, ServletException {
      
      // this.getServletContext().getRealPath(path);
      
      Collection<Part> parts = request.getParts();
      for (Part part : parts) {
         
         out.print("<br>");
         out.print("> name : " + part.getName());  // a.txt
         String contentType = request.getContentType();
         out.print("<br> > contentType : " + contentType);
         if( part.getHeader("Content-Disposition").contains("filename=") ) { // 첨부파일 파라미터.
            
            out.print("<br> > size : "+ part.getSize());
            String fileName = part.getSubmittedFileName(); // 업로드된 파일 이름
            out.print("<br> > fileName : " + fileName);  
            if (part.getSize() > 0 ) {
               part.write("C:\\temp\\" + fileName); //업로드파일 저장.
               part.delete(); // 임시 파일 삭제   
            } // if
         }else { // 일반 파라미터
            String paramValue= request.getParameter( part.getName() );
            out.println("<br> > paramValue : " + paramValue );
         } // if
         out.print("<hr>");
      } // foreach
   } // printPartInfo

}












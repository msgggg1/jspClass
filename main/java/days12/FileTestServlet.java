package days12;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

@WebServlet("*.ss")
public class FileTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FileTestServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI(); // list.ss, write.ss, update.ss 등등

        Connection conn = null;
        String saveDirectory = null;

        // MVC 패턴
        // commandHandler.properties   list.ss => ListHandler.java X
        // init()      commandHalderMap <url, Handler> 
        try {
           conn = ConnectionProvider.getConnection();
           FileTestDAO dao = FileTestDAO.getInstance(); // 싱글톤
           // ㄴ
           saveDirectory = request.getRealPath("/days12/upload");
           System.out.println(saveDirectory);

           if( uri.endsWith("list.ss") ) { // 자료실 목록 보기   
        	   ArrayList<FileTestDTO>  list =  dao.selectFileList(conn);
               request.setAttribute("list", list);
               String path = "/days12/ex01_list.jsp";
               RequestDispatcher dispatcher = request.getRequestDispatcher(path);
               dispatcher.forward(request, response); 
           }else if( uri.endsWith("write.ss") ) {   // 글쓰기 + write.jsp 
        	   String path = "/days12/ex01_write.jsp";
               RequestDispatcher dispatcher = request.getRequestDispatcher(path);
               dispatcher.forward(request, response); 
           }else if( uri.endsWith("write_ok.ss") ) { // 글쓰기 저장
        	// 1.upload 폴더 없으면 생성.
               File f = new File(saveDirectory);
               if( ! f.exists() ) f.mkdirs();
                
               // ㄷ.
               int maxPostSize = 5 * 1024 * 1024 ; // 5MB byte(기본단위)
               // ㄹ. 
               String encoding = "UTF-8";
               // ㅁ.  a1.txt
               FileRenamePolicy policy = new DefaultFileRenamePolicy();

               // cos.jar 파일  MultipartRequest 클래스 ...
               MultipartRequest multiRequest = new MultipartRequest(
                     request
                     , saveDirectory
                     , maxPostSize
                     , encoding
                     , policy
                     );
               // 벌써 첨부파일은 upload 폴더에 저장 완료!!!
               
               // DB 테이블  제목/첨부파일명/파일크기 등등 insert
               FileTestDTO dto = new FileTestDTO();
               
               String subject = multiRequest.getParameter("subject");            
               dto.setSubject(subject);
               
               // <input type="file" name="attachFile" />
               File attachFile = multiRequest.getFile("attachFile");
               if( attachFile != null) {  // 첨부파일이 있는 경우
                  String fileName  = attachFile.getName();
                  long filelength = attachFile.length();
                  String originalFileName = multiRequest.getOriginalFileName("attachFile");
                   String filesystemName = multiRequest.getFilesystemName("attachFile");
                   
                   dto.setFilelength(filelength);
                   dto.setOriginalfilename(originalFileName);
                   dto.setFilesystemname(filesystemName);
               }else { // 첨부파일이 없는 경우
                  // 
               } // if
               
               int rowCount = dao.insert(conn, dto);                
               response.sendRedirect("list.ss");
           }else if( uri.endsWith("delete.ss") ) { // 삭제 
        	  // delete.ss?num=${ dto.num }&filesystemname=${ dto.filesystemname}
               int num = Integer.parseInt(request.getParameter("num") );
               String filesystemname = request.getParameter("filesystemname");  // ""            
               int rowCount = dao.delete(conn, num);      
               
               
               String pathname = String.format("%s\\%s", saveDirectory, filesystemname);
               File deleteFile = new File(pathname);   
               if ( deleteFile.exists() ) {
                  deleteFile.delete();
               } 
               
               response.sendRedirect("list.ss");
               
           }else if( uri.endsWith("update.ss") ) { // 수정 + update.jsp   
        	// update.ss?num=${ dto.num }&filesystemname=${ dto.filesystemname}
               int num = Integer.parseInt(request.getParameter("num"));
               FileTestDTO dto = dao.selectOne(conn, num);
               request.setAttribute("dto", dto); 
               String path = "/days12/ex01_update.jsp";
               RequestDispatcher dispatcher = request.getRequestDispatcher(path);
               dispatcher.forward(request, response);
               
           }else if( uri.endsWith("update_ok.ss") ) { // 수정 저장.
        	// [만약]
               // 첨부 파일 X -> a.txt   ofn a.txt  sfn a.txt
               // 첨부 파일 O -> 수정 X
               //             수정 O    원래첨부파일 삭제   ofn,sfn 설정             
               // ㄷ.
               int maxPostSize = 5 * 1024 * 1024 ; // 5MB byte(기본단위)
               // ㄹ. 
               String encoding = "UTF-8";
               // ㅁ.  a1.txt
               FileRenamePolicy policy = new DefaultFileRenamePolicy();

               // cos.jar 파일  MultipartRequest 클래스 ...
               MultipartRequest multiRequest = new MultipartRequest(
                     request
                     , saveDirectory
                     , maxPostSize
                     , encoding
                     , policy
                     );
               // 벌써 첨부파일은 upload 폴더에 저장 완료!!!
               // <input type="hidden" name="num" value="${dto.num}">
               int num = Integer.parseInt(multiRequest.getParameter("num") );
               // <a href="update.ss?num=${ dto.num }&filesystemname=${ dto.filesystemname}"
               String delete_filesystemname =
                      multiRequest.getParameter("filesystemname");
               // 
               FileTestDTO dto = new FileTestDTO();
               dto.setNum(num);
               String subject = multiRequest.getParameter("subject");
               dto.setSubject(subject);
               // <input type="file" name="attachFile" />
               File attachFile = multiRequest.getFile("attachFile");
               if( attachFile != null) {  // 첨부파일이 있는 경우
                  String fileName  = attachFile.getName();
                  long filelength = attachFile.length();
                  String originalFileName = multiRequest.getOriginalFileName("attachFile");
                   String filesystemName = multiRequest.getFilesystemName("attachFile");
                   
                   dto.setFilelength(filelength);
                   dto.setOriginalfilename(originalFileName);
                   dto.setFilesystemname(filesystemName);
                   
                   // 수정 전에 있던 첨부파일 삭제...
                   String deleteFilePath = 
                         String.format("%s\\%s"
                               ,saveDirectory , delete_filesystemname);
                   File deleteFile = new File(deleteFilePath);
                   if( deleteFile.exists() ) deleteFile.delete();
                   
               }else if(!delete_filesystemname.equals("")) {
                  // 새로 수정하기 위한 첨부파일은 없지만 이전 첨부파일 존재하는 경우
                  FileTestDTO dto2 =  dao.selectOne(conn, num);
                   dto.setFilelength(dto2.getFilelength());
                   dto.setOriginalfilename(dto2.getOriginalfilename());
                   dto.setFilesystemname(dto2.getFilesystemname());
                  // 
               } // if
               
               int rowCount = dao.update(conn, dto);                
               response.sendRedirect("list.ss");
           } // if          
        } catch (Exception e) {
           e.printStackTrace();
        } finally {
           JdbcUtil.close(conn); 
        } // try
     }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		doGet(request, response);
	}

}

package days02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
@WebServlet(
		description = "두 번째 서블릿", 
		urlPatterns = { 
				"/Hello", 
				"/days02/hello.jsp",
				"*.jsp"
//	장단점 수정 컴파일 다시배포 // webxml 그냥 고치면된다. 
		})
		*/
public class Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Hello() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  //request.setCharacterEncoding("utf-8");
	      response.setContentType("text/html; charset=utf-8");   
	      PrintWriter out = response.getWriter();
	      
	      out.println("<html>");
	      out.println("<head><title>인사</title></head>");
	      out.println("<body>");
	      out.println("안녕하세요.");
	      out.println(request.getParameter("name"));   
	      out.println("님");
	      out.println("</body>");
	      out.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

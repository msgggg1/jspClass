package days15.replyboard.controllor;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days15.replyboard.command.CommandHandler;
import days15.replyboard.command.NullHandler;

//web.xml에 직접 설정
public class DispatcherServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	
    public DispatcherServlet() {
        super();    
    }

    
	@Override
	public void destroy() {
		super.destroy();
	}

	public Map<String, CommandHandler> commandHandlerMap = new HashMap<>();

	@Override
	public void init() throws ServletException { // 생성자역할
		super.init();
		String mappingPath = this.getInitParameter("mappingPath");
		String realPath = this.getServletContext().getRealPath(mappingPath); 
		
		Properties prop = new Properties(); 
		
		try(FileReader reader = new FileReader(realPath)){
			prop.load(reader);
		}catch(Exception e){
			throw new ServletException();
		}
		
		Set<Entry<Object, Object>> set = prop.entrySet();
		Iterator<Entry<Object, Object>> ir = set.iterator();
		while(ir.hasNext()) {
			Entry<Object, Object> entry = ir.next();
			String url = (String)entry.getKey(); 
			String fullName = (String)entry.getValue(); 
			
			Class<?> commandHandlerClass = null;
	         try {
	            commandHandlerClass = Class.forName(fullName);
	            try {
	               CommandHandler handler = (CommandHandler) commandHandlerClass.newInstance();
	               this.commandHandlerMap.put(url, handler); 
	            } catch (InstantiationException e) { 
	               e.printStackTrace();
	            } catch (IllegalAccessException e) { 
	               e.printStackTrace();
	            }
	         } catch (ClassNotFoundException e) { 
	            e.printStackTrace();
	         }
		}
		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { // get방식 요청
		String requestURI = request.getRequestURI();
		
		int beginIndex = request.getContextPath().length();
		//  	/board/list.do
		requestURI = requestURI.substring(beginIndex);
		
		// 3단계. 로직처리하는 모델객체를 commandHandlerMap으로 부터 얻어옴
		CommandHandler handler = this.commandHandlerMap.get(requestURI);
		
		if (handler == null) {
			handler = new NullHandler();
		}
		
		String view = null;
		try {
			view = handler.process(request, response);
			// 4. request, session 객체에 결과 저장
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 5단계 - 뷰 출력(포워딩, 리다이렉트)
		if (view != null) {
			// 포워딩
			// 리다이렉트는 핸들러에서
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		} // if
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { // post방식 서블릿 요청
	
		doGet(request, response); // 다 doGET이 처리하겠다.
	}

}

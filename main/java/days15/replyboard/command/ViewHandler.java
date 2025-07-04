package days15.replyboard.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days15.replyboard.domain.ReplyBoardDTO;
import days15.replyboard.service.ViewService;

public class ViewHandler implements CommandHandler{

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
      // view.do?num=2&cp/sc/sw
      int num = Integer.parseInt( request.getParameter("num") );

      ViewService contentService = ViewService.getInstance();
      ReplyBoardDTO dto = contentService.selectOne(num);

      request.setAttribute("dto", dto);

      return "/WEB-INF/views/days15/replyboard/view.jsp";

   } // process

} // class
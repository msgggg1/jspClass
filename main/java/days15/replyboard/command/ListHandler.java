package days15.replyboard.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days15.replyboard.domain.ReplyBoardDTO;
import days15.replyboard.service.ListService;

public class ListHandler implements CommandHandler{

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
      System.out.println("> ListHandler.process ...");

      ListService listService = ListService.getInstance();
      List<ReplyBoardDTO> list = listService.select();
      
      // 1. 포워딩 전에 데이터 저장
      request.setAttribute("list", list);
      request.setAttribute("pageBlock", "[1] 2 3 4 5 6 7 8 9 10 >");
      
      return "/WEB-INF/views/days15/replyboard/list.jsp";
   }

    

}
package days15.replyboard.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import days15.replyboard.domain.ReplyBoardDTO;
import days15.replyboard.persistence.ReplyBoardDAO;

public class ListService {

   // 1. 싱글톤
   private ListService() {}      
   private static ListService instance = null;  
   public static ListService getInstance() {   
      if(   instance == null  ) {
         instance = new ListService();
      }
      return instance;
   }

   public List<ReplyBoardDTO> select(){
      //
      Connection con = null;
      try {
         con = ConnectionProvider.getConnection();
         ReplyBoardDAO dao = ReplyBoardDAO.getInstance();
         List<ReplyBoardDTO> list = null;
         list = dao.selectList(con);
         return list;
      } catch (NamingException | SQLException e) { 
         //e.printStackTrace();  syso("ListService.select() 에러 : ")
         throw new RuntimeException(e);
      } finally {
         JdbcUtil.close(con);
      }
   }
}
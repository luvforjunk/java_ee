package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import guestbook.dao.GuestbookDAO;

public class BoardRegisterService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String id = request.getParameter("id");		
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email1", email1);
		map.put("email2", email2);
		map.put("subject", subject);
		map.put("content", content);

		//DB
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
		guestbookDAO.boardRegister(map);

		//응답
		return "/board/boardRegister.jsp";
	}

}

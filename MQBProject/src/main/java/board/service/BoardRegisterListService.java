package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class BoardRegisterListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg"));

		request.setAttribute("pg", pg);
		request.setAttribute("display", "/board/boardRegisterList.jsp");
		return "/index.jsp";
	}
}

package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class WriteFormService implements CommandProcess {

	// 회원가입 버튼 클릭 시
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setAttribute("display", "/member/writeForm.jsp");
		// display라는 객체명으로 "/member/writeForm.jsp"을 넣어준 뒤
		return "/index.jsp";
		// index.jsp로 다시 돌아가라
	}
}
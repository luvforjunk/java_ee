package member.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.login(id, pwd);
		// 자바는 리턴 값이 2개 이상이면 안된다.
		// 배열 / MemberDTO / Map 세 가지 방법 중 하나를 써서 가져와야 한다.
		
		//응답
		if(memberDTO == null) {
			return "/member/loginFail.jsp";
		}else {
			//쿠키
			/*
			 * Cookie cookie = new Cookie("memName", name); //쿠키 생성 
			 * cookie.setMaxAge(30*60); // 초 단위 
			 * //cookie.setPath("/"); - 만약 URL을 /member/로 지정하면 member폴더로 쿠키를 전송하라는 의미 
			 * response.addCookie(cookie); //클라이언트로 보내기
			 * 
			 * Cookie cookie2 = new Cookie("memId", id); //쿠키 생성 
			 * cookie2.setMaxAge(30*60); //초 단위 
			 * //cookie2.setPath("/"); response.addCookie(cookie2); //클라이언트로 보내기
			 */			
			//세션 - Tomcat에다 저장. 경로 지정 필요없음
			HttpSession session = request.getSession(); // 세션 생성
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memId", id);
			session.setAttribute("memEmail", memberDTO.getEmail1() +"@"+memberDTO.getEmail2());
			
			session.setAttribute("memDTO", memberDTO);
			
			//request.setAttribute("name", name);
			return "/member/loginOk.jsp";
		}
	}
}
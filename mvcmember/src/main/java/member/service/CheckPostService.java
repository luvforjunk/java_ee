package member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;

public class CheckPostService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String sido = request.getParameter("sido");
		String sigungu = request.getParameter("sigungu");
		String roadname = request.getParameter("roadname");

		System.out.println(sido + ", " + sigungu + ", " + roadname);

		// DB
		List<ZipcodeDTO> list = null;
		if (sido != null && roadname != null) { // 시도와 도로명이 null이 아니면
			// 세종시의 경우 구가 없어서 시군구는 null값 확인하는 것에서 뺴줌
			MemberDAO memberDAO = MemberDAO.getInstance();
			 list = memberDAO.getZipcodeList(sido, sigungu, roadname);
			// memberDTO는 zipcode를 담을 데이터가 없다.
			// 고로 새로운 DTO를 생성해줘야 한다

		}

		// 응답
		request.setAttribute("list", list); 

		return "/member/checkPost.jsp";
	}

}

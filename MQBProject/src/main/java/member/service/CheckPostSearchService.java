package member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class CheckPostSearchService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String sido = request.getParameter("sido");
		String sigungu = request.getParameter("sigungu");
		String roadname = request.getParameter("roadname");

		System.out.println(sido + "," + sigungu + "," + roadname);

		//DB
		List<ZipcodeDTO> list = null;
		if (sido != null && roadname != null) {
			MemberDAO memberDAO = MemberDAO.getInstance();
			list = memberDAO.getZipcodeList(sido, sigungu, roadname);
			System.out.println("list=" + list); // 클래스명@16진수 이런 식으로 나오지 않고 [~~~, ~~~, ~~~] 이런식으로 보인다.
		}

		// list -> json으로 변환 (jar파일 넣어주기)
		JSONObject json = new JSONObject(); // json 객체
		if (list != null) {
			JSONArray array = new JSONArray(); // json Array

			for (ZipcodeDTO zipcodeDTO : list) {

				JSONObject temp = new JSONObject(); // json 객체

				temp.put("zipcode", zipcodeDTO.getZipcode());
				temp.put("sido", zipcodeDTO.getSido());
				temp.put("sigungu", zipcodeDTO.getSigungu());
				temp.put("yubmyundong", zipcodeDTO.getYubmyundong());
				temp.put("ri", zipcodeDTO.getRi());
				temp.put("roadname", zipcodeDTO.getRoadname());
				temp.put("buildingname", zipcodeDTO.getBuildingname());

				// 배열에 담아주자
				array.add(temp);
			} //for

			// json 객체에 붙이자
			json.put("list", array);
		}

		System.out.println("json=" + json);

		request.setAttribute("list", json);
		return "/member/checkPostSearch.jsp";
	}

}

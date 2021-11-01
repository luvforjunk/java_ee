package board.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import guestbook.bean.GuestbookDTO;
import guestbook.dao.GuestbookDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class GetBoardRegisterListSerivce implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

		// 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));

		// DB
		// 1페이지당 5개씩
		int endNum = pg * 3;
		int startNum = endNum - 2;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
		List<GuestbookDTO> list = guestbookDAO.getBoardRegisterList(map);

		// List -> JSON 변환
		JSONObject json = new JSONObject();
		if (list != null) {
			JSONArray array = new JSONArray();

			for (GuestbookDTO guestbookDTO : list) {
				JSONObject gbd = new JSONObject();
				gbd.put("seq", guestbookDTO.getSeq());
				gbd.put("id", guestbookDTO.getId());
				gbd.put("email1", guestbookDTO.getEmail1());
				gbd.put("email2", guestbookDTO.getEmail2());
				gbd.put("subject", guestbookDTO.getSubject());
				gbd.put("content", guestbookDTO.getContent());

				array.add(gbd);

			} // for

			json.put("list", array);

		} // if

		request.setAttribute("list", json);
		return "/board/getBoardRegisterList.jsp";
	}

}

package imageboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.dao.ImageboardDAO;

public class ImageboardDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		// 데이터 - 받아야 하는 데이터가 하나가 아님.
		String [] check = request.getParameterValues("check"); 
		// getParameterValues - 받아야 하는 데이터가 여러개일 때 쓴다.
		// 선택된 값들만 넘어온다.
		
		// DB
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		imageboardDAO.imageboardDelete(check); // check를 들고 imageboardDelete를 만들어주러 DAO로;
		
		//응답
		request.setAttribute("display", "/imageboard/imageboardDelete.jsp");
		return "/index.jsp";
	}

}

package imageboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import imageboard.bean.ImageboardDTO;
import imageboard.dao.ImageboardDAO;

public class ImageboardWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 실제폴더
		// 데이터를 업로드 시켰을 때 가상폴더로 가지 못하기 때문에 실제폴더를 가져와야 한다
		String realFolder = request.getServletContext().getRealPath("/storage");
		System.out.println(realFolder);
		
		// 업로드 - 내가 선택한 파일 업로드
		MultipartRequest multi = new MultipartRequest(request
													, realFolder
													, 5*1024*1024 // 5MB, 최대용량
													, "UTF-8"
													, new DefaultFileRenamePolicy()); // 파일명 변경
		
		// 데이터
		// request 대신에 multi를 써준다 - 모든 권한이 multi에게 있기 때문
		String imageId = multi.getParameter("imageId");
		String imageName = multi.getParameter("imageName");
		int imagePrice = Integer.parseInt(multi.getParameter("imagePrice"));
		int imageQty = Integer.parseInt(multi.getParameter("imageQty"));
		String imageContent = multi.getParameter("imageContent");
		
		// 제어 - DB안에 보관해뒀다가 갖다 꺼내써주기 위해
		String image1 = multi.getOriginalFileName("image1"); // original 이름을 쓰고 싶을 때
		//String image1 = multi.getFilesystemName("image1"); // 변경된 이름을 쓰고 싶을 때
		
		ImageboardDTO imageboardDTO = new ImageboardDTO();
		imageboardDTO.setImageId(imageId);
		imageboardDTO.setImageName(imageName);
		imageboardDTO.setImagePrice(imagePrice);
		imageboardDTO.setImageQty(imageQty);
		imageboardDTO.setImageContent(imageContent);
		imageboardDTO.setImage1(image1);
		
		//DB
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		imageboardDAO.imageboardWrite(imageboardDTO);
		
		//응답
		request.setAttribute("display", "/imageboard/imageboardWrite.jsp");
		return "/index.jsp";
	}
}



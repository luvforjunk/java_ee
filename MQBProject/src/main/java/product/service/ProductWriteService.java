package product.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import imageboard.dao.ImageboardDAO;
import product.bean.ProductDTO;
import product.dao.ProductDAO;

public class ProductWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		// 실제 폴더
		String realFolder = request.getServletContext().getRealPath("/storage");
		System.out.println(realFolder);

		// 업로드 - 내가 선택한 파일 업로드
		MultipartRequest multi = new MultipartRequest(request
				, realFolder
				, 5 * 1024 * 1024 // 5MB, 최대용량
				, "UTF-8"
				, new DefaultFileRenamePolicy());

		// 데이터
		String name = multi.getParameter("name");
		int unit = Integer.parseInt(multi.getParameter("unit"));
		int qty = Integer.parseInt(multi.getParameter("qty"));
		int rate = Integer.parseInt(multi.getParameter("rate"));

		String img = multi.getOriginalFileName("img");

		ProductDTO productDTO = new ProductDTO();
		productDTO.setName(name);
		productDTO.setUnit(unit);
		productDTO.setQty(qty);
		productDTO.setRate(rate);
		productDTO.setImg(img);

		// DB
		ProductDAO productDAO = ProductDAO.getInstance();
		productDAO.productWrite(productDTO);

		// 응답
		request.setAttribute("display", "/product/productWrite.jsp");
		return "/index.jsp";
	}

}

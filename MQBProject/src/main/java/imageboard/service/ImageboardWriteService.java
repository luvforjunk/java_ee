package imageboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;

public class ImageboardWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 실제폴더
		// 데이터를 업로드 시켰을 때 가상폴더로 가지 못하기 때문에 실제폴더를 가져와야 한다
		String realFolder = request.getServletContext().getRealPath("/storage");
		System.out.println(realFolder);
		
		//업로드 - 내가 선택한 파일 업로드
		MultipartRequest multi = new MultipartRequest(request
													, realFolder
													, 5*1024*1024 // 5MB, 최대용량
													, "UTF-8");
		return null;
	}
}


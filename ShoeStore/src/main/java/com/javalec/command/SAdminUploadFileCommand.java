package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class SAdminUploadFileCommand implements SCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// Application 정보
		String path = request.getServletContext().getRealPath("/file");
		System.out.println(path);
		// 파일의 최대 크기 지정 , 1KB * 1KB * [option] = [option]MB
		int maxSize = 1024 * 1024 * 1;
		request.setAttribute("imagePath", path);
		try {
			String inputName = request.getParameter("image");
			// 생성자를 호출 시 파일 업로드를 수행, (request객체, 파일경로, 파일의 최대 용량
			MultipartRequest multi = new MultipartRequest(request, path, maxSize, "UTF-8");
			
			String uploadedFileName = multi.getFilesystemName(inputName);
			String originalFileName = multi.getOriginalFileName(inputName);
			
			System.out.println(uploadedFileName);
			System.out.println(originalFileName);
			System.out.println("업로드");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}

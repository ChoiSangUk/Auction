package com.kpsl.auction.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kpsl.auction.ad.vo.AdImageVo;

@Component
public class UtilFile {
	String fileName = "";

	// 프로젝트 내 지정된 경로에 파일을 저장하는 메소드
	// DB에는 업로드된 전체 경로명으로만 지정되기 때문에(업로드한 파일 자체는 경로에 저장됨)
	// fileUpload() 메소드에서 전체 경로를 리턴받아 DB에 경로 그대로 저장
	public HashMap<String, String> fileUpload(MultipartHttpServletRequest request, MultipartFile uploadFile) {
		String path = "";
		String fileName = "";
		OutputStream out = null;
		PrintWriter printWriter = null;
		HashMap<String, String> adImage = new HashMap<String, String>();

		try {
			fileName = uploadFile.getOriginalFilename();
			byte[] bytes = uploadFile.getBytes();
			// 배포할때에
			//path = getSaveLocation(request);
			// 로컬에서 테스트할때에
			path = "D:/git/Auction/ROOT/src/main/webapp/resources/files/";

			File file = new File(path);

			// 파일명이 중복으로 존재할 경우
			if (fileName != null && !fileName.equals("")) {
				if (file.exists()) {
					// 파일명 앞에 업로드 시간 초단위로 붙여 파일명 중복을 방지
					fileName = System.currentTimeMillis() + "_" + fileName;

					file = new File(path + fileName);
					adImage.put("adImagePath", path + fileName);
					adImage.put("adImageName", fileName);
				}
			}

			out = new FileOutputStream(file);

			out.write(bytes);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return adImage;
	}
	
	private String getSaveLocation(MultipartHttpServletRequest request) {

		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String attachPath = "resources/files/";

		return uploadPath + attachPath;
	}
}
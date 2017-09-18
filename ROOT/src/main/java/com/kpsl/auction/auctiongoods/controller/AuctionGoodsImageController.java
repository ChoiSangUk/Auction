package com.kpsl.auction.auctiongoods.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class AuctionGoodsImageController {
	//이미지 업로드 추가
		@RequestMapping(value="/photoUploader")
		public String photo_uploader(){
			System.out.println("포토 업로더");
			return "smarteditor/photo_uploader/photo_uploader";
		}
		
		@RequestMapping(value="/callback")
		public String callBack(){
			System.out.println("콜백");
			return "smarteditor/photo_uploader/callback";
		}
		
		//싱글 이미지 업로드
		@RequestMapping(value="/singleAjax", method = RequestMethod.POST)
		public String singleAjax(HttpServletRequest request, @RequestParam("Filedata") MultipartFile file_data,
				@RequestParam("callback") String callback, @RequestParam("callback_func") String callback_func){
			System.out.println("싱글 파일");
			String file_result="";
			
			try{
				if(file_data != null && file_data.getOriginalFilename() != null){
					
					String original_name = file_data.getOriginalFilename();
					String filename_extension = original_name.substring(original_name.lastIndexOf(".")+1);
					filename_extension = filename_extension.toLowerCase();
					String defaultPath = request.getSession().getServletContext().getRealPath("/");
					String path = defaultPath + "resources" + File.separator+"upload"+File.separator+"image"+File.separator;
					
					File file = new File(path);
					
					if(!file.exists()){
						file.mkdirs();
					}
					
					SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
					String today = formatter.format(new java.util.Date());
					
					String modify_name = today + "-" + UUID.randomUUID().toString().substring(20)+"."+ filename_extension;
					
					file_data.transferTo(new File(path + modify_name));
					file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL="+request.getContextPath()+"/resources/upload/image/"+modify_name;
					
					System.out.println("single file upload 정보");
					System.out.println("defaultpath:"+defaultPath);
					System.out.println("path:"+path);
					System.out.println("originam_name:"+original_name);
					System.out.println("modify_name"+ modify_name);
					System.out.println("redirect:"+callback+"?callback_func="+callback_func+file_result);
				}else{
					file_result += "&errstr=error";
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return "redirect:" + callback + "?callback_func"+callback_func + file_result;
		}
		
		//다수 이미지 업로드
		@RequestMapping(value="/multipleAjax", method = RequestMethod.POST)
		public void multipleAjax(HttpServletRequest request, HttpServletResponse response){
			System.out.println("멀티 파일");
			try{
				String sFileInfo=""; //파일 정보
				//파일명을 받는다 - 일반 원본파일명
				String filename = request.getHeader("file-name");
				//파일 확장자
				String filename_extension = filename.substring(filename.lastIndexOf(".")+1);
				//확장자를소문자로 변경
				filename_extension = filename_extension.toLowerCase();
				
				//이미지 검증 배열변수 
				String[] allow_file = {"jpg","png","bmp","gif"};

				//돌리면서 확장자가 이미지인지
				int cnt = 0; 
				for(int i=0; i<allow_file.length; i++) { 
						if(filename_extension.equals(allow_file[i])){
							cnt++; 
							} 
					} 
				//이미지가 아님 
				if(cnt == 0) { 
					System.out.println("NOTALLOW_"+filename); 
				} else {
					//기본 경로
					String defaultPath = request.getSession().getServletContext().getRealPath("/");
					//배포시
					//defaultPath =getSaveLocation(request);
					//상세 경로
					String path = defaultPath + "resources" + File.separator + "upload" + File.separator + "image" + File.separator;
					
					// 배포할때에
					//path = getSaveLocation(request);
					File file = new File(path);
					if(!file.exists()){
						file.mkdirs();
					}
					
					SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
					String today = formatter.format(new java.util.Date());
					
					String modify_name = today + "-" + UUID.randomUUID().toString().substring(20)+"."+filename_extension;
					
					//서버에 파일 쓰기
					InputStream is = request.getInputStream();
					OutputStream os = new FileOutputStream(path + modify_name);
					int numRead;
					byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
					while((numRead = is.read(b,0,b.length))!= -1){
						os.write(b,0,numRead);
					}
					if(is != null){
						is.close();
					}
					os.flush();
					os.close();
					
					sFileInfo += "&bNewLine=true";
					sFileInfo += "&sFileName="+filename;
					sFileInfo += "&sFileURL="+request.getContextPath()+"/resources/upload/image/"+modify_name;
					PrintWriter print = response.getWriter();
					print.print(sFileInfo);
					print.flush();
					print.close();
					
					System.out.println("upload 정보");
					System.out.println("defaultpath:"+defaultPath);
					System.out.println("path:"+ path);
					System.out.println("original_name"+filename);
					System.out.println("modify_name"+modify_name);
					System.out.println("sFileInfo:"+ sFileInfo);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
	}
		private String getSaveLocation(HttpServletRequest request) {

			String uploadPath = request.getSession().getServletContext().getRealPath("/");
			String attachPath = "resources/files/";

			return uploadPath + attachPath;
		}
			
}

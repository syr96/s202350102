package com.oracle.oBootMybatis01.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UploadController {

	  // upLoadForm 시작 화면 
	  @RequestMapping(value = "upLoadFormStart")
	  public String upLoadFormStart(Model model) {
			System.out.println("upLoadFormStart Start");
		    return "upLoadFormStart";
	  }

	  @RequestMapping(value = "uploadForm", method = RequestMethod.GET)
	  public void uploadForm() {
			System.out.println("uploadForm GET Start");
	        System.out.println();
	  }
	  
	  @RequestMapping(value = "uploadForm", method = RequestMethod.POST)
	  public String uploadForm( HttpServletRequest request, MultipartFile file1, Model model ) 
			  throws IOException, Exception {
			// Servlet 상속 받지 못했을 떄 realPath 불러 오는 방법
			String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
			
			System.out.println("uploadForm POST Start");
			log.info("originalName: " + file1.getOriginalFilename());
		    log.info("size: " + file1.getSize());
		    log.info("contentType: " + file1.getContentType());
		    log.info("uploadPath: " + uploadPath);
		    String savedName = uploadFile(file1.getOriginalFilename(), file1.getBytes(), uploadPath);
            // Service --> DB CRUD
		    
		    log.info("Return savedName: " + savedName);
		    model.addAttribute("savedName", savedName);
		  
		    return "uploadResult";
	  }

	  private String uploadFile(String originalName, byte[] fileData, String uploadPath) throws IOException {
		    // universally unique identifier (UUID).
		    UUID uid = UUID.randomUUID();
		   // requestPath = requestPath + "/resources/image";
		    System.out.println("uploadPath->"+uploadPath);
		    // Directory 생성 
			File fileDirectory = new File(uploadPath);
			if (!fileDirectory.exists()) {
				// 신규 폴더(Directory) 생성 
				fileDirectory.mkdirs();
				System.out.println("업로드용 폴더 생성 : " + uploadPath);
			}
	
		    String savedName = uid.toString() + "_" + originalName;
		    log.info("savedName: " + savedName);
		    File target = new File(uploadPath, savedName);
	//	    File target = new File(requestPath, savedName);
		    // File UpLoad   --->  uploadPath / UUID+_+originalName
		    FileCopyUtils.copy(fileData, target);   // org.springframework.util.FileCopyUtils
		    
		    return savedName;
	  }
	  
	  
	  @RequestMapping(value = "uploadFileDelete", method = RequestMethod.GET)
	  public String uploadFileDelete( HttpServletRequest request,Model model ) 
			  throws Exception {
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		String deleteFile = uploadPath + "d98ca3a7-1f6f-4ef4-b3e7-4e2c3021e1f0_2.png";
	    log.info("deleteFile: " + deleteFile);
		System.out.println("uploadFileDelete GET Start");
	    int delResult = upFileDelete(deleteFile);
	    log.info("deleteFile result-> " + delResult);
	    model.addAttribute("deleteFile", deleteFile);
	    model.addAttribute("delResult", delResult);
	    return "uploadResult";
	  }	  

	  private int upFileDelete(String deleteFileName)   throws Exception {
		  int   result = 0;
		  log.info("upFileDelete result-> " + deleteFileName);
		  File file = new File(deleteFileName); 
		  if( file.exists() ){ 
		  	if(file.delete()){ 
		  		System.out.println("파일삭제 성공"); 
		  		result = 1;
		  	}
		    else{ 
		    	System.out.println("파일삭제 실패"); 
		    	result = 0;
		   	} 
		  }
		  else{ 
			  System.out.println("삭제할 파일이 존재하지 않습니다."); 
			  result = -1;
		  }
		  return result;
	  }

}

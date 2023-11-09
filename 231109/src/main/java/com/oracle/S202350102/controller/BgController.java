package com.oracle.S202350102.controller;

import java.io.File;
import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.Challenge;
import com.oracle.S202350102.dto.User1;
import com.oracle.S202350102.service.bgService.BgService;
import com.oracle.S202350102.service.hbService.Paging;
import com.oracle.S202350102.service.main.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class BgController {

	private final BgService bs;
	private final UserService userService;

		// 이 코드를 쓰려면 지금은 ?chg_id=1 를 bgChgDetail.jsp 페이지에서 주소창에 넣어줘야 함
	  @RequestMapping(value = "/bgChgDetail") public String
	  bgChgDetail(@RequestParam("chg_id") int chg_id, HttpSession session, Model model, 
			  							  Board board, String currentPage) {
	  
	  System.out.println("BgController bgChgDetail Start...");
	  System.out.println("BgController bgChgDetail chg_id -> "+chg_id);
	  
	  
	  // 세션에서 회원 번호 가져옴 
	  int userNum = 0; 
	  if (session.getAttribute("user_num") != null) { 
		  // 현재 세션에 'user_num'이라는 속성이 있는지 확인하고, 있다면 가져옵니다. 
		  userNum = (int) session.getAttribute("user_num");
		  System.out.println("BgController bgChgDetail userNum -> "+userNum); 
	  }
	  
	  // userSelect: 해당 userNum 회원의 유저 정보(회원번호) 조회 		mapper 키: userSelect (User.xml)
	  User1 user1 = userService.userSelect(userNum);
	  System.out.println("BgController bgChgDetail userNum -> "+userNum);
	  
	  
	  // 해당 chg_id의 게시글 만을 가져오기 위해 board 객체에 설정
	  board.setChg_id(chg_id);
	  
	  // 페이징 작업 
	  int totalCert = bs.totalCert();

	  Paging page = new Paging(totalCert, currentPage);
	  board.setStart(page.getStart()); 
	  board.setEnd(page.getEnd());
	  
	  
	  // certBoard: 인증 게시판 글 불러오기		mapper 키: bgCertBoardAll
	  List<Board> certBoard = bs.certBoard(board);
	  System.out.println("BgController certBoard.size() -> "+certBoard.size());
	  
	  
	  // bgChgDetail: 해당 chg_id 회원의 챌린지 상세 정보 조회		mapper 키: bgChgDetail
	  Challenge chg = bs.bgChgDetail(chg_id);
	  System.out.println("BgController bgChgDetail chg -> "+chg);
	  
	  
	  model.addAttribute("chg", chg); 
	  model.addAttribute("user1", user1);
	  model.addAttribute("totalCert", totalCert); 
	  model.addAttribute("certBoard", certBoard); 
	  model.addAttribute("page", page);
	  
	  return "bg/bgChgDetail"; 
	  
	  }
	 

	  
	// bgChgDetail 에 user랑 chg 정보 넣을 생각 못하고 만든 코드
	@RequestMapping(value = "/bgChgDetail2")
	public String boardCert(Board board, String currentPage, Model model) {
		System.out.println("BgController certBoard Start...");

		int totalCert = bs.totalCert();

		Paging page = new Paging(totalCert, currentPage);
		board.setStart(page.getStart());
		board.setEnd(page.getEnd());

		List<Board> certBoard = bs.certBoard(board);
		System.out.println("BgController certBoard.size() -> " + certBoard.size());

		model.addAttribute("totalCert", totalCert);
		model.addAttribute("certBoard", certBoard);
		model.addAttribute("page", page);

		return "bg/bgChgDetail";

	}

	
	
	// ajax 로 시도했을 때 만든 코드
	@ResponseBody
	@RequestMapping(value = "certBoardd")
	public Map<String, Object> certBoard(Board board, Model model) {
		System.out.println("BgController certBoard Start...");

		Map<String, Object> result = new HashMap<String, Object>();
		List<Board> boardCert = null;

		try {
			boardCert = bs.boardCert(board);
			result.put("status", "OK");
			result.put("boardCert", boardCert);
		} catch (Exception e) {
			System.out.println("BgController certBoard e.getMessage() -> " + e.getMessage());
		}
		System.out.println("BgController boardCert.size() -> " + boardCert.size());

		return result;
	}

	
	
	// 인증 글쓰기! mapper key: insertCertBrd		 ajax 로 시도했을 때 만든 코드
	@ResponseBody
	@RequestMapping(value = "writeCertBoard", method = RequestMethod.POST)
	public String writeCertBoard(@RequestParam("chg_id") int chg_id,
			                     @RequestParam("screenshot") MultipartFile screenshot, 
								 Board board, Model model, HttpSession session, HttpServletRequest request) 
										 throws IOException, Exception {
		System.out.println("BgController writeCertBoard Start...");
		System.out.println("BgController writeCertBoard board.getConts() -> " + board.getConts());
		System.out.println("BgController writeCertBoard board.getTitle() -> " + board.getTitle());
		System.out.println("BgController writeCertBoard board.getChg_Id() -> " + board.getChg_id());
		System.out.println("BgController writeCertBoard chg_id -> " +chg_id);
		// chg_id = board.getChg_id();
		  // 세션에서 회원 번호 가져옴 
		int userNum = 0; 
		if (session.getAttribute("user_num") != null) { 
		// 현재 세션에 'user_num'이라는 속성이 있는지 확인하고, 있다면 가져옵니다. 
		userNum = (int) session.getAttribute("user_num");
		System.out.println("BgController writeCertBoard userNum -> "+userNum); 
		}
		
		System.out.println("BgController writeCertBoard board.getUser_num() -> " + board.getUser_num());
		
		
		// 파일 업로드 경로를 설정
		// 서블릿 컨텍스트에서 실제 경로를 가져오는 방법
		// 여기서 이미지를 업로드하고, 업로드된 이미지의 파일 이름(savedName)을 얻어옵니다
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		
		log.info("originalName: "+screenshot.getOriginalFilename()); 	// 업로드 된 파일의 원본 이름
		log.info("size: "+screenshot.getSize()); 						// 업로드 된 파일의 크기
		log.info("contentType: "+screenshot.getContentType()); 			// 업로드 된 파일의 컨텐츠 타입
		log.info("uploadPath: "+uploadPath);							// 파일이 업로드 된 경로
		
		// 파일을 업로드 하고 실제 저장된 파일 이름을 받습니다
		String savedName = uploadFile(screenshot.getOriginalFilename(), screenshot.getBytes(), uploadPath);
		// 이미지를 Base64 문자열로 인코딩
		
		// ver1. 직접 이미지 업로드 후 Base64 변환 -> 
		// 이미지가 크거나 많은 양의 이미지를 다뤄야 하는 경우 서버에 이미지 저장 후 필요할 때 로드(서버 디스크 공간 차지)
		// String base64Image = Base64.getEncoder().encodeToString(screenshot.getBytes());
		
		// ver2. 업로드 없이 바로 Base64 변환 -> 이미지 크기가 작고 프로젝트가 서버 리소스에 큰 영향을 안 주는 경우
		// 메모리에서 바로 Base64 문자열로 변환하여 저장
		// String base64Image = encodeImageToBase64(savedName);
		
		board.setImg(savedName);
		
		log.info("Return savedName: "+savedName); 		// 저장된 파일 이름을 로그에 출력
		model.addAttribute("saveName", savedName);		// 뷰에 저장된 파일 이름을 전달합니다
		
		
		List<Board> boardList = null;
		// Map<String, Object> result = new HashMap<String, Object>();
		String rtnStr1 = "";
		int insertResult = 0;

		try {
			System.out.println("BgController writeCertBoard board -> "+board);
			insertResult = bs.insertCertBrd(board);
			// if (insertResult > 0) boardList = bs.boardCert(board);

			if (insertResult > 0) {
				rtnStr1 = "1"; // 입력성공

			} else {
				rtnStr1 = "2";  // 입력실패
			}

		} catch (Exception e) {
			System.out.println("BgController writeCertBoard e.getMessage() -> " + e.getMessage());
		}

		System.out.println("BgController writeCertBoard insertResult -> " + insertResult);
		System.out.println("BgController writeCertBoard rtnStr -> " + rtnStr1);

		return rtnStr1;
	}
	
	
	
	// 파일 업로드를 처리하는 Java 메소드
	private String uploadFile(String originalName, byte[] fileDate, String uploadPath) throws IOException {
		
		// 고유한 파일 이름을 생성하기 위해 UUID를 사용합니다.
		UUID uid = UUID.randomUUID();
		
		System.out.println("uploadPath: "+uploadPath); 		// 업로드 경로를 출력합니다
		
		// 업로드 할 디렉토리(Directory)를 생성합니다
		File fileDirectory = new File(uploadPath);
		if (!fileDirectory.exists()) {
			// 신규 폴더 (Directory) 생성
			fileDirectory.mkdirs();
			System.out.println("업로드 용 폴더 생성: "+uploadPath);
		}
		
		String savedName = uid.toString() + "_" + originalName;
		log.info("savedName: "+savedName);
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileDate, target); 	
		
		return savedName;
	}
	
	
	
	// certBoardUpdate 인증 게시판 글 수정
	@PostMapping(value = "updateCertBrd")
	public String updateCertBrd(Board board, Model model) {
		log.info("updateCertBrd Start...");
		
		int updateCount = bs.updateCertBrd(board);
		System.out.println("BgController bs.updateCertBrd updateCount -> "+updateCount);
		model.addAttribute("uptCnt", updateCount);
		model.addAttribute("kk3", "Message Test");
		
		return "redirect:bgChgDetail";
	}
	
	
	
	@RequestMapping(value = "deleteCertBrd")
	public String deleteCertBrd(int brd_num, Model model) {
		System.out.println("BgController Start delete...");
		int result = bs.deleteCertBrd(brd_num);
		
		return "redirect:bgChgDetail";
	}
	
	
	
	// ajax로 인증 게시판 삭제하기		deleteCertBrd
	@ResponseBody
	@RequestMapping(value = "/brdNumDelete")
	public String brdNumDelete(Board board) {
		System.out.println("BgController brdNumDelete Start");
		System.out.println("BgController brdNumDelete board.getBrd_num() -> "+board.getBrd_num());
		int delStatus = bs.deleteCertBrd(board.getBrd_num());
		String delStatusStr = Integer.toString(delStatus);
		return delStatusStr;
	}
}

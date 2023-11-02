package com.oracle.S202350102.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.service.yaService.YaCommunityService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class YaController {
	
	private final YaCommunityService ycs;
	
	//커뮤니티 게시글 전체조회
	@RequestMapping(value="/listCommunity")
	public String listCommunity(Board board, Model model) {
		System.out.println("YaController listCommunity start....");
		List<Board> listCommunity = ycs.listCommunity(board);
		System.out.println("YaController list listCommunity.size()?"+listCommunity.size());
		
		model.addAttribute("listCommunity", listCommunity);
		
		return "listCommunity";
	}
	
	//게시글 제목을 누르면 자세히 보기 
	// 로그인한 회원만 detailCommunity에서 수정/삭제 버튼 생김 추가
	
	@GetMapping(value="detailCommunity")
	public String detailCommunity(int brd_num, Model model, HttpSession session) {
		System.out.println("YaController Start detailCommunity start...");
		
		Board board = ycs.detailCommunity(brd_num);
		
		int upViewCnt = 0;
		ycs.upViewCnt(brd_num);
		System.out.println("upViewCOunt?"+upViewCnt);
		
		model.addAttribute("board", board);
		model.addAttribute("upViewCnt", upViewCnt);
		
		//로그인 상태 확인 
		String userId = (String) session.getAttribute("user_id");
		model.addAttribute("loggedIn", userId != null);
		return"ya/detailCommunity";
	}
	
	
	
	//로그인한 사용자만 회원번호를 가지고 커뮤니티 게시글 작성폼으로 이동, 폼에서 회원 닉네임 띄움
		@RequestMapping(value="/writeFormCommunity")
		public String writeFormCommunity(HttpSession session, Model model ) {
			System.out.println("YaController writeFormCommunity Start... ");
			String userId = (String) session.getAttribute("user_id");
			System.out.println("userId?"+userId);
			if (userId == null) {
				
				return "redirect:/loginForm"; 
			}
			
			 int userNum = ycs.getuserNum(userId);
			 model.addAttribute("userNum", userNum);
			 System.out.println("userNum?"+userNum);
			
			 Board board = new Board();
			 board.setUser_num(userNum); 
			 model.addAttribute("board", board); 
		
			return "ya/writeFormCommunity";
				

			}

	 // 게시글 작성,
	
		@PostMapping(value="/writeCommunity") 
		public String insertCommunity(HttpSession session, @ModelAttribute Board board, Model model) {
			System.out.println("YaController start insertCommunity... "); 
			String userId = (String) session.getAttribute("user_id");

		    if (userId == null) {
		        return "redirect:/loginForm";
		    }

		    int userNum = ycs.getuserNum(userId);
		    board.setUser_num(userNum);
		    	     
			int insertResult = ycs.insertCommunity(board);
			
			if (insertResult >0) 
			return "redirect:listCommunity";
			
			else {
				 model.addAttribute("msg", "작성 실패, 확인해보세요");
			 }
			 return "forward:writeCommunity"; 
		 }
		

		
		
		

}
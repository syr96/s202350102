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
import com.oracle.S202350102.dto.User1;
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
	@GetMapping(value="detailCommunity")
	public String detailCommunity(int brd_num, Model model, HttpSession session) {
		System.out.println("YaController Start detailCommunity start...");
		
	    // 게시글 상세 정보 확인
		Board board = ycs.detailCommunity(brd_num);
		
		//로그인 상태 확인 
		String userId = (String) session.getAttribute("user_id");

		
		//조회수 증가
		int upViewCnt = 0;
		ycs.upViewCnt(brd_num);
		
		
		model.addAttribute("board", board);
		model.addAttribute("upViewCnt", upViewCnt);	
	    model.addAttribute("loggedIn", userId != null);
		
		
	    System.out.println("nick: " + board.getNick());
	    System.out.println("userName:"+board.getUser_name());
	    System.out.println("user_num:"+board.getUser_num());
	    System.out.println("user_id:"+board.getUser_id());
	    System.out.println("sessionScope.userId: " + session.getAttribute("user_id"));
		
	    
	 
	
		return"ya/detailCommunity";
	}
	

	//로그인한 사용자  회원번호를 가지고 커뮤니티 게시글 작성폼으로 이동
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

	 // 게시글 작성
	
		@PostMapping(value="/writeCommunity") 
		public String insertCommunity(HttpSession session, @ModelAttribute Board board, Model model) {
			System.out.println("YaController start insertCommunity... "); 
			String userId = (String) session.getAttribute("user_id");

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
		
		// 게시글 수정폼이동
		@GetMapping(value="/updateCommunityForm")
		public String updateCommunity(int brd_num, Model model) {
			System.out.println("YaController updaetCommunityForm start...");
			
			Board board = ycs.detailCommunity(brd_num);
			// 정전
			System.out.println("title :"+board.getTitle());
			System.out.println("conts :"+board.getConts());
			
			model.addAttribute("board", board);
			
			return "ya/updateCommunityForm";
		}
		
		// 게시글 수정
		@GetMapping(value="/updateCommunity")
		public String updateCommunity(Board board, Model model) {
	
			
			int updateCommunity = ycs.updateCommunity(board);
			
			System.out.println("YaController ycs.updateCommunity updateBoard updateCommunity?"+updateCommunity);
			model.addAttribute("updateCommunity", updateCommunity);
			//수정후
			System.out.println("title update:"+board.getTitle());
			System.out.println("conts update:"+board.getConts());
			
			return "forward:listCommunity";
		}
		
		//게시글 삭제
		@GetMapping(value="/deleteCommunity")
		public String deleteCommuinty(int brd_num, Model model) {
			
			int deleteResult = ycs.deleteCommunity(brd_num);
			System.out.println("YaController ycs.deleteCommunity start....");
		
			return "redirect:listCommunity";
			
		}
		
		//자유게시판 게시글 조건(이름,제목)검색
		@RequestMapping(value="listBoardSearch")
		public String listBoardSearch(Board board, Model model) {
			System.out.println("YaController Start listCommunitySearch...");
			
			List<Board> listSerachBoard = ycs.listSearchBoard(board);
			System.out.println("YaController listSearchBoard.size?"+listSerachBoard.size());
			
			model.addAttribute("listSearchBoard", listSerachBoard);
			return "listCommunity";
			
		}
		

}
package com.oracle.S202350102.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.Challenge;
import com.oracle.S202350102.service.chService.ChBoardService;
import com.oracle.S202350102.service.chService.ChChallengeService;
import com.oracle.S202350102.service.chService.ChSearchService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ChController {
	
	
	private final ChBoardService 		chBoardService;
	private final ChSearchService 		chSearchService;
	private final ChChallengeService	chChallengeService;
	
	
	@RequestMapping("/notice")
	public String noticeList(@RequestParam("brd_md") int brd_md,Model model) {
		System.out.println("ChController noticeList Start...");
		
		List<Board> noticeList = chBoardService.noticeLIst(brd_md);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("brd_md", brd_md);
		return "notice";
	}
	
	@PostMapping("noticeWriteForm")
	public String noticeWrite(int brd_md,Model model) {
		System.out.println("ChController noticeList Start...");
		
		model.addAttribute("brd_md", brd_md);
		model.addAttribute("user_num", 7);

		return "/ch/noticeWriteForm";
	}
	
	
	@PostMapping("noticeWrite")
	public String noticeWrite(Board board, Model model, HttpServletRequest request) {
		
		System.out.println("ChController noticeWrite Start...");
		System.out.println("brd_md->"+ board.getBrd_md());
		int result = chBoardService.noticeWrite(board);
		System.out.println("Insert result->" + result);
		request.setAttribute("brd_md", board.getBrd_md());
		
		return "forward:notice";
	}
	
	@GetMapping("noticeConts")
	public String noticeConts(int brd_num, Model model) {
		System.out.println("ChController noticeConts Start...");
		System.out.println("brd_num->" + brd_num);
		chBoardService.noticeViewUp(brd_num);
		Board noticeConts = chBoardService.noticeConts(brd_num);
		
		model.addAttribute("noticeConts", noticeConts);
		
		return "/ch/noticeConts";
	}
	
	
	@RequestMapping(value = "noticeUpdateForm")
	public String noticeUpdateForm(int brd_num, Model model) {
		System.out.println("ChController noticeUpdateForm Start...");
		System.out.println("brd_num->" + brd_num);
		
		Board noticeConts = chBoardService.noticeConts(brd_num);
		
		model.addAttribute("noticeConts", noticeConts);
		
		
		return "/ch/noticeUpdateForm";
	}
	
	@PostMapping("noticeUpdate")
	public String noticeUpdate(Board board, HttpServletRequest request) {
		System.out.println("ChController noticeUpdate Start...");
		int result = 0;
		
		result = chBoardService.noticeUpdate(board);
	
		request.setAttribute("brd_md", board.getBrd_md());
		return "forward:notice";
	}
	
	@GetMapping("deleteNoticeForm")
	public String deleteform(int brd_num, Model model) {
			System.out.println("ChController deleteform Start...");
			Board board = chBoardService.noticeConts(brd_num);
			model.addAttribute("brd_num", brd_num);
			model.addAttribute("brd_md", board.getBrd_md());
			
		return "/ch/deleteNoticeForm";
	}
	
	@PostMapping("deleteNotice")
	public String deleteNotice(Board board, HttpServletRequest request) {
		System.out.println("ChController deleteNotice Start...");
		
		int result = chBoardService.deleteNotice(board.getBrd_num());
		
		request.setAttribute("brd_md",board.getBrd_md());
		return "forward:notice";
	}
	
	@GetMapping("search")
	public String search(Model model) {
		System.out.println("ChController search Start...");
		List<Challenge> popchgList = chChallengeService.popchgList();
		List<Board> popBoardList = chBoardService.popBoardList();
		
		model.addAttribute("popchgList", popchgList);
		model.addAttribute("popBoardList", popBoardList);
		
		return "search";
	}
	
	@GetMapping("searching")
	public String searching(String srch_word) {
		
		return "srchResult";
	}
	
}

package com.oracle.S202350102.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	@GetMapping(value="detailCommunity")
	public String detailCommunity(int brd_num, Model model) {
		System.out.println("YaController Start detailCommunity start...");
		
		Board board = ycs.detailCommunity(brd_num);
		
		int upViewCnt = 0;
		ycs.upViewCnt(brd_num);
		
		model.addAttribute("board", board);
		model.addAttribute("upViewCnt", upViewCnt);
		return"ya/detailCommunity";
	}
	
	
	//커뮤니티 게시글 작성폼 이동(회원번호 가지고,  닉네임 띄우면서)
	@RequestMapping(value="/writeFormCommunity")
	public String writeFormCommunity(Integer user_num, Model model ) {
		System.out.println("YaController writeFormCommunity Start... ");
		// 회원 닉네임만 get 
		String userNick = ycs.userNick(user_num);
		System.out.println("user_nick?"+userNick);
		model.addAttribute("userNick", userNick);
		return "ya/writeFormCommunity";
		
	//hi
	//안녕
	}
}
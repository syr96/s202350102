package com.oracle.S202350102.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.S202350102.dto.User1;
import com.oracle.S202350102.service.yrService.YrChallengerService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class YrController {
	private final YrChallengerService ycs;
	
//	@RequestMapping(value = "checkBoard")
//	public String checkBoard() {
//		System.out.println("YrController index Start...");
//		return "yr/checkBoard";
//	}
//	test
	
	@RequestMapping(value = "ssjFriends")
	public String listSsj(int chg_id, Model model) {
		System.out.println("YrController listSsj Start...");
		List<User1> listSsj = ycs.getListSsj(chg_id);
		
		model.addAttribute("listSsj", listSsj);
		return "yr/ssjFriends";
	}
	
	@RequestMapping(value = "chgJoin")
	public String chgJoin(int user_num, int chg_id, Model model) {
		System.out.println("YrController chgJoin Start...");
		
		return "yr/chgJoin";
	}
}
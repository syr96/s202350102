package com.oracle.S202350102.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.S202350102.dto.Challenge;
import com.oracle.S202350102.dto.User1;
import com.oracle.S202350102.service.jhService.JhCallengeService;
import com.oracle.S202350102.service.main.UserService;
import com.oracle.S202350102.service.main.UserServiceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class JhController {

	private final JhCallengeService jhCService;
	private final UserService userService;
	
	
	
	@RequestMapping(value = "/jhChgDetail")
	public String jhChgDetail(@RequestParam("chg_id") int chg_id, HttpSession session, Model model ) {
		

		System.out.println("JhController jhChgDetail Start...");
		System.out.println("JhController jhChgDetail  chg_id -> "+ chg_id);

		//챌린지 상세정보 조회
		Challenge chg = jhCService.jhChgDetail(chg_id);
		System.out.println("JhController jhChgDetail chg -> " + chg);
		
		//세션에서 회원번호 가져옴
		int userNum = 0;
		if(session.getAttribute("user_num") != null) {
			userNum = (int) session.getAttribute("user_num");
			System.out.println("JhController jhChgDetail userNum -> " + userNum);
		}
		
		//유저 정보(회원번호) 조회 -> 일단 더 필요한 유저 정보 있을까봐 user dto 자체를 가져옴 없으면 나중에 userNum만 모델에 저장할 예정
		User1 user = userService.userSelect(userNum);
		System.out.println("JhController jhChgDetail userNum -> " + user);
		
		model.addAttribute("chg", chg);
		model.addAttribute("user", user);
		
		
		return "jh/jhChgDetail";
	}
}

package com.oracle.S202350102.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.Challenge;
import com.oracle.S202350102.dto.Challenger;
import com.oracle.S202350102.dto.User1;
import com.oracle.S202350102.service.jhService.JhCallengeService;
import com.oracle.S202350102.service.main.UserService;
import com.oracle.S202350102.service.main.UserServiceImpl;
import com.oracle.S202350102.service.yrService.YrChallengerService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class JhController {

	private final JhCallengeService jhCService;
	private final UserService userService;
	// yr 작성
	// challenger 테이블값 가져오기용
	private final YrChallengerService ycs;
	
	
	@RequestMapping(value = "jhChgDetail")
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
		
		// yr 작성
		// challenger 테이블에서 참여인원 가져오기용
		int chgrParti = ycs.selectChgrParti(chg_id);
		Challenger chgr = new Challenger();
		chgr.setUser_num(userNum);
		chgr.setChg_id(chg_id);
		int chgrJoinYN = ycs.selectChgrJoinYN(chgr);
		model.addAttribute("chgrParti", chgrParti);
		model.addAttribute("chgrYN", chgrJoinYN);
		
		
		return "jh/jhChgDetail";
	}
	
	
	@RequestMapping(value = "reviewTab")
	public String jhReviewTab(@RequestParam("chg_id") int chg_id,  HttpSession session, Model model ){
		System.out.println("JhController jhReviewTab Start...");
		System.out.println("JhController jhReviewTab chg_id -> " + chg_id);

		String test = "테스트";
		String reviewTab = "reviewTab";
		Board chgBrdList = jhCService.jhChgBrdList(chg_id);
		
		model.addAttribute("test", test);
		model.addAttribute("activeTab", reviewTab);
		
		return "forward:jhChgDetail";
	}
}

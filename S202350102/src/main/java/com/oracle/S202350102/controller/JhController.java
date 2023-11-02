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
		
		/*
		 챌린지 상세 내용을 불러오기 위한 페이지
유저 로그인 상태(로그인 유무 / 일반인가 구독인가?/챌린지 목록에서 챌린지 눌렀을 때 비공개일 경우 비밀번호 모달창 필요(단, 비회원일 경우 로그인페이지로 이동) / 

파라미터 : 유저 로그인 상태/정보, 챌린지 등록번호 

필요한 유저 정보 - 로그인 상태 , 회원번호, ...



화면에 나타 날 정보 : 
썸네일 tumnb , 
챌린지 카테고리 : 조인으로 comm테이블에서 카테고리명 가져오기

타이틀 title , 

개설자 : user_num(회원 테이블 조인해서 개설자 유저 닉네임 가져오기) , 
참여 정원 : 현재참여인원 now_prti / 참여정원 chg_capacity
챌린지 진행 기간 : 챌린지 시작일 start_date ~ 챌린지 마감일 end_date, 
챌린지 진행상태 : 조인으로 comm테이블에서 진행상태 가져오기
인증빈도 : freq
챌린지 찜수  : pick_cnt


챌린지 소개 탭
챌린지소개 : chg_conts
인증방법 : upload
인증예시사진 : sample_img


조인!! 참여자들 : (챌린저 테이블 조인해서 회원들 정보(닉네임포함), 챌린지 테이블의 회원번호와 비교해서 같으면 개설자 아니면 참여자로 구분해서 화면에서 표시 

공개여부 굳이? ,

히든값 : 
유저 로그인 상태/정보, 
챌린지 등록번호 chg_id, 




안씀 챌린지 신청일 : reg_date
		 */
		System.out.println("JhController jhChgDetail Start...");
		System.out.println("JhController jhChgDetail  chg_id -> "+ chg_id);

		//챌린지 상세정보 조회
		Challenge chg = jhCService.jhChgDetail(chg_id);
		System.out.println("JhController jhChgDetail chg -> " + chg);
		
		//유저 정보(회원번호) 조회 -> 일단 더 필요한 유저 정보 있을까봐 user dto 자체를 가져옴 없으면 나중에 userNum만 모델에 저장할 예정
		String userId = session.getId();
		User1 user = userService.userSelect(userId); 
		int userNum = user.getUser_num();
		System.out.println("JhController jhChgDetail userNum -> " + userNum);
		
		//조인으로 comm테이블에서 카테고리명 가져오기
		 
		model.addAttribute("chg", chg);
		model.addAttribute("user", user);
		
		
		return "jh/jhChgDetail";
	}
}

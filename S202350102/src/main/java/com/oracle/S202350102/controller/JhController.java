package com.oracle.S202350102.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.Challenge;
import com.oracle.S202350102.dto.Challenger;
import com.oracle.S202350102.dto.User1;
import com.oracle.S202350102.service.bgService.BgService;
import com.oracle.S202350102.service.hbService.Paging;
import com.oracle.S202350102.service.jhService.JhCallengeService;
import com.oracle.S202350102.service.main.UserService;
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
	private final BgService bs;
	
	
	@RequestMapping(value = "challengeList")
	public String challengeList(HttpSession session
			  					, Model model 
			  					, String currentPage) {
		System.out.println("JhController challengeList Start...");
		
		List<Challenge> chgList = jhCService.challengeList();
		
		int chgListTotal = jhCService.chgListTotal();
		Paging chgListPage = new Paging(chgListTotal, currentPage);
		
		model.addAttribute("chgList", chgList);
		model.addAttribute("chgListPage", chgListPage);
		
		
		return "jh/jhChallengeList";
	}
	
	//HttpServletRequest request 안쓰고 HttpSession session만 해도 되는건가?
	//챌린지 상세정보 조회
	@RequestMapping(value = "chgDetail")
	public String chgDetail(@RequestParam("chg_id") int chg_id
						  , HttpSession session
						  , Model model
						  , String insertResultStr	// yr작성(챌린지 신청 후 결과 값 불러오기)
						  , String currentPage
						  , Board board) {

		System.out.println("JhController chgDetail Start...");
		System.out.println("JhController chgDetail  chg_id -> "+ chg_id);

		//세션에서 회원번호 가져옴
		int userNum = 0;
		if(session.getAttribute("user_num") != null) {
			userNum = (int) session.getAttribute("user_num");
			System.out.println("JhController chgDetail userNum -> " + userNum);
		}
		//유저 정보(회원번호) 조회 -> 일단 더 필요한 유저 정보 있을까봐 user dto 자체를 가져옴 없으면 나중에 userNum만 모델에 저장할 예정
		User1 user = userService.userSelect(userNum);
		System.out.println("JhController chgDetail userNum -> " + user);
		model.addAttribute("user", user);
		
		
		//jh 작성
		//챌린지 상세정보 조회
		Challenge chgDetail = jhCService.chgDetail(chg_id);
		System.out.println("JhController chgDetail chg -> " + chgDetail);
		model.addAttribute("chg", chgDetail);
		
		//jh 작성
		//후기 총 개수
		int reviewTotal = jhCService.reviewTotal(chg_id);
		model.addAttribute("reviewTotal", reviewTotal);
		System.out.println("JhController chgDetail  reviewTotal -> "+ reviewTotal);
		
		//페이지네이션
		Paging reviewPage = new Paging(reviewTotal, currentPage);
		board.setStart(reviewPage.getStart());
		board.setEnd(reviewPage.getEnd());
		model.addAttribute("reviewPage",reviewPage);
		System.out.println("JhController chgDetail  reviewPage.getStart() -> "+ reviewPage.getStart());
		System.out.println("JhController chgDetail  reviewPage.getTotal() -> "+ reviewPage.getTotal());
		System.out.println("JhController chgDetail  board.getChg_id() -> "+ board.getChg_id());
		
		
		//후기 목록 조회
		List<Board> chgReviewList = jhCService.chgReviewList(board);
		model.addAttribute("chgReviewList", chgReviewList);
		
		
		
		
		// yr 작성
		// challenger 테이블에서 참여인원 가져오기용
		int chgrParti = ycs.selectChgrParti(chg_id);
		System.out.println("JhController chgDetail chgrParti -> " + chgrParti);
		model.addAttribute("chgrParti", chgrParti);
		
		// challenger 참여 유무 판단용
		Challenger chgr = new Challenger();
		chgr.setUser_num(userNum);
		chgr.setChg_id(chg_id);
		int chgrJoinYN = ycs.selectChgrJoinYN(chgr);
		System.out.println("JhController chgDetail chgrJoinYN -> " + chgrJoinYN);
		model.addAttribute("chgrYN", chgrJoinYN);
		
		// 챌린지 신청 완료 유무 판단용
		int insertResult = 0;
		if(insertResultStr != null) insertResult = Integer.parseInt(insertResultStr);
		System.out.println("JhController chgDetail insertResult -> " + insertResult);
		model.addAttribute("insertResult", insertResult);
		
		// 소세지들 출력용
		List<User1> listSsj = ycs.getListSsj(chg_id);
		model.addAttribute("listSsj", listSsj);
//		String boardRegDate = ycs.getBoardRegDate(chg_id);
//		model.addAttribute("brdRegDate", boardRegDate);
		
		
		
		// bg 작성
		
		// 해당 chg_id의 게시글 만을 가져오기 위해 board 객체에 설정
		board.setChg_id(chg_id);
		  
		// 페이징 작업 
		int totalCert = bs.totalCert();
		
		Paging certBrdPage = new Paging(totalCert, currentPage);
		board.setStart(certBrdPage.getStart()); 
		board.setEnd(certBrdPage.getEnd());
		model.addAttribute("totalCert", totalCert);
		model.addAttribute("certBrdPage", certBrdPage);
		  
		  
		// certBoard: 인증 게시판 글 불러오기		mapper 키: bgCertBoardAll
		List<Board> certBoard = bs.certBoard(board);
		System.out.println("BgController certBoard.size() -> "+certBoard.size());
		model.addAttribute("certBoard", certBoard);
		  
		  
		// bgChgDetail: 해당 chg_id 회원의 챌린지 상세 정보 조회		mapper 키: bgChgDetail
		Challenge chg = bs.bgChgDetail(chg_id);
		System.out.println("BgController bgChgDetail chg -> "+chg);
		model.addAttribute("chg", chg);
		
		
		
		//작성자 이름옆에 레벨아이콘이 나오게 하기 위한 것 추후 추가할 것!! 카톡 게시글 231107에 등록된 글 확인
//		//hb 
//		List<UserLevel> userLevelInfoList = us.userLevelInfoList();
//		String icon = "";
//		int user_level = 0;
//		int user_exp = 0;
//		for (int i = 0; i < qBoardList.size(); i++) {
//		     user_num = qBoardList.get(i).getUser_num();
//		     for (int j = 0; j < userLevelInfoList.size(); j++) {
//		        if ( user_num == userLevelInfoList.get(j).getUser_num() ) {
//		        icon = userLevelInfoList.get(j).getLv_name();
//		        user_level = userLevelInfoList.get(j).getUser_level();
//		        user_exp = userLevelInfoList.get(j).getUser_exp();
//		        qBoardList.get(i).setIcon(icon);
//		        qBoardList.get(i).setUser_level(user_level);
//		        qBoardList.get(i).setUser_exp(user_exp);
//		        }
//		     }
//		}
		return "jh/jhChgDetail";
	}
	
	
	//챌린지 후기목록 조회 -> chgDetail로 합침
//	@RequestMapping(value = "reviewTab")
//	public String chgReviewList(@RequestParam("chg_id") int chg_id,  HttpSession session, Model model ){
//		System.out.println("JhController reviewList Start...");
//		System.out.println("JhController reviewList chg_id -> " + chg_id);
//		System.out.println("JhController reviewList user_num -> " + session.getAttribute("user_num"));
//		
//		//세션에서 회원번호 가져옴
//		int userNum = 0;
//		if(session.getAttribute("user_num") != null) {
//			userNum = (int) session.getAttribute("user_num");
//			System.out.println("JhController chgDetail userNum -> " + userNum);
//		}
//		
//		//유저 정보(회원번호) 조회 -> 일단 유저 dto로 모델에 저장 특정 정보만 필요할 경우 나중에 수정 예정
//		User1 user = userService.userSelect(userNum);
//		System.out.println("JhController chgDetail userNum -> " + user);
//		
//		List<Board> chgReviewList = jhCService.chgReviewList(chg_id);
//		model.addAttribute("chgReviewList", chgReviewList);
//		
//		model.addAttribute("user", user);
//		
//		return "jh/test3";
//	}
//	
	
	//챌린지 후기글 내용 조회
	@RequestMapping(value = "reviewContent")
	public String reviewContent(@RequestParam int brd_num, @RequestParam("chg_id") int chg_id, HttpSession session, Model model) {
		System.out.println("JhController reviewContent Start...");
		System.out.println("JhController reviewContent brd_num -> " + brd_num);
		
		//세션에서 회원번호 가져옴
		int userNum = 0;
		if(session.getAttribute("user_num") != null) {
			userNum = (int) session.getAttribute("user_num");
			System.out.println("JhController chgDetail userNum -> " + userNum);
		}
		
		//유저 정보(회원번호) 조회 -> 일단 유저 dto로 모델에 저장 특정 정보만 필요할 경우 나중에 수정 예정
		User1 user = userService.userSelect(userNum);
		System.out.println("JhController chgDetail userNum -> " + user);
		model.addAttribute("user", user);
		
		//챌린지 후기글 내용 조회
		Board reviewContent = jhCService.reviewContent(brd_num);
		
		//챌린지 해당 글에 대한 댓글 조회
		List<Board> reviewReply = jhCService.reviewReply(brd_num);
		
		// challenger 참여 유무 판단용
		Challenger chgr = new Challenger();
		chgr.setUser_num(userNum);
		chgr.setChg_id(chg_id);
		int chgrJoinYN = ycs.selectChgrJoinYN(chgr);
		System.out.println("JhController chgDetail chgrJoinYN -> " + chgrJoinYN);
		model.addAttribute("chgrYN", chgrJoinYN);
		
		
		System.out.println("JhController reviewContent reviewContent -> " + reviewContent);
		System.out.println("JhController reviewContent reviewReply -> " + reviewReply);
		model.addAttribute("reviewContent", reviewContent);
		model.addAttribute("reviewReply", reviewReply);
		model.addAttribute("chg_id", chg_id);
		
		return "jh/jhReviewContent";
	}
	
	
	
	
	
	
	
	//챌린지 신청 페이지로 이동
	@RequestMapping(value = "chgApplicationPage")
	public String chgApplication (HttpSession session, Model model) {
		System.out.println("JhController chgApplication Start...");
		System.out.println("JhController reviewList user_num -> " + session.getAttribute("user_num"));
		
		//세션에서 회원번호 가져옴
		int userNum = 0;
		if(session.getAttribute("user_num") != null) {
			userNum = (int) session.getAttribute("user_num");
			System.out.println("JhController chgDetail userNum -> " + userNum);
		}
		
		//유저 정보(회원번호) 조회 -> 일단 유저 dto로 모델에 저장 특정 정보만 필요할 경우 나중에 수정 예정
		User1 user = userService.userSelect(userNum);
		System.out.println("JhController chgDetail userNum -> " + user);
		
		//유저의 회원상태 가져옴
		String userStatus = jhCService.userStatus(userNum);
		
		model.addAttribute("user", user);
		model.addAttribute("userStatus", userStatus);
		
		
		return "jh/chgApplicationPage";
	}
	
	
	//챌린지 신청 등록
	@RequestMapping(value = "chgApplication")
	public String chgApplication (@ModelAttribute Challenge chg, @ModelAttribute User1 user, @RequestParam String userStatus,  Model model) {
		System.out.println("JhController chgApplication Start...");
		System.out.println("JhController chgApplication chg -> " + chg);		
		
		Date start_date = chg.getStart_date();
		Date end_date = chg.getEnd_date();
		
		
	
		//임시로 챌린지 목록으로 이동하게 함
		//나중에 내가 신청한 챌린지 목록으로 이동할 것
		return "listChallenge";
		
	}
	
	
	@RequestMapping(value = "replyInsert")
	public String replyInsert(Board board, HttpSession session, Model model) {
		System.out.println("JhController replyInsert Start...");
		//넣어야 할 값 -> 프로시저 만들기?
//		brd_num / chg_id / 히든으로 파라미터로 받기
//		user_num //user객체에서빼기
//		/ brd_lg / brd_md / 
//		conts /파라미터값으로
//		reg_date sysdate쓰기/ 
//		brd_group / brd_num과 같음
//		brd_step = 1 
		
		return "forward:reviewContent";
	}
	
	
}

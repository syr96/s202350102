package com.oracle.S202350102.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.BoardLike;
import com.oracle.S202350102.dto.ChallengPick;
import com.oracle.S202350102.dto.Challenge;
import com.oracle.S202350102.dto.Challenger;
import com.oracle.S202350102.dto.Comm;
import com.oracle.S202350102.dto.User1;
import com.oracle.S202350102.service.bgService.BgBoardService;
import com.oracle.S202350102.service.chService.ChChallengeService;
import com.oracle.S202350102.service.hbService.Paging;
import com.oracle.S202350102.service.jhService.JhCallengeService;
import com.oracle.S202350102.service.main.Level1Service;
import com.oracle.S202350102.service.main.UserService;
import com.oracle.S202350102.service.thService.ThChgService;
import com.oracle.S202350102.service.yrService.YrChallengePickService;
import com.oracle.S202350102.service.yrService.YrChallengerService;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class JhController {
	
	private final JhCallengeService jhCService;
	private final UserService userService;
	
	private final ThChgService tcs;
	
	// yr 작성
	private final YrChallengerService ycs;
	private final YrChallengePickService ycps;
	
	private final BgBoardService bBoardD;
	
	private final Level1Service ls;
	
	private final ChChallengeService	chChallengeService;
	
	//챌린지 기본 화면은 진행준 챌린지 최신순 정렬 -> 미완
//	@RequestMapping(value = "challengeList")
//	public String challengeList(HttpSession session
//			  					, Model model 
//			  					, String currentPage
//			  					, Challenge challenge
//			  					, int state_md
//			  					) {
//		System.out.println("JhController challengeList Start...");
//		
//
//		//진행중 총 챌린지 수
//		int chgListTotal = jhCService.chgListTotal(state_md);
//		
//		//페이지네이션
//		Paging chgListPage = new Paging(chgListTotal, currentPage);
//		challenge.setStart(chgListPage.getStart());
//		challenge.setEnd(chgListPage.getEnd());
//		
//		////진행중 챌린지///
//		//최신순
//		List<Challenge> chgRecList = jhCService.ingChgRecentList(challenge);
//		
//		//찜순
//		List<Challenge> ingChgPicList = jhCService.ingChgPickList(challenge);
//		
//		
//		model.addAttribute("chgListPage",chgListPage);
//		model.addAttribute("ingRecList", ingChgRecList);
//		model.addAttribute("ingPicList", ingChgPicList);
//		model.addAttribute("ingListTotal", ingChgListTotal);
//		
//		
//		return "jh/jhChgList";
//	}
	
//	//종료된 챌린지 기본화면 최근 종료순
//	@RequestMapping(value = "endChallengeList")
//	public String endChallengeList(HttpSession session
//			, Model model 
//			, String currentPage
//			, Challenge challenge
//			) {
//		System.out.println("JhController challengeList Start...");
//		
//		
//		//진행중 총 챌린지 수
//		int endChgListTotal = jhCService.endChgListTotal();
//		
//		//페이지네이션
//		Paging endchgListPage = new Paging(endChgListTotal, currentPage);
//		challenge.setStart(endchgListPage.getStart());
//		challenge.setEnd(endchgListPage.getEnd());
//		
//		////종료된 챌린지///
//		//최신순
//		List<Challenge> endChgRecList = jhCService.endChgRecentList();
//		
//		//찜순
//		List<Challenge> endChgPicList = jhCService.endChgPickList();
//		
//		
//		model.addAttribute("endchgListPage",endchgListPage);
//		model.addAttribute("endRecList", endChgRecList);
//		model.addAttribute("endPicList", endChgPicList);
//		model.addAttribute("endListTotal", endChgListTotal);
//		
//		
//		return "jh/jhEndChgList";
//	}
	
	//HttpServletRequest request 안쓰고 HttpSession session만 해도 되는건가?
	//챌린지 상세정보 조회
	@RequestMapping(value = "chgDetail")
	public String chgDetail(@RequestParam int chg_id
						  , @RequestParam(value = "sortBy", required = false) String sortBy
						  , @RequestParam(value = "searchType", required = false) String searchType
						  , @RequestParam(value = "keyword", required = false) String keyword
						  , HttpSession session
						  , Model model
						  , String currentPage
						  , Board board
						  , String tap) {

		System.out.println("JhController chgDetail Start...");
		System.out.println("JhController chgDetail  chg_id -> "+ chg_id);
		System.out.println("JhController chgDetail  tap -> "+ tap);

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
		chgReviewList = userService.boardWriterLevelInfo(chgReviewList);
		model.addAttribute("chgReviewList", chgReviewList);
		model.addAttribute("tap", tap);
		
		
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
		
		// 소세지들 출력용
		List<User1> listSsj = ycs.getListSsj(chg_id);
		// user1에서 레벨 못뽑나? ㅜㅜ
		// listSsj = userService.boardWriterLevelInfo(listSsj);
		model.addAttribute("listSsj", listSsj);
		
		// 찜 여부 판단용
		ChallengPick chgPick = new ChallengPick();
		chgPick.setChg_id(chg_id);
		chgPick.setUser_num(userNum);
		int chgPickYN = ycps.selectChgPickYN(chgPick);
		System.out.println("JhController chgDetail chgPickYN -> " + chgPickYN);
		model.addAttribute("chgPickYN", chgPickYN);
		
		// bg 작성
		
		// 해당 chg_id의 게시글 만을 가져오기 위해 board 객체에 설정
		board.setChg_id(chg_id);
		board.setSearchType(searchType);
		board.setSortBy(sortBy);
		
		// yr 작성
		// 로그인 된 정보를 넣기 위함
		board.setB_user_num(userNum);
		  
		// 페이징 작업 
		// 인증 글 개수			mapper 키: certTotal
		System.out.println("JhController board.getKeyword() -> "+board.getKeyword());
		System.out.println("JhController board.getSortBy() -> "+board.getSortBy());
		// 
		if (searchType == null && sortBy == null ) {
			
			// 카운팅
			int certTotal = bBoardD.certTotal(chg_id);
			model.addAttribute("certTotal", certTotal);
			System.out.println("certTotal -> " + certTotal);
			
			// 페이징
			Paging certBrdPage = new Paging(certTotal, currentPage);
			board.setStart(certBrdPage.getStart()); 
			board.setEnd(certBrdPage.getEnd());
			model.addAttribute("certTotal", certTotal);
			model.addAttribute("certBrdPage", certBrdPage);
			System.out.println("certBrdPage.getStart() -> "+certBrdPage.getStart());
			System.out.println("certBrdPage.getTotal() -> "+certBrdPage.getTotal());
			
			// certBoard: 인증 게시판 글 불러오기		mapper 키: bgCertBoardAll
			List<Board> certBoard = bBoardD.certBoard(board);
			certBoard = userService.boardWriterLevelInfo(certBoard);
			System.out.println("BgController certBoard.size() -> "+certBoard.size());
			model.addAttribute("certBoard", certBoard);
			
			
			// bgChgDetail: 해당 chg_id 회원의 챌린지 상세 정보 조회		mapper 키: bgChgDetail
			Challenge chg = bBoardD.bgChgDetail(chg_id);
			System.out.println("BgController bgChgDetail chg -> "+chg);
			model.addAttribute("chg", chg);
			
		} 
		
		// 키워드가 있을 때
		else {
			System.out.println("keyword3 -> "+keyword);
			System.out.println("searchType3 -> "+searchType);
			System.out.println("chg_id3 -> "+chg_id);
			System.out.println("sortBy3 -> "+sortBy);
			
			// 카운팅
			// mapper key: srchCrtBdCnt		 검색 결과 counting 후, 페이징 작업
			int searchCnt = bBoardD.srchCrtBdCnt(board);
			System.out.println("searchCnt3 -> "+searchCnt);
			
			// 페이징
			Paging page = new Paging(searchCnt, currentPage);
			board.setStart(page.getStart());	// 시작 시 1
			board.setEnd(page.getEnd());		// 시작 시 10
			System.out.println("sortBy3 page.getStart()-> "+page.getStart());
			System.out.println("sortBy3 page.getEnd()-> "+page.getEnd());
			System.out.println("sortBy3 page.getEndPage()-> "+page.getEndPage());
			
			// R
			// mapper key: searchCrtBd		 검색 결과 리스트 R
			List<Board> srchResult = bBoardD.searchCrtBd(board);
			srchResult = userService.boardWriterLevelInfo(srchResult);
			System.out.println("srchResult.size() -> "+srchResult.size());
			
			
			model.addAttribute("keyword", keyword);
			model.addAttribute("searchType", searchType);
			model.addAttribute("sortBy", sortBy);
			model.addAttribute("certTotal", searchCnt);
			model.addAttribute("certBoard", srchResult);
			/// 가공 후 페이지가 안 보이므로 명칭 통일
			model.addAttribute("certBrdPage", page);
			
			
		}
		
		
		
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
	
	
	//댓글 페이지네이션!!!!!!!!!
	//챌린지 후기글 내용 조회
	@RequestMapping(value = "reviewContent")
	public String reviewContent(
			//board에 brd_num 있기 때문에 따로 파라미터 없어도 됨, 페이지네이션 하려고 board를 파라미터로 받음
//								@RequestParam int brd_num 
								@RequestParam int chg_id 
								,HttpSession   session 
								,Model 		   model 
								,String 	   rep_brd_num
								,String 	   result
								,String 	   currentPage
								,Board		   board
								) {
		System.out.println("JhController reviewContent Start...");
		System.out.println("JhController reviewContent chg_id -> " + chg_id);

			
		//세션에서 회원번호 가져옴
		int userNum = 0;
		if(session.getAttribute("user_num") != null) {
			userNum = (int) session.getAttribute("user_num");
			System.out.println("JhController reviewContent userNum -> " + userNum);
		}
		
		//유저 정보(회원번호) 조회 -> 일단 유저 dto로 모델에 저장 특정 정보만 필요할 경우 나중에 수정 예정
		User1 user = userService.userSelect(userNum);
		System.out.println("JhController reviewContent userNum -> " + user);
		model.addAttribute("user", user);
		
		int brd_num = board.getBrd_num();
		System.out.println("JhController reviewContent brd_num -> " + brd_num);
		//후기 글 조회수 +1
		jhCService.viewCntUp(brd_num);
		
		//챌린지 후기글 내용 조회
		Board reviewContent = jhCService.reviewContent(brd_num);
		
		//후기글 총 댓글 수
		int replyCount = reviewContent.getReplyCount();
		
		//페이지네이션
		Paging replyPage = new Paging(replyCount, currentPage);
		board.setStart(replyPage.getStart());
		board.setEnd(replyPage.getEnd());
		model.addAttribute("replyPage",replyPage);
		System.out.println("JhController reviewContent  replyPage.getStart() -> "+ replyPage.getStart());
		System.out.println("JhController reviewContent  replyPage.getTotal() -> "+ replyPage.getTotal());
		System.out.println("JhController reviewContent  board.getChg_id() -> "+ board.getChg_id());
		
		//챌린지 해당 글에 대한 댓글 조회
		List<Board> reviewReplyList = jhCService.reviewReplyList(board);
		
		
		// challenger 참여 유무 판단용
		Challenger chgr = new Challenger();
		chgr.setUser_num(userNum);
		chgr.setChg_id(chg_id);
		int chgrJoinYN = ycs.selectChgrJoinYN(chgr);
		System.out.println("JhController chgDetail chgrJoinYN -> " + chgrJoinYN);
		model.addAttribute("chgrYN", chgrJoinYN);
		
		
		System.out.println("JhController reviewContent reviewContent -> " + reviewContent);
		System.out.println("JhController reviewContent reviewReply -> " + reviewReplyList);
		model.addAttribute("reviewContent", reviewContent);
		model.addAttribute("reviewReply", reviewReplyList);
		model.addAttribute("chg_id", chg_id);
		
		//댓글 수정
		if ( rep_brd_num != null ) {
			String flag = "flag";
			model.addAttribute("flag", flag);
			model.addAttribute("rep_brd_num", rep_brd_num);
			System.out.println("JhController reviewContent flag -> " + flag);
			System.out.println("JhController reviewContent rep_brd_num -> " + rep_brd_num);
		}
		
		
		//댓글 삭제/업데이트 결과정보 전달
		model.addAttribute("result", result);
		System.out.println("JhController reviewContent result -> " + result);
		
		return "jh/jhReviewContent";
	}
	
	@RequestMapping(value = "showReplyUpdate")
	public String showReplyUpdate(@RequestParam("rep_brd_num") int rep_brd_num, 
								  @RequestParam("ori_brd_num") int ori_brd_num,
								  @RequestParam("chg_id") 	   int chg_id, 
								  String currentPage,
								  Model model
								  ) {
		System.out.println("JhController showReplyUpdate Start...");
		System.out.println("JhController showReplyUpdate rep_brd_num -> " + rep_brd_num);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rep_brd_num", rep_brd_num); 
		
		//여기서 바로 업데이트 하는 게 아니라 forward 사용 redirect는 디비 수정후에 사용하는 것
		return "forward:reviewContent?brd_num="+ori_brd_num+"&chg_id="+chg_id ;
		
	}
	
	
	//챌린지 후기 댓글 입력
	@RequestMapping(value = "replyInsert")
	public String replyInsert(Board board, HttpSession session, Model model) {
		System.out.println("JhController replyInsert Start...");
		
		jhCService.replyInsert(board);
		
		//디비에 인서트는 이 메소드에서 해결 했으니 새롭게 reviewContent 요청해야하니 redirect 사용
		//forward 사용하면 새로고침시 같은 댓글이 계속 입력되는 문제 발생
		return "redirect:reviewContent?brd_num="+board.getBrd_num()+"&chg_id="+board.getChg_id();
	}
	

	@RequestMapping(value = "replyUpdate")
	public String replyUpdate( @RequestParam("ori_brd_num") int ori_brd_num,
							   Model model,
							   Board board) {
		
		int result = jhCService.replyUpdate(board);
		System.out.println("JhController replyInsert replyUpdate -> " + result );
		
		//댓글 수정 결과를 삭제와 어떻게 구분하지? -> 구분 안하고 댓글 변경 완료되었습니다 메세지로 통일
//		return "redirect:reviewContent?brd_num="+ori_brd_num+"&chg_id="+board.getChg_id();
		return "redirect:reviewContent?brd_num="+ori_brd_num+"&chg_id="+board.getChg_id()+"&result="+result;
	}
	
	//후기 댓글 삭제 근데 화면처리는 어떻게?
	@RequestMapping(value = "replyDelete")
	public String replyDelete(@RequestParam("ori_brd_num") String brd_num, 
							  @RequestParam("rep_brd_num") String brd_num2, 
							  int chg_id, 
							  HttpSession session, 
							  Model model) {
		
		System.out.println("JhController replyDelete Start...");
		
		int rep_brd_num = Integer.parseInt(brd_num2);
		
		int result = jhCService.replyDelete(rep_brd_num);
		
		System.out.println("JhController replyDelete result -> " + result);
		
		
		return "redirect:reviewContent?brd_num="+brd_num+"&chg_id="+chg_id+"&result="+result;
	}
	
	
	
	
	//챌린지 신청 페이지로 이동
	@RequestMapping(value = "chgApplicationForm")
	public String chgApplicationForm (HttpSession session, Model model) {
		System.out.println("JhController chgApplicationForm Start...");
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
		
		//유저의 회원상태 가져옴 필요 없는듯
//		String userStatus = jhCService.userStatus(userNum);
		
		//챌린지 카테고리 중분류 번호 가져오기
		//챌린지 카테고리 대분류
		int categoryLd = 200;
		List<Comm> category = jhCService.category(categoryLd);
		
		model.addAttribute("category", category);
		
		//추천챌린지(카테고리별 최신 등록순)
		List<Challenge> recomChgList = null;
		if (!category.isEmpty()) {
		    int firstMdValue = category.get(0).getMd();
		    
		    recomChgList = recommendCallenge(firstMdValue);
			
		}
		
		//태현 카테고리 리스트 -없어도 되려나?
//		List<Comm> chgCategoryList = tcs.listChgCategory();
//		model.addAttribute("chgCategoryList", chgCategoryList);

		
		
		model.addAttribute("recomChgList", recomChgList);
		
		model.addAttribute("user", user);
//		model.addAttribute("userStatus", userStatus);
		
		
		return "jh/jhChgApplicationForm";
	}
	
	
	//추천 챌린지 ajax
	@ResponseBody
	@RequestMapping(value = "recommendCallenge") 
	public List<Challenge>  recommendCallenge(int chg_md){
		System.out.println("JhController recommendCallenge Start...");
		
		List<Challenge> recomChgList = jhCService.recomChgList(chg_md);
//			for (Challenge challenge : chgList) {
//			    System.out.println(challenge.getTitle());
//			}

		return recomChgList;
	}
		
	
	//챌린지 신청 등록
	@PostMapping(value = "chgApplication")
	public String chgApplication (@ModelAttribute Challenge chg, Model model,@RequestParam(value = "sampleImgFile", required = false) MultipartFile sampleImgFile, @RequestParam("thumbFile") MultipartFile thumbFile, HttpServletRequest request) throws IOException  {
		/*
		 * public String chgApplication (@RequestBody Challenge chg, Model
		 * model, @RequestParam(value = "sample_img", required = false) MultipartFile
		 * sample_img, HttpServletRequest request) throws IOException {
		 */		System.out.println("JhController chgApplication Start...");
		System.out.println("JhController chgApplication chg -> " + chg);		
		//유저 번호 저장
		HttpSession session = request.getSession();
		int userNum = 0;
		if(session.getAttribute("user_num") != null) {
			userNum = (int) session.getAttribute("user_num");
			System.out.println("JhController chgApplication userNum -> " + userNum);
		} 
		chg.setUser_num(userNum);
		
		//공통코드 저장
		int chgLg = 200;
		chg.setChg_lg(chgLg);
		int stateLg = 300;
		chg.setState_lg(stateLg);
		int stateMd = 100;
		chg.setState_md(stateMd);
		
		
		  //저장 경로 생성 
		String uploadPath =  request.getSession().getServletContext().getRealPath("/upload/");
		  log.info("originalName: " + sampleImgFile.getOriginalFilename());
		  log.info("size: " +sampleImgFile.getSize()); log.info("contentType : " +  sampleImgFile.getContentType()); log.info("uploadPath : " + uploadPath);
		  
		 //진짜 저장 
		  //인증예시 사진
		  String sampleSaveName = uploadFile(sampleImgFile.getOriginalFilename(), sampleImgFile.getBytes(), uploadPath); 
		  chg.setSample_img(sampleSaveName);
		  
		  //썸네일
		  String thumbSaveName 	= null;
		  if(thumbFile != null && !thumbFile.isEmpty()) {
			  thumbSaveName = uploadFile(thumbFile.getOriginalFilename(), thumbFile.getBytes(), uploadPath); 
			  chg.setThumb(thumbSaveName);
		  } else {
			String chgDefaultImg = "assets/img/chgDfaultImg.png";
			chg.setThumb(chgDefaultImg);
		}
		 
		 log.info("Return sampleSaveName: " + sampleSaveName); model.addAttribute("sampleSaveName", sampleSaveName);
		 log.info("Return thumbSaveName: " + thumbSaveName); model.addAttribute("thumbSaveName", thumbSaveName);
		 
		 //챌린지 신청
		 int result = jhCService.chgApplication(chg);
		 
		 
			/* 챌린지 개설 될 경우 경험치 상승
			 * if(result > 0) { ls.userExp(userNum, chgLg, chg.getChg_md());
			 * ls.userLevelCheck(userNum); }
			 */
		 
		 
		 System.out.println("JhController chgApplication result -> " + result);
		 
		//임시로 챌린지 목록으로 이동하게 함
		//나중에 내가 신청한 챌린지 목록으로 이동할 것
		return "redirect:/mypage";
		
	}
	
//		Date start_date = chg.getStart_date();
//		Date end_date = chg.getEnd_date();
//		
	
	//파일 업로드용
	private String uploadFile(String originalName, byte[] fileData, String uploadPath) throws IOException {
		System.out.println("JhController uploadFile Start...");
		
		UUID uid = UUID.randomUUID();
		
		System.out.println("uploadPath" + uploadPath);
		
		//Directory 생성
		File fileDirectory = new File(uploadPath);
		if(!fileDirectory.exists()) {
			//신규폴더Directory 생성
			fileDirectory.mkdirs();
			System.out.println("업로드용 폴더 생성 : " + uploadPath);
		}
		
		String savedName = uid.toString() + "_" + originalName;
		log.info("savedName: " + savedName);
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	
	
	//후기 작성
	@RequestMapping(value = "reviewPost")
	public String reviewPost(Board board, HttpServletRequest request, @RequestParam(value = "file", required = false) MultipartFile file1, Model model) throws IOException {
		System.out.println("JhController reviewPost Start...");
		
		//저장 경로 생성
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		
		int user_num = board.getUser_num();
		board.setBrd_lg(700);
		board.setBrd_md(101);
		
		int lg = board.getBrd_lg();
		int md = board.getBrd_md();
		
			log.info("originalName: " + file1.getOriginalFilename());
			log.info("size: " +file1.getSize());
			log.info("contentType : " + file1.getContentType());
			log.info("uploadPath : " + uploadPath);
			
			//진짜 저장
			String saveName = uploadFile(file1.getOriginalFilename(), file1.getBytes(), uploadPath);
			board.setImg(saveName);
			
			
			log.info("Return savedName: " + saveName);
			model.addAttribute("savedName", saveName);
			
			//글 등록
			int result = jhCService.reviewPost(board);
			
			if ( result > 0 ) {
				ls.userExp(user_num, lg, md);
				ls.userLevelCheck(user_num);
			}
			System.out.println("JhController chgApplication result -> " + result);		
			
			return "redirect:chgDetail?&chg_id="+board.getChg_id()+"&tap=3";
		
	}
	
	//후기 수정
	@RequestMapping(value = "reviewUpdate")
	// public String reviewUpdate(Board board, HttpServletRequest request, @RequestParam(value = "file", required = false) MultipartFile file1) throws IOException {
	public String reviewUpdate(Board board, HttpServletRequest request, MultipartFile file1) throws Exception {
		System.out.println("JhController reviewUpdate Start...");
		
		//파일값 확인용
		if(file1 != null && !file1.isEmpty()) {
			log.info("size: " +file1.getSize());
			System.out.println("file1 -> " + file1.isEmpty());
			System.out.println("img -> " + board.getImg());
		} else {
			System.out.println("file1 == null ");
		}
		
		//파일삭제 여부 확인용
		int delStatus = board.getDelStatus();
		System.out.println("delStatus -> " +delStatus);
		
		//파일 삭제를 위한 기초 작업
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		String deleteFile = uploadPath + board.getImg();
		
		//새이미지 올린경우 (사용자가 기존 이미지 파일 삭제 유무와 관계 없이 이미지 대체) -> img에 새로운 파일명 대체
		if (file1 != null && !file1.isEmpty()) {
			
			
			//사용자가 파일을 새로 올리면 기존 이미지 먼저 삭제 처리
			int delResult= upFileDelete(deleteFile);
			System.out.println("delResult1 -> " + delResult);
			
			//사용자가 새로 올린 이미지 board dto에 Img에 저장
			String saveName = uploadFile(file1.getOriginalFilename(), file1.getBytes(), uploadPath);
			board.setImg(saveName);
			
		//새이미지 올리지 않고 기존 이미지 파일 삭제 원한 경우(글만 남기는 경우) -> img에 null 셋팅
		} else if (file1 == null || file1.isEmpty() && delStatus == 1) {
			
			int delResult= upFileDelete(deleteFile);
			System.out.println("delResult2 -> " + delResult);
			board.setImg(null);
			
		}//새이미지 올리지 않고 기존 이미지 원하는 경우 board dto에 기존 img값 유지
		
		
		//진짜 이미지 및 글 업데이트
		int result = jhCService.reviewUpdate(board);
		
		System.out.println("result -> " + result);
		
		return "redirect:reviewContent?brd_num="+board.getBrd_num()+"&chg_id="+board.getChg_id();
	}

	//후기 삭제
	@RequestMapping(value = "reviewDelete")
	public String reviewDelete(int brd_num, int chg_id, String img, HttpServletRequest request) throws Exception {
		
		//파라미터 : brd_num -> 이미지 삭제 위함, chg_id -> redirect로 이동하기 위함, img -> 이미지 삭제 위함
		
		System.out.println("JhController reviewDelete Start...");
		
		//글 삭제(이미지는 upload폴더에 그대로 남아 있음)
		int reviewDel = jhCService.reviewDelete(brd_num);
		
		//글이 삭제 되면 이미지도 같이 삭제 
		if(reviewDel > 0) {
			
			//이미지 삭제를 위한 작업
			String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
			String deleteFile = uploadPath + img;
			
			//실제 upload에 담김 파일 이미지 삭제
			int delResult= upFileDelete(deleteFile);
			
			System.out.println("JhController reviewDelete delResult -> " + delResult);
			
		}
		return "redirect:chgDetail?&chg_id=" + chg_id +"&tap=3";
	}

	//파일 삭제
	private int upFileDelete(String deleteFileName) throws Exception {
		int result = 0;
		log.info("upFileDelete result -> " + deleteFileName);
		File file = new File(deleteFileName);
		if (file.exists()) {
			if (file.delete()) {
				System.out.println("파일삭제 성공");
				result = 1;
				
			} 
			else {
				System.out.println("파일삭제 실패");
				result = 0;
			}
		} else {
			System.out.println("삭제할 파일이 존재하지 않습니다.");
			result = -1;
		}
		return result;
	}
	
	
	@RequestMapping(value = "chgAdminList")
	public String chgAdminList(Challenge challenge, String currentPage, @RequestParam(value = "sortOpt", required=false) String sortOpt,Model model, HttpSession session) {
		System.out.println("JhController chgAdminList Start...");
		//카테고리 명 보내기
		//chg_md랑 state_md 파라미터 조건으로 넣어서 카테고리별, 진행상태별 챌린지 한번에 가져오기(쿼리 재활용)
		//신청한 챌린지 리스트 가져오기-페이지네이션 포함/필터 적용 포함
		
//		int chgLg = 200;
//		challenge.setChg_lg(chgLg);
//		
//		int stateLg = 300;
//		challenge.setState_lg(stateLg);
		
		
		
		
		//전체 챌린지수와 리스트, 카테고리명(신청/진행/종료 공통)
		int totalChg 			= 0;
		List<Challenge> chgList = null;
		
		//카테고리 전체일 경우 chg_lg/chg_md = 0
		int chg_md 				= challenge.getChg_md();
		int chg_lg 				= challenge.getChg_lg();
		System.out.println("JhController chgAdminList state_md -> " + challenge.getState_md());
		System.out.println("JhController chgAdminList sortOpt -> " + sortOpt);
		System.out.println("JhController chgAdminList chg_md --> " + chg_md);
		System.out.println("JhController chgAdminList chg_lg --> " + chg_lg);
		System.out.println("JhController chgAdminList chg_lg --> " + currentPage);
		
		//전체 카테고리 때문에 challenge.getChg_lg()로 안가져오고 chgLg를 따로 넣음 카테고리 가져올 때 lg, md, ctn 
		//첨에 lg안 가져오고 직접 int chg_lg = 200으로 해서 전체카테고리 할 때 찜순같은 필터가 적용이 안됨(일단  tcs.totalChgIng에서 chg_lg=200이라 조건을 타지만 chg_md값이 없어서 총 개수가 0이 나옴)
		int chgLg = 200;
		List<Comm> category 	= jhCService.category(chgLg);
		System.out.println("JhController chgAdminList category --> " + category);
		
		//진행상태(대분류는 따로 값을 넣는 부분이 없어서 뺌)
		int state_md 			= challenge.getState_md();
		System.out.println("JhController chgAdminList state_md --> " + state_md);
		
		//페이지
		Paging page 			= null;
		
		
		//진행중,종료 챌린지일 경우
		if(challenge.getState_md() == 102 || challenge.getState_md() == 103) {
			
			//진행중 챌린지 총수
			if (challenge.getState_md() ==102  ) {
				System.out.println("JhController chgAdminList 진행 챌린지 ");
				totalChg = tcs.totalChgIng(challenge);
				System.out.println("JhController chgAdminList tcs.totalChgIng(challenge) --> " + totalChg);
				
				//종료 챌린지 총수
			} else if (challenge.getState_md() == 103) {
				System.out.println("JhController chgAdminList 종료 챌린지 ");
				totalChg = tcs.totalChgFin(challenge);
				System.out.println("JhController chgAdminList tcs.totalChgFin(challenge) --> " + totalChg);
			}
			
			
			//진행중,종료 공통 부분들
			//페이지네이션
			page = new Paging(totalChg, currentPage);
			//페이지 셋팅
			challenge.setStart(page.getStart());
			challenge.setEnd(page.getEnd());
			
			//조회 필터 셋팅(
			if(sortOpt != null) {
				challenge.setSortOpt(sortOpt);
				System.out.println("JhController chgAdminList sortOption --> " + sortOpt);
			}
				
			//리스트
			chgList = tcs.listChg(challenge);
			System.out.println("JhController chgAdminList listChg.size() --> " + chgList.size());
			System.out.println("JhController chgAdminList chg_lg --> " + challenge.getChg_lg());
			System.out.println("JhController chgAdminList chg_md --> " + challenge.getChg_md());

			
		//신청 /반려 챌린지인 경우	
		} else {
			System.out.println("JhController chgAdminList 신청 챌린지 ");
//			파라미터 chg_lg=200&state_lg=300&state_md=100
			totalChg = jhCService.chgListTotal(challenge);
			
			//페이지 네이션
			page = new Paging(totalChg, currentPage);
			//페이지 셋팅
			challenge.setStart(page.getStart());
			challenge.setEnd(page.getEnd());
			System.out.println("JhController chgAdminList page --> " + page);
			
			chgList = jhCService.chgAplList(challenge);
			
			System.out.println("JhController chgAdminList 신청 listChg.size() --> " + chgList.size());
			System.out.println("JhController chgAdminList 신청 totalChg --> " + totalChg);
			
			
		}
		
		System.out.println("JhController chgAdminList page --> " + page);
		
		
		model.addAttribute("sortOpt", sortOpt); 	//필터(찜순, 최근등록순, 참여자순)
		model.addAttribute("totalChg", totalChg); 	//전체 챌린지 수 (신청/진행/종료 공통)
		model.addAttribute("chgList", chgList);		//챌린지 리스트 (신청/진행/종료 공통)
		model.addAttribute("page", page);			//페이지네이션  (신청/진행/종료 공통)
		model.addAttribute("category",category); 	//카테고리별 조회용
		model.addAttribute("state_md",state_md); 	//챌린지 진행 상태 중분류
		model.addAttribute("chg_lg", chg_lg); 		//챌린지 카테고리 대분류
		model.addAttribute("chg_md", chg_md); 		//챌린지 카테고리 중분류
		
		
		/*
		 * List<Challenge> chgAdminList = jhCService.chgAdminList(challenge);
		 * 
		 * //총합도 카테고리별, 진행상태별 조건으로 동적쿼리 만들어서 한번에 가져오기 int chgApcTotal = 0;
		 * 
		 * model.addAttribute("chgAdminList", chgAdminList);
		 */
		
//		if(challenge.getState_md() != 100) 
			return "jh/chgAdminList"; //진행/종료 챌린지 리턴
//		else return "jh/chgApplicationAdminList";					 //신청 챌린지 리턴
		
	}
	
	//챌린지 관리자 상세보기
	@RequestMapping(value = "chgAdminDetail")
	public String chgAdminDetail(
								   Challenge challenge
								,  HttpSession session
								, Model model
								, @RequestParam(value = "chgUpdateMode", required = false) String chgUpdateMode
								, @RequestParam(value = "result", required = false) String result
								) {
		System.out.println("JhController chgAdminDetail Start...");
		
		
		//진행상태 중분류 - 신청/반려/진행/종료 모두 한 페이지에 표기하기 위한 것
		int state_md = challenge.getState_md();
		
		
		//반려사유 종류
		int returnCategoryLd = 500;
		List<Comm> returnReason = jhCService.category(returnCategoryLd);
		
		model.addAttribute("returnReason", returnReason);
		System.out.println("JhController chgAdminDetail  returnReason --> " + returnReason);
		
		
		
		//목록 눌렀을 때 해당 페이지 번호 리스트로 돌아가기 위한 것 ->수정하기
		String pageNum = challenge.getPageNum();
		
		
		
		
		int chg_id = challenge.getChg_id();
		System.out.println("JhController chgAdminDetail  chg_id --> " + chg_id);
		
		challenge = jhCService.chgDetail(chg_id);
		
		int chgrParti = ycs.selectChgrParti(chg_id);
		System.out.println("JhController chgDetail chgrParti -> " + chgrParti);
		model.addAttribute("chgrParti", chgrParti);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("chg", challenge);
		model.addAttribute("state_md", state_md);
		
		//업데이트용 페이지
		
		System.out.println("JhController chgDetail chgUpdateMode -> " + chgUpdateMode);
		
		if(chgUpdateMode.equals("1")) {
			System.out.println("JhController chgDetail 수정 페이지로 이동 ");
			
			//챌린지 카테고리 수정용 카테고리
			int chgCategoryLd = 200;
			List<Comm> category = jhCService.category(chgCategoryLd);
			
			model.addAttribute("category", category);

			//진행상태 리스트 가져오기
			int stateMd = 300;
			List<Comm> stateMdCategory = jhCService.category(stateMd);
			model.addAttribute("stateMdCategory", stateMdCategory);
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String end_date = dateFormat.format(challenge.getEnd_date());			
			String reg_date = dateFormat.format(challenge.getReg_date());
			String create_date = dateFormat.format(challenge.getCreate_date());			
			
			model.addAttribute("end_date", end_date);
			model.addAttribute("reg_date", reg_date);
			model.addAttribute("create_date", create_date);
			
			
			
			return "jh/jhChgAdminUpdateForm";
		}
		
		//수정 완료 후 돌아왔을 떄 결과 값 저장해서 수정 성공 여부  chgAdminDetail에서 alert 창 보여주기 위한 용도
		model.addAttribute("result",result);
		
		return "jh/chgAdminDetail";
		
	}
	
	
	
	@RequestMapping(value = "approvReturn")
	public String approvReturn(int approvReturn, int chg_id, int state_md,@RequestParam(required = false) Integer user_num, @RequestParam(required = false) Integer return_md) {
		System.out.println("JhController approvReturn Start...");
		System.out.println("JhController approvReturn approvReturn -> " + approvReturn);
		System.out.println("JhController approvReturn chg_id -> " 		+ chg_id);
		System.out.println("JhController approvReturn state_md -> "		+ state_md);
		System.out.println("JhController approvReturn user_num -> " 	+ user_num);
		System.out.println("JhController approvReturn return_md-> " 	+ return_md);
		
		Map<String, Object> apvRtnParaMap = new HashMap<String, Object>();
		//승인
		if (approvReturn == 1) {
			
			//챌린저 테이블에 추가 할 user_num
			apvRtnParaMap.put("user_num", user_num);
			
		//반려
		} else {
			//챌린지 테이블에 업데이트 할 반려 사유 중분류
			apvRtnParaMap.put("return_md", return_md);
			
		}
		
		//승인/반려 선택 값
		apvRtnParaMap.put("approvReturn", approvReturn);
		
		//승인/반려 할 챌린지 pk 
		apvRtnParaMap.put("chg_id", chg_id);
		
		//실제 승인/반려 처리할 프로시저 호출
		int result = jhCService.approvReturn(apvRtnParaMap);
		
		System.out.println("JhController approvReturn result -> " + result);
		
		//승인/반려 처리 후 기존 챌린지 관리 해당 페이지로 이동
		return "redirect:chgAdminDetail?chg_id="+chg_id+"&state_md="+state_md+"&chgUpdateMode='0'";
		
	}
	
	
	@RequestMapping(value = "/chgAdminUpdate")
	public String chgAdminUpdate(Challenge chg,  HttpServletRequest request,
			  @RequestParam(value = "sampleImgFile") MultipartFile sampleImgFile,
			  @RequestParam(value = "thumbFile", required = false) MultipartFile thumbFile) throws Exception {
		System.out.println("JhController chgAdminUpdate Start...");
		System.out.println("JhController chgAdminUpdate chg -> "+ chg);
		
		int chg_id = chg.getChg_id();
		int state_md = chg.getState_md();
		
		HttpSession session = request.getSession();
		int user_num = 0;
		int result = 0;
		
		if(session.getAttribute("user_num") != null) {
			 			
			user_num = (int) session.getAttribute("user_num");
			User1 user = userService.userSelect(user_num);
			
			/*************유저 권한 확인*************/
			if( user.getStatus_md() == 102) { //관리자면
				System.out.println("JhController 관리자 수정 Start...");
				
				String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
				/*************샘플이 바뀌었다면 기존 이미지 삭제 후 샘플 저장*************/
				if(sampleImgFile != null && !sampleImgFile.isEmpty()) {
					System.out.println("JhController sampleImgFile 널 아님 Start...");
					//기존 샘플이미지 파일 삭제 작업
					String deleteFile = uploadPath + chg.getSample_img();
					int delResult= upFileDelete(deleteFile);
					System.out.println("delResult1 -> " + delResult);
					//새 샘플이미지 파일 업로드
					String saveName = uploadFile(sampleImgFile.getOriginalFilename(), sampleImgFile.getBytes(), uploadPath);
					chg.setSample_img(saveName);
				}else {
					chg.setSample_img(null);		
				}	
				
				System.out.println("JhController sampleImgFile 널이라 수정 안함 Start...");
				
				//썸네일 삭제 여부
				int delStatus = chg.getDelStatus();
				System.out.println("JhController chgAdminUpdate delStatus -> " + delStatus);
				/*************썸네일 기존 이미지 삭제 여부 확인*************/
				// 새 썸네일 업로드 한 경우
				if( thumbFile != null && !thumbFile.isEmpty()) {
					
					//새 썸네일 업로드 하면 기존 이미지 먼저 삭제 처리
					String deleteFile = uploadPath + chg.getThumb();
					int delResult= upFileDelete(deleteFile);
					System.out.println("delResult1 -> " + delResult);
					
					//새로 올린 썸네일 저장
					String saveName = uploadFile(thumbFile.getOriginalFilename(), thumbFile.getBytes(), uploadPath);
					chg.setThumb(saveName);
					
				}else if (thumbFile == null || thumbFile.isEmpty() && delStatus == 1) {
					
					String deleteFile = uploadPath + chg.getThumb();
					int delResult= upFileDelete(deleteFile);
					System.out.println("delResult1 -> " + delResult);
					
					chg.setThumb(null);
					
				}
				
				
				
				/*if(delStatus == 1 || thumbFile != null) {
					System.out.println("JhController sampleImgFile 썸네일 기존 이미지 삭제 Start...");
					//기존 썸네일 삭제 
					String deleteFile = uploadPath + chg.getThumb();
					int delResult= upFileDelete(deleteFile);
					System.out.println("delResult1 -> " + delResult);
					
					*************삭제가 아닌 업데이트라면 새 이미지 저장************
					if(thumbFile != null) {
						System.out.println("JhController sampleImgFile 썸네일 아예 없앰 Start...");
						//새 썸네일 저장
						String saveName = uploadFile(thumbFile.getOriginalFilename(), thumbFile.getBytes(), uploadPath);
						chg.setThumb(saveName);
						
					// 썸네일만 삭제, 새 썸네일 업로드 안함	-> 기본 썸네일 저장
					} else {
						String saveName = "assets/img/chgDfaultImg.png";
						chg.setThumb(saveName);
					}
					
				}*/
				
				System.out.println("JhController 챌린지 진짜 수정 Start...");
				result = jhCService.chgAdminUpdate(chg);		
				
				
			}
		}
		
		System.out.println("JhController chgAdminUpdate result -> "+ result);
		
			return "redirect:chgAdminDetail?chg_id="+chg_id+"&state_md="+state_md+"&chgUpdateMode='0'"+"&result="+result;
	}
	
	
	
	/*
	 * @RequestMapping(value = "modify") public String modify() {
	 * 
	 * return "jh/modify"; }
	 */
	
	
	/*
	 * @Data public class RecommendChg { private int chg_id; private String title;
	 * private String thumb;
	 * 
	 * }
	 * 
	 * 
	 * 
	 * @Data private static class Result { private final List<?> List; private final
	 * int listSize; }
	 */
	
	
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "boardImgDelete") public String boardImgDelete(int
	 * brd_num, String img, HttpServletRequest request) throws Exception {
	 * System.out.println("JhController boardImgDelete Start...");
	 * 
	 * 
	 * //해당글의 이미지 디비에서 null로 만듦 int brdImgDel = jhCService.boardImgDelete(brd_num);
	 * String delStatusStr = null; if ( brdImgDel > 0 ) {
	 * 
	 * //upload에 담김 파일 삭제 String uploadPath =
	 * request.getSession().getServletContext().getRealPath("/upload/"); String
	 * deleteFile = uploadPath + img; int delResult = upFileDelete(deleteFile);
	 * delStatusStr = Integer.toString(delResult);
	 * 
	 * System.out.println("JhController boardImgDelete delResult -> " + delResult);
	 * }
	 * 
	 * return delStatusStr; }
	 */
	 
	
}

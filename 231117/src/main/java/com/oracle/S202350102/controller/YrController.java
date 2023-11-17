package com.oracle.S202350102.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S202350102.dto.BoardLike;
import com.oracle.S202350102.dto.ChallengPick;
import com.oracle.S202350102.dto.Challenger;
import com.oracle.S202350102.dto.Following;
import com.oracle.S202350102.dto.User1;
import com.oracle.S202350102.service.yrService.YrBoardLikeService;
import com.oracle.S202350102.service.yrService.YrChallengePickService;
import com.oracle.S202350102.service.yrService.YrChallengerService;
import com.oracle.S202350102.service.yrService.YrFollowingService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class YrController {
	private final YrChallengerService 		ycs;
	private final YrFollowingService 		yfis;
	private final YrChallengePickService 	ycps;
	private final YrBoardLikeService		ybls;
	
//	@RequestMapping(value = "checkBoard")
//	public String checkBoard() {
//		System.out.println("YrController index Start...");
//		return "yr/checkBoard";
//	}
	
	// chgDetail로 출력됨
	@ResponseBody
	@RequestMapping(value = "chgJoinPro")
	public Map<String, Object> chgJoinPro(Challenger chgr) {
		System.out.println("YrController chgJoinPro Start...");
		
		int insertResult = ycs.insertChgr(chgr);
		System.out.println("YrController Insert Success...");
//		model.addAttribute("insertResult", insertResult);		// 없어도 되나? -> 이게 되네
		
//		return "forward:chgDetail?chg_id=" + chgr.getChg_id() + "&insertResultStr=" + insertResult;	// forward 안써도 가능. 왜냐면 parameter를 직접 보내기 때문이다
//		return "redirect:chgDetail?chg_id=" + chgr.getChg_id() + "&insertResultStr=" + insertResult;
		Map<String, Object> joinResult = new HashMap<>();
		joinResult.put("chgJoin", insertResult);
		
		return joinResult;
	}

	// follow 유무 체크
	@ResponseBody
	@RequestMapping(value = "followingCheck")
	public Map<String, Object> followingCheck(@RequestParam("following_id") int following_id
											, HttpSession session) {
		System.out.println("YrController followingCheck Start...");
		System.out.println("YrController followingCheck following_id -> " + following_id);
		
		int userNum = 0;
		if(session.getAttribute("user_num") != null) {
			userNum = (int) session.getAttribute("user_num");
			System.out.println("YrController followingCheck userNum -> " + userNum);
		}
		
		Following fwi = new Following();
		Map<String, Object> followCheck = new HashMap<>();
		fwi.setUser_num(userNum);
		fwi.setFollowing_id(following_id);
		int fStatus = yfis.followingCheck(fwi);
		System.out.println("YrController followingCheck fStatus -> " + fStatus);
		followCheck.put("fStatus", fStatus);			
		return followCheck;
	}
	
	// follow or UnFollow
	@ResponseBody
	@RequestMapping(value = "followingPro")
	public Map<String, Object> followingPro(@RequestParam("user_num") int following_id
											, HttpSession session) {
		System.out.println("YrController followingPro Start...");
		System.out.println("YrController followingPro following_id -> " + following_id);
		
		int userNum = 0;
		if(session.getAttribute("user_num") != null) {
			userNum = (int) session.getAttribute("user_num");
			System.out.println("YrController followingPro userNum -> " + userNum);
		}
		
		Following fwi = new Following();
		Map<String, Object> followResult = new HashMap<>();
		if(userNum != following_id) {	// 나 자신은 팔로우할 수 없다
			fwi.setUser_num(userNum);
			fwi.setFollowing_id(following_id);
			int followingPro = yfis.following(fwi);
			System.out.println("YrController followingPro followingPro -> " + followingPro);
			
			followResult.put("following", followingPro);			
		} else {
			followResult.put("following", -1);
		}
		return followResult;
	}
	
	// following 리스트
	@RequestMapping(value = "followList")
	public String followList(HttpSession session, Model model) {
		
		// session에 저장된 로그인 정보값 가져오기
		int userNum = 0;
		if(session.getAttribute("user_num") != null) {
			userNum = (int) session.getAttribute("user_num");
			System.out.println("YrController followList userNum -> " + userNum);
		}
		
		// 팔로잉 리스트 출력
		List<User1> followingList = yfis.followingList(userNum);
		System.out.println("YrController followingList -> " + followingList);
		model.addAttribute("followingList", followingList);
		
		// 팔로우 리스트 출력
		List<User1> followerList = yfis.followerList(userNum);
		System.out.println("YrController followerList -> " + followerList);
		model.addAttribute("followerList", followerList);
		
		return "jk/followList";
	}

	// 챌린지 찜 유무
//	@ResponseBody
//	@RequestMapping(value = "chgPickCheck")
//	public int chgPickCheck(@RequestParam("chg_id") int chg_id
//							, HttpSession session) {
//		
//		System.out.println("YrController chgPickCheck Start...");
//		System.out.println("YrController chgPickCheck chg_id -> " + chg_id);
//		
//		int userNum = 0;
//		if(session.getAttribute("user_num") != null) {
//			userNum = (int) session.getAttribute("user_num");
//			System.out.println("YrController chgPickCheck userNum -> " + userNum);
//		}
//		
//		ChallengPick chgPick = new ChallengPick();
//		chgPick.setChg_id(chg_id);
//		chgPick.setUser_num(userNum);
//		int chgPickYN = ycps.selectChgPickYN(chgPick);
//		
//		return chgPickYN;
//	}
	
	// 챌린지 찜하기
	// chgDetail로 출력됨
	@ResponseBody
	@RequestMapping(value = "chgPickPro")
	public Map<String, Object> chgPickPro(@RequestParam("chg_id") int chg_id
										, HttpSession session) {
		
		System.out.println("YrController chgPickPro Start...");
		System.out.println("YrController chgPickPro chg_id -> " + chg_id);
		
		int userNum = 0;
		if(session.getAttribute("user_num") != null) {
			userNum = (int) session.getAttribute("user_num");
			System.out.println("YrController chgPickPro userNum -> " + userNum);
		}

		ChallengPick chgPick = new ChallengPick();
		Map<String, Object> chgPickResult = new HashMap<>();
		chgPick.setChg_id(chg_id);
		chgPick.setUser_num(userNum);
		int chgPickPro = ycps.chgPick(chgPick); 
		System.out.println("YrController chgPickPro chgPickPro -> " + chgPickPro);
		chgPickResult.put("chgPick", chgPickPro);
		return chgPickResult;
	}
	
	// 좋아요 기능
	@ResponseBody
	@RequestMapping(value = "likePro")
	public int likePro(@RequestParam("brd_num") int brd_num
					, HttpSession session) {

		System.out.println("YrController likePro Start...");
		System.out.println("YrController likePro brd_num -> " + brd_num);
		
		int userNum = 0;
		if(session.getAttribute("user_num") != null) {
			userNum = (int) session.getAttribute("user_num");
			System.out.println("YrController likePro userNum -> " + userNum);
		}

		BoardLike brdLike = new BoardLike();
		brdLike.setBrd_num(brd_num);
		brdLike.setUser_num(userNum);
		int likeProResult = ybls.likePro(brdLike);
		System.out.println("YrController likePro likeProResult -> " + likeProResult);
		
		return likeProResult;
	}
	
}
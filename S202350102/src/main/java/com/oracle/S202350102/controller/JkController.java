package com.oracle.S202350102.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.User1;
import com.oracle.S202350102.service.jkService.JkBoardService;
import com.oracle.S202350102.service.jkService.JkUserService;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class JkController {
	
	private final JkUserService jus;
	private final JkBoardService jbs;
	
	//좋아요 기능 컨트롤러
	//좋아요 상태 가져오는 메소드
	@GetMapping("/board/{brd_num}/like")
	public ResponseEntity<String> getLikeStatus(@PathVariable int brd_num) {
		System.out.println("JkController getlikestatus start...");
	   
	    return new ResponseEntity<>("Like status of Board with brd_num " + brd_num, HttpStatus.OK);
	}

	@PostMapping("/board/{brd_num}/like")
	public ResponseEntity<String> updateLikeStatus(@PathVariable int brd_num) {
		System.out.println("JkController updateLikeStatus start..." + brd_num);
		
		jbs.updateLikeStatus(brd_num);
	    return new ResponseEntity<>("Updated like status of Board with brd_num " + brd_num, HttpStatus.OK);
	}

	
	
	//쉐어링 게시글 전체조회
	@RequestMapping(value="/Sharing")
	public String Sharing(Board board, Model model, HttpSession session) {
		System.out.println("JkController Sharing start...");
		List<Board> Sharing = jbs.Sharing(board);
		System.out.println("JkController list Sharing.size()?"+Sharing.size());
		
		int user_num = 0;
		if(session.getAttribute("user_num") != null) {
			user_num = (int) session.getAttribute("user_num");
		}
		
		User1 user1 = jbs.userSelect(user_num);
		
		model.addAttribute("user1", user1);
		model.addAttribute("Sharing", Sharing);
		
		return "Sharing";
		}
	
	@RequestMapping(value="/challengeManagement")
	public String challengeManagement(Integer user_num, Model model ) {
		System.out.println("JkController challengeManagement Start... ");
		
		return "jk/challengeManagement";	
	}
	
	// 회원정보 조회
	@GetMapping("/userDetail")
	public String userUpdate(Model model, HttpSession session) {
	     System.out.println("JkController userDetail start...");
	        String user_id = (String) session.getAttribute("user_id");

	        if (user_id != null) {
	            User1 user1 = jus.getUserDetails(user_id);
	            model.addAttribute("user1", user1);
	            return "jk/userUpdate";
	        } else {
	            // 사용자가 로그인하지 않은 경우 로그인 페이지로 리다이렉트
	            return "redirect:/loginForm";
	        }
	 }
	// 회원정보 수정
	 @PostMapping("/updateUser1")
	 public String updateUser(User1 user1, Model model) {
		 System.out.println("JkController updateUser start...");

	     int updateResult = jus.updateUser1(user1);
	     model.addAttribute("updateResult", updateResult);
	     if (updateResult > 0) {
	         return "forward:/jk/updateResult.jsp"; // 업데이트 성공 시의 뷰 페이지로 이동
	     } else {
	         model.addAttribute("msg", "수정 실패 확인해 보세요");
	         return "forward:/jk/mypage.jsp"; // 업데이트 실패 시의 뷰 페이지로 이동
	     }
	 }
	 
	
	@RequestMapping("/followManagement")
	public String challengeManagement() {
		System.out.println("JkController followManagement start...");
		
		return "jk/followManagement";
	}
	
	@RequestMapping("/sharingManagement")
	public String sharingManagement() {
		System.out.println("JkController sharingManagement start...");
		
		return "jk/sharingManagement";
	}
	
	@RequestMapping("/subscriptionManagement")
	public String subscriptionManagementManagement() {
		System.out.println("JkController subscriptionManagement start...");
		
		return "jk/subscriptionManagement";
	}
	
	@GetMapping("/mypage")
    public String mypage(HttpSession session, Model model) {
		System.out.println("JkController mypage start...");
        
		System.out.println("session.getAttribute(\"user_id\") --> " + session.getAttribute("user_id"));
		String user_id = (String) session.getAttribute("user_id");

	    if (user_id != null) {
	        
	        return "mypage";
	    } else {
	        
	        return "redirect:/loginForm";
        }
	}
}   
	
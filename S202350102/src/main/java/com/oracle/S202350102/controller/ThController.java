package com.oracle.S202350102.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S202350102.dto.User1;
import com.oracle.S202350102.service.thService.ThUser1Service;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ThController {
	// 태현 작업
	private final ThUser1Service us1;
	
	@PostMapping(value = "/writeUser1")
	public String writeUser1(User1 user1, Model model) {
		System.out.println("ThController writeUser1 start...");
		
		int insertResult = us1.insertUser1(user1);
		model.addAttribute("insertResult",insertResult);
		if(insertResult > 0 ) return "th/writeResult";
		else {
			model.addAttribute("msg", "입력 실패 확인해 보세요");
			return "signUp";
		}
	}
	
	@PostMapping(value = "/login")							// 로그인 유지를 위한 세션 필요
	public String login(@ModelAttribute User1 user1, HttpSession session, HttpServletRequest request) {
		System.out.println("ThController login start... ");
		User1 loginResult = us1.login(user1);
		System.out.println("ThController loginResult -- >" + loginResult);
		if (loginResult != null) {
			session = request.getSession();
			session.setAttribute("user_num", loginResult.getUser_num());
			
			System.out.println("session.getAttribute(\"user_id\") -->" + session.getAttribute("user_id"));
			System.out.println("session.getAttribute(\"status_md\") -->" + session.getAttribute("status_md"));
			System.out.println("session.getAttribute(\"user_num\") -->" + session.getAttribute("user_num"));
			return "home";
		} else {
			return "loginForm";
		}
	}
	
	
	@RequestMapping(value = "/logoutForm")
	public String logoutForm() {
		System.out.println("ThController logoutForm start...");
		
		return "th/logoutForm";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(User1 user1, HttpSession session) {
		System.out.println("ThController logout start... ");

		session.invalidate();
		return "home";
	}
	
	@GetMapping(value = "/deleteUser1Form")
	public String deleteUser1Form() {
		System.out.println("ThController deleteUser1Form Start...");
		return "th/deleteUser1Form";
	}
	
	@PostMapping(value = "/deleteUser1")
	public String deleteUser1(User1 user1, HttpSession session, Model model) {
		System.out.println("ThController deleteUser1 Start... ");
		int deleteUserCnt = us1.deleteUser(user1); // 회원상태 탈퇴여부 N에서 Y로 변경
		session.invalidate(); // 세션 끊어줌
		System.out.println("ThController deleteUserCnt result --> " + deleteUserCnt);
		if (deleteUserCnt > 0) {
			model.addAttribute("deleteUserCnt",deleteUserCnt);
			return "home";
		}
		else {
			model.addAttribute("deleteUserCnt",deleteUserCnt);
			return "th/deleteUser1Form";
		}
	}
	
	@GetMapping(value = "userSubMng")
	public String userSubMng() {
		return "th/userSubMng";
	}
}
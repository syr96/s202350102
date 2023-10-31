package com.oracle.S202350102.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S202350102.dto.User1;
import com.oracle.S202350102.service.thService.User1Service;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ThController {

	private final User1Service us1;
	
	@ResponseBody
	@PostMapping(value = "/writeUser1")
	public String writeUser1(User1 user1, Model model) {
		System.out.println("ThController writeUser1 start...");
		
		int insertResult = us1.insertUser1(user1);
		model.addAttribute("insertResult",insertResult);
		if(insertResult > 0 ) return "forward:th/writeResult";
		else {
			model.addAttribute("msg", "입력 실패 확인해 보세요");
			return "forward:signUp";
		}
	}
	
	@PostMapping("/login")							// 로그인 유지를 위한 세션 필요
	public String login(@ModelAttribute User1 user1, HttpSession session, HttpServletRequest request) {
		System.out.println("ThController login start... ");
		boolean loginResult = us1.login(user1);
		if (loginResult) {
			session = request.getSession();
			session.setAttribute("user_id", user1.getUser_id());
			System.out.println("session -->" + session);
			System.out.println("session.getAttribute(\"user_id\") -->" + session.getAttribute("user_id"));
			return "home";
		} else {
			return "login";
		}
	}
	
	
	@RequestMapping("/logoutForm")
	public String logoutForm() {
		System.out.println("ThController logoutForm start...");
		
		return "th/logoutForm";
	}
	
	@RequestMapping("/logout")
	public String logout(User1 user1, HttpSession session) {
		System.out.println("ThController logout start... ");

		session.invalidate();
		return "home";
	}
}
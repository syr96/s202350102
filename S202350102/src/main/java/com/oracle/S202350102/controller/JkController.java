package com.oracle.S202350102.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j

public class JkController {
	@RequestMapping(value="/mypage")
	public String writeFormCommunity(Integer user_num, Model model ) {
		System.out.println("JkController mypage Start... ");
		
		return "mypage";

}
	}
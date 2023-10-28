package com.oracle.S202350102.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {
	
	
	@RequestMapping(value ="index")
	public String index() {
		System.out.println("MainController index Start...");
		
		return "redirect:/index.html";
	}
	@RequestMapping(value ="listChallenge")
	public String listChallenge() {
		System.out.println("MainController listChallenge Start...");
		
		return "listChallenge";
	}
	@RequestMapping(value ="nearbySharing")
	public String nearbySharing() {
		System.out.println("MainController nearbySharing Start...");
		
		return "nearbySharing";
	}
	@RequestMapping(value ="Sharing")
	public String Sharing() {
		System.out.println("MainController Sharing Start...");
		
		return "Sharing";
	}
	@RequestMapping(value ="community")
	public String community() {
		System.out.println("MainController community Start...");
		
		return "community";
	}
	@RequestMapping(value ="notice")
	public String notice() {
		System.out.println("MainController notice Start...");
		
		return "notice";
	}
	@RequestMapping(value ="event")
	public String event() {
		System.out.println("MainController event Start...");
		
		return "event";
	}
	@RequestMapping(value ="introduce")
	public String introduce() {
		System.out.println("MainController introduce Start...");
		
		return "introduce";
	}
	@RequestMapping(value ="mypage")
	public String mypage() {
		System.out.println("MainController mypage Start...");
		
		return "mypage";
	}
	@RequestMapping(value ="master")
	public String master() {
		System.out.println("MainController master Start...");
		
		return "master";
	}
	@RequestMapping(value ="search")
	public String search() {
		System.out.println("MainController search Start...");
		
		return "search";
	}
	@RequestMapping(value ="challengeDetail")
	public String challengeDetail() {
		System.out.println("MainController challengeDetail Start...");
		
		return "challengeDetail";
	}
	@RequestMapping(value ="signUp")
	public String signUp() {
		System.out.println("MainController signUp Start...");
		
		return "signUp";
	}
	@RequestMapping(value ="chatBot")
	public String chatBot() {
		System.out.println("MainController chatBot Start...");
		
		return "chatBot";
	}
	@RequestMapping(value ="questionBoard")
	public String questionBoard() {
		System.out.println("MainController questionBoard Start...");
		
		return "questionBoard";
	}
	@RequestMapping(value ="personalQuestion")
	public String personalQuestion() {
		System.out.println("MainController personalQuestion Start...");
		
		return "personalQuestion";
	}
	@RequestMapping(value ="logIn")
	public String logIn() {
		System.out.println("MainController logIn Start...");
		
		return "logIn";
	}
}

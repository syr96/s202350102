package com.oracle.S202350102.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class YrController {
	// test
	
	
	@RequestMapping(value = "checkBoard")
	public String checkBoard() {
		System.out.println("YrController index Start...");
		return "yr/checkBoard";
	}
}
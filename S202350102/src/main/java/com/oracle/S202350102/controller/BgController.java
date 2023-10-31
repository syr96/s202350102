package com.oracle.S202350102.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.service.bgService.BkService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class BgController {
	
	// test
	
	private final BkService bs;

	@ResponseBody
	@RequestMapping(value = "certBoard")
	public Map<String, Object> certBoard(Board board, Model model) {
		System.out.println("BgController certBoard Start...");
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<Board> boardCert =null;
		
		try {
			boardCert = bs.boardCert(board);
			result.put("status", "OK");
			result.put("boardCert", boardCert);
		} catch (Exception e) {
			System.out.println("BgController certBoard e.getMessage() -> "+e.getMessage());
		}
		System.out.println("BgController boardCert.size() -> "+boardCert.size());
		
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "writeCertBoard")
	public Map<String, Object> writeCertBoard(@RequestParam("content") String content) {
		System.out.println("BgController writeCertBoard Start...");
		
		Map<String, Object> result = new HashMap<String, Object>();
		int insertresult = 0;
		
		try {
//			insertresult = bs.insertCertBoard(content);	// ing
			result.put("status", "OK");
		} catch (Exception e) {
			System.out.println("BgController writeCertBoard e.getMessage() -> "+e.getMessage());
		}
		
		return result;
	}
	
}

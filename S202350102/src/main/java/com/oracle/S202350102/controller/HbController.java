package com.oracle.S202350102.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.buf.UDecoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.User1;
import com.oracle.S202350102.service.hbService.QBoardService;
import com.oracle.S202350102.service.main.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class HbController {
	private final QBoardService qbs;
	private final UserService   us;
	
	@RequestMapping("qBoardList")
	public String callInfo(Board board, Model model, String currentPage, HttpSession session) {
		System.out.println("controller start..");
		
		List<Board> qBoardList = qbs.qBoardList(board);
		String user_id = (String) session.getAttribute("user_id");
		User1 user1 = us.userSelect(user_id);
		
		model.addAttribute("user1", user1);	
		model.addAttribute("qBoardList", qBoardList);
		
		return "hb/qBoardList";
	}
	
	@RequestMapping("qBoardDetail")
	public String qBoardDetail(int brd_num, Model model, HttpSession session) {
		System.out.println("qBoardDetail controller start..");
		int readCnt = qbs.readCnt(brd_num);
		Board board = qbs.qBoardSelect(brd_num);
		String user_id = (String) session.getAttribute("user_id");
		User1 user1 = us.userSelect(user_id);
		
		model.addAttribute("user1", user1);
		model.addAttribute("board", board);
		
		return "hb/qBoardDetail";
	}
	
	@RequestMapping("qBoardInsertForm")
	public String qBoardInsertForm() {
		
		
		return "hb/qBoardInsertForm";
	}
	
	@RequestMapping("qBoardWrite")
	public String qBoardInsert(Board board, Model model) {
		int result = qbs.qBoardInsert(board);
		
		model.addAttribute("result", result);
		// 유저정보필요
		
		return "forward:hb/qBoardList";
	}
	
	@RequestMapping("qBoardDelete")
	public String qBoardDelete(int brd_num, Model model) {
		int result = qbs.qBoardDelete(brd_num);
		
		model.addAttribute("result",result);
		return "forward:hb/qBoardDetail";
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("kakaoPay")
	public String kakaopay() {
		
		return "hb/kakaoPay";
	}
	
	
	
	/*
	 * 카카오페이 강한빛
	 */
	@RequestMapping("pay")
	@ResponseBody
	public String pay() {
		try {
			URL addr = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpsURLConnection conn = (HttpsURLConnection) addr.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 2c42c8e868ab3f876a7395c28b625556");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true);
			String parameter = "cid=TC0ONETIME&"
					+ "partner_order_id=partner_order_id"
					+ "&partner_user_id=partner_user_id"
					+ "&item_name=초코파이"
					+ "&quantity=1"
					+ "&total_amount=2200"
					+ "&vat_amount=200"
					+ "&tax_free_amount=0"
					+ "&approval_url=http://localhost/success"
					+ "&fail_url=http://localhost/fail"
					+ "&cancel_url=http://localhost/cancel";
			OutputStream outputStream = conn.getOutputStream();
			DataOutputStream dataOutputStream = new DataOutputStream(outputStream);
			dataOutputStream.writeBytes(parameter);
			dataOutputStream.close();
			
			int dataResult = conn.getResponseCode();
			InputStream inputStream;
			
			if(dataResult == 200) {
				inputStream = conn.getInputStream();
			} else {
				inputStream = conn.getErrorStream();
			}
			InputStreamReader reader = new InputStreamReader(inputStream);
			BufferedReader bufferedReader = new BufferedReader(reader);
			return bufferedReader.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
//		return "";
		return "{\"result\":\"NO\"}";
		
	}
	
	
	
}
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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.buf.UDecoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.User1;
import com.oracle.S202350102.service.hbService.QBoardService;
import com.oracle.S202350102.service.main.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import oracle.net.aso.l;

@Controller
@RequiredArgsConstructor
@Slf4j
public class HbController {
	private final QBoardService qbs;
	private final UserService   us;
	
	@RequestMapping("qBoardList")
	public String callInfo(Board board, Model model, String currentPage, HttpSession session) {
		System.out.println("controller qBoardList  start..");
		
		List<Board> qBoardList = qbs.qBoardList(board);
		
		int user_num = 0;
		if(session.getAttribute("user_num") != null) {
			user_num = (int) session.getAttribute("user_num");
		}
		System.out.println("controller qBoardList  qBoardList.size()->"+qBoardList.size());
		
		User1 user1 = us.userSelect(user_num);
		
		model.addAttribute("user1", user1);
		model.addAttribute("qBoardList", qBoardList);
		
		return "hb/qBoardList";
	}
	
	@RequestMapping("qBoardDetail")
	public String qBoardDetail(@RequestParam("brd_num") int brd_num, Model model, HttpSession session) {
		System.out.println("qBoardDetail controller start..");
		qbs.readCnt(brd_num);
		Board board = qbs.qBoardSelect(brd_num);
		
		int user_num = 0;
		if (session.getAttribute("user_num") != null) {
			user_num = (int) session.getAttribute("user_num");
		}
		
		User1 user1 = us.userSelect(user_num);
		
		model.addAttribute("user1", user1);
		model.addAttribute("board", board);
		
		return "hb/qBoardDetail";
	}
	
	@RequestMapping("qBoardUpdateForm")
	public String qBoardUpdateForm(@RequestParam("brd_num") int brd_num, Model model, HttpSession session) {
		System.out.println("qBoardUpdateForm contoller start...");
		
		int user_num = 0;
		if(session.getAttribute("user_num") != null) {
			user_num = (int) session.getAttribute("user_num");
			User1 user1 = us.userSelect(user_num);
			System.out.println("brd_num->"+brd_num);
			Board board = qbs.qBoardSelect(brd_num);
			if (user_num == board.getUser_num() || user1.getStatus_md() == 102) {
				System.out.println("board->"+board);
				model.addAttribute("board", board);
				return "hb/qBoardUpdate";
			}
			return "잘못된 접근";
		}
		return "잘못된 접근";
	}
	
	@RequestMapping("qBoardUpdate")
	public String qBoardUpdate(Board board, HttpServletRequest request) {
		System.out.println("qBoardUpdate contoller start...");
		int result = 0;
		result = qbs.qBoardUpdate(board);
		
		request.setAttribute("brd_num", board.getBrd_num());
		
		return "forward:qBoardDetail";
	}
	
	@RequestMapping("qBoardWriteForm")
	public String qBoardInsertForm(Model model, HttpSession session) {
		
		int user_num = 0;
		if (session.getAttribute("user_num") != null) {
			user_num = (int) session.getAttribute("user_num");
			
			User1 user1 = us.userSelect(user_num);
			model.addAttribute("user1", user1);
			return "hb/qBoardWrite";
		}
		return "잘못된접근";
	}
	
	@RequestMapping("qBoardWrite")
	public String qBoardInsert(Board board, Model model, HttpSession session, HttpServletRequest request) {	
		int user_num = 0;
		if (session.getAttribute("user_num") != null) {
			user_num = (int) session.getAttribute("user_num");
		}
		board.setUser_num(user_num);
		int result = qbs.qBoardInsert(board);
		User1 user1 = us.userSelect(user_num);
		board.setNick(user1.getNick());
		request.setAttribute("board", board);
		
		return "redirect:qBoardList";
	}
	
	@RequestMapping("qBoardDelete")
	public String qBoardDelete(int brd_num, Model model, HttpSession session, HttpServletRequest request) {
		int user_num = 0;
		if (session.getAttribute("user_num") != null) {
			user_num = (int) session.getAttribute("user_num");
		}
		int result = qbs.qBoardDelete(brd_num);
		model.addAttribute("result",result);
		return "forward:qBoardList";
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
package com.oracle.S202350102.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

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
			System.out.println("session.getAttribute(\"user_num\") -->" + session.getAttribute("user_num"));
			return "home2";
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
		return "home2";
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
	
	@GetMapping(value = "thkakaoPayForm")
	public String kakaoPayForm() {
		return "th/thkakaoPayForm";
	}
	
	// 카카오페이 구현(단발 성)
	@RequestMapping("thKakaoPay")
	@ResponseBody
	public String thKakaoPay() {
		System.out.println("ThController thKaKaoPay Start...");
		try {
			URL apiAddress = new URL("https://kapi.kakao.com/v1/payment/ready"); // 주소
			// httpURLConnection = 서버연결 : 요청하는 클라이언트와 카카오페이서버를 연결해주는 것이 HttpURLConnection
			HttpURLConnection httpURLConnection = (HttpURLConnection) apiAddress.openConnection();
			httpURLConnection.setRequestMethod("POST"); // POST메소드 사용(카카오에서 지정함) 
			// 카카오에서 인증받은 요청인지 확인하는 증명하는 메소드 					저장해놓은 어드민 키
			httpURLConnection.setRequestProperty("Authorization", "KakaoAK ae879700f909ee8b00f9eab914f15730");
			// 컨텐츠 타입
			httpURLConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			// 서버에 넣어야 할 것이 있다 하면 해당메소드사용(true) / 서버로부터 받을것이 있다는 Connection 생성시 갖는  default라 따로 설정할 필요 없음
			httpURLConnection.setDoOutput(true);
			String parameter = 	"cid=TC0ONETIME&"
							+ 	"partner_order_id=partner_order_id"
							+   "&partner_user_id=partner_user_id"
							+ 	"&item_name=초코파이"
							+ 	"&quantity=1"
							+ 	"&total_amount=2200"
							+ 	"&vat_amount=200"
							+ 	"&tax_free_amount=0"
							+ 	"&approval_url=http://localhost:8222/success"
							+ 	"&fail_url=http://localhost:8222/fail"
							+ 	"&cancel_url=http://localhost:8222/cancel";
			// 파라미터를 전송하는 객체(주는애)  = 서버연결로부터 OutputStream을 받음
			OutputStream outputStream = httpURLConnection.getOutputStream();
			// 데이터 주는 객체(데이터주는애)
			DataOutputStream dataOutputStream = new DataOutputStream(outputStream);
			dataOutputStream.writeBytes(parameter);
			dataOutputStream.close();
			
			int result = httpURLConnection.getResponseCode();
			
			// 데이터 받는 객체(데이터받는애)
			InputStream inputStream;
			
			if(result == 200) {
				// 성공시 데이터받음 
				inputStream = httpURLConnection.getInputStream();
			} else {
				// 실패시 에러데이터 받음
				inputStream = httpURLConnection.getErrorStream();
			}
			// 읽는애(받은값:inputStream 을 읽음)
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
			// 형변환 하는애(형변환을 위해 존재하는 클래스는아니지만 형변환 용으로 사용)
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
			// 값을 찍어내면서 본인 값은 비워지게 된다함
			return bufferedReader.readLine();
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "{\"result\":\"No\"}";
	}
	
	
	@GetMapping("success")
	public String kakaoSuccess() {
		return "th/kakaoSuccess";
	}
	@GetMapping("cancel")
	public String kakaoCancel() {
		return "th/thkakaoPayForm";
	}
}
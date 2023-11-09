package com.oracle.S202350102.controller;

import java.util.List;

//import java.io.BufferedReader;
//import java.io.DataOutputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.InputStreamReader;
//import java.io.OutputStream;
//import java.net.HttpURLConnection;
//import java.net.MalformedURLException;
//import java.net.URL;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//import com.oracle.S202350102.dto.KakaoPayApprovalVO;
import com.oracle.S202350102.dto.User1;
import com.oracle.S202350102.service.thService.ThKakaoPay;
//import com.oracle.S202350102.service.thService.ThKakaoPayImpl;
import com.oracle.S202350102.service.thService.ThOrder1Service;
import com.oracle.S202350102.service.thService.ThUser1Service;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@Data
public class ThController {
	// 태현 작업
	private final ThUser1Service us1;
	private final ThKakaoPay thKakaoPay;
	private final ThOrder1Service os1;
	
	@PostMapping(value = "/writeUser1")
	public String writeUser1(User1 user1, Model model, @RequestParam("addr_detail") String addr_detail) {
		System.out.println("ThController writeUser1 start...");
		// 기존 주소에 상세 주소를 추가( 주소받는게 API에 2개로 나뉘어 있음)
		String sumAddr	= user1.getAddr() + " " + addr_detail;
		user1.setAddr(sumAddr);
		
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
	
	@RequestMapping(value = "/loginForm2")
	public String loginForm2() {
		System.out.println("ThController loginForm2 start...");
		
		return "th/loginForm2";
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
	
	@RequestMapping(value = "thKakaoPayForm")
	public String thKakaoPayForm(HttpSession session, Model model) {
		if(session.getAttribute("user_num") == null) {
			return "loginForm";
		} 
		return "th/thKakaoPayForm";
	}
	
	@GetMapping("/thKakaoPay")
	public void thKakaoPayGet() {
		
	}
	
	@PostMapping("/thKakaoPay")
	public String thKakaoPay() {
		System.out.println("ThController thKakaoPay Start...");
		return "redirect:" + thKakaoPay.kakaoPayReady();
	}
	
// 왜 GetMaping만 되지??
    @GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, HttpSession session) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        System.out.println("kakaoPaySuccess session.getAttribute(\"user_num\") --> " + session.getAttribute("user_num"));
        
        
        // 세션에서 유저 번호 받아옴
    	int user_num = 0;
		if(session.getAttribute("user_num") != null) {
			user_num = (int) session.getAttribute("user_num");
			System.out.println("ThController user_num --> " + user_num);
		} 
		// 결제성공시 회원상태 구독회원으로 변경
        int updateCount = us1.updateUserPrem(user_num);
        log.info("kakaoPaySuccess updateCount : " + updateCount);
       
        Object kakaoSucInfo = thKakaoPay.kakaoPayInfo(pg_token);

        // 주문정보(order1)테이블에 값 넣기
        int insertResult = os1.insertOrder1(user_num, kakaoSucInfo);
        log.info("kakaoPaySuccess insertResult : " + insertResult);
        
        
        
        model.addAttribute("info", kakaoSucInfo);
        return "th/kakaoPaySuccess";
    }
	
    @PostMapping("/kakaoPayCancel")
    public String kakaoPayCancel() {
    	
    	return "home2";
    }

    // 아작스 아이디 중복체크할때쓰는데, 왜 Getmapping일까? id가져가는데 postMapping이어야 하지않나? (getmapping하면 안됨)
    // 중복확인 버튼클릭으로 넘어갈때는 Postmapping만 가능
    @ResponseBody
    @GetMapping(value = "/user1IdCheck")
    public int user1IdCheck(String user_id) {
    	System.out.println("ThController user1IdCheck Start...");
    	System.out.println("ThController user_id --> " + user_id);
    	int result = us1.user1IdCheck(user_id);
    	System.out.println("ThController user1IdCheck result --> " + result);
    	return result;
    }

    // 닉네임 중복 체크
    @ResponseBody
    @GetMapping(value = "user1NickCheck")
    public int user1NickCheck(String nick) {
    	System.out.println("ThController user1NickCheck Start...");
    	System.out.println("ThController nick --> " + nick);
    	int result = us1.user1NickCheck(nick);
    	System.out.println("ThController user1NickCheck result --> " + result);
    	return result;
    }
	
    @RequestMapping(value = "/findIdForm")
    public String findIdForm(User1 user1 ) {
    	System.out.println("ThController findId Start...");
    	return "th/findIdForm";
    }
    
    @ResponseBody
    @RequestMapping(value = "/findId")
    public List<User1> findId(User1 user1 ) {
    	System.out.println("ThController findId Start...");
    	List<User1> user_id_List = us1.findId(user1);
    	System.out.println("ThController user_id_List --> " + user_id_List);
    	return user_id_List;
    }
}
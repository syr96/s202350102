package com.oracle.S202350102.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//import com.oracle.S202350102.dto.KakaoPayApprovalVO;
import com.oracle.S202350102.dto.User1;
import com.oracle.S202350102.service.main.Level1Service;
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
	private final JavaMailSender mailSender;
	private final Level1Service ls;
	
	@PostMapping(value = "/writeUser1")
	public String writeUser1(User1 user1, Model model, @RequestParam("addr_detail") String addr_detail,
													   @RequestParam("birth_year")  String birth_year,
													   @RequestParam("birth_month") String birth_month,
													   @RequestParam("birth_date")  String birth_date) 
													   {
		System.out.println("ThController writeUser1 start...");
		// 기존 주소에 상세 주소를 추가( 주소받는게 API에 2개로 나뉘어 있음)
		String sumAddr	= user1.getAddr() + " " + addr_detail;
		user1.setAddr(sumAddr);
		
		// 생년월일 년+/+월+/+일 
		String sumBirth = birth_year+ "/" + birth_month + "/" + birth_date;
		
		// 년월일 문자열을 Date타입으로 형변환
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		Date strToDate = null;
		try {
			strToDate = formatter.parse(sumBirth);
			System.out.println("strToDate --> " + strToDate);
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}

		// 형변환한 생년월일을 user1에 담음
		user1.setBirth(strToDate);
		
		
		int insertResult = us1.insertUser1(user1);
		model.addAttribute("insertResult",insertResult);
		if(insertResult > 0 ) return "th/writeResult";
		else {
			model.addAttribute("msg", "입력 실패 확인해 보세요");
			return "signUp";
		}
	}
	
	@PostMapping(value = "/login")							// 로그인 유지를 위한 세션 필요
	public String login(@ModelAttribute User1 user1, HttpSession session, HttpServletRequest request, Model model) {
		System.out.println("ThController login start... ");
		User1 loginResult = us1.login(user1);
		System.out.println("ThController loginResult -->" + loginResult);
		// 회원정보가 존재 하는경우
		if (loginResult != null) {
			// 탈퇴처리가 되지 않은 회원의경우 세션처리
			if(loginResult.getDelete_yn().equals("N")) {
				session = request.getSession();
				session.setAttribute("user_num", loginResult.getUser_num());
		         int user_num = (int) session.getAttribute("user_num");
		         ls.userLevelCheck(user_num);
				System.out.println("session.getAttribute(\"user_num\") -->" + session.getAttribute("user_num"));
				return "home2";
			// 탈퇴처리된 아이디 인경우		
			} else {
				model.addAttribute("result","delId");
				return "loginForm";
			}
			
		// 회원정보가 없는경우(아이디 비밀번호 틀린경우)
		} else {
			// chk에 1값을 주고 JS통해서 chk값에 따라 다른 alert창 만듬 
			model.addAttribute("result","wrongValue");
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
	public String deleteUser1Form(HttpSession session) {
		System.out.println("ThController deleteUser1Form Start...");
		return "th/deleteUser1Form";
	}
	
	@PostMapping(value = "/deleteUser1")
	public String deleteUser1(User1 user1, HttpSession session, Model model) {
		System.out.println("ThController deleteUser1 Start... ");
		int deleteUserCnt = us1.deleteUser(user1); // 회원상태 탈퇴여부 N에서 Y로 변경
		System.out.println("ThController deleteUserCnt result --> " + deleteUserCnt);
		if (deleteUserCnt > 0) {
			model.addAttribute("deleteUserCnt",deleteUserCnt);
			session.invalidate(); // 세션 끊어줌
			return "th/user1DelAlert";
		}
		else {
			model.addAttribute("deleteUserCnt",deleteUserCnt);
			return "th/user1DelAlert";
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
    
    @ResponseBody
    @RequestMapping(value = "/findId")
    public List<User1> findId(User1 user1, Model model) {
    	System.out.println("ThController findId Start...");
    	List<User1> user_id_List = us1.findId(user1);
    	System.out.println("ThController user_id_List --> " + user_id_List);
    	
    	model.addAttribute("user_id_List" , user_id_List);
    	
    	return user_id_List;
    }
    
    
    @RequestMapping(value = "/sendMailForResetPswd")
    public String sendMailForResetPswd(HttpServletRequest request, Model model, User1 user1) {
		System.out.println("ThController sendMailForResetPswd mailSending Start..");
		
		//1.아이디와 이메일이 일치하는 유저 조회
		User1 findUser1 = us1.findUser1ByIdAndEmail(user1);
		System.out.println("ThController sendMailForResetPswd findUser1 --> " + findUser1);
		
		if(findUser1 == null) {
			model.addAttribute("check", 2);
			return "th/thMailResult";
		}
		
		//2.임시 비밀번호 생성(rndPswd: 랜덤패스워드)
		String rndPswd = us1.crRndPswd();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", findUser1.getUser_id());
		map.put("rndPswd", rndPswd);
		
		//3.비밀번호를 임시비밀번호로 변경
		int updateResult = us1.user1PswdUpdate(map);
		System.out.println("ThController sendMailForResetPswd updateResult --> " + updateResult);
		
		//4. 메일 발송
		String tomail = findUser1.getEmail();		// 받는사람
		System.out.println(tomail);
		String setfrom = "teamssj02@gmail.com";	// 보내는 사람
		String title =   "안녕하세요 Ssj 입니다 요청하신 임시 비밀번호입니다"; // 제목
		
		
		try {
			// Mime 전자우편 Internet 표준 Format
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom);		// 보내는 사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail);		// 받는사람 이메일
			messageHelper.setSubject(title);	// 메일 제목은 생략은 가능하지만(보내기는 가능) 받는쪽에서 스팸메일인줄알고 거르는경우가 많기때문에 생략하지 않는게 좋다.
			String tempPassword = rndPswd;
			messageHelper.setText("임시 비밀번호입니다: " + tempPassword); // 메일 내용
			System.out.println("임시 비밀번호입니다: " + tempPassword);
			mailSender.send(message);
			model.addAttribute("check", 1); // 정상전달
			// DB Logic 구성
		} catch (Exception e) {
			System.out.println("mailTransport e.getMessage() -->" + e.getMessage());
			model.addAttribute("check", 3); // 메일 전달 실패
		}
				
		return "th/thMailResult";
		
	}
}
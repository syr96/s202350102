package com.oracle.S202350102.controller;




import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.User1;
import com.oracle.S202350102.service.jkService.JkBoardService;
import com.oracle.S202350102.service.jkService.JkUserService;
import com.oracle.S202350102.service.yaService.YaCommunityService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class JkController {
	private static final Logger logger = LoggerFactory.getLogger(JkController.class);
	private final JkUserService jus;
	private final JkBoardService jbs;
	private final YaCommunityService ycs;
	
	
	//좋아요 기능 컨트롤러
	//좋아요 상태 가져오는 메소드
	@GetMapping("/board/{brd_num}/like")
	public ResponseEntity<String> getLikeStatus(@PathVariable int brd_num) {
		System.out.println("JkController getlikestatus start...");
	   
	    return new ResponseEntity<>("Like status of Board with brd_num " + brd_num, HttpStatus.OK);
	}

	@PostMapping("/board/{brd_num}/like")
	public ResponseEntity<String> updateLikeStatus(@PathVariable int brd_num) {
		System.out.println("JkController updateLikeStatus start..." + brd_num);
		
		jbs.updateLikeStatus(brd_num);
	    return new ResponseEntity<>("Updated like status of Board with brd_num " + brd_num, HttpStatus.OK);
	}

	//쉐어링 게시글 유저 정보조회
	@RequestMapping(value="/sharingUserDetail")
	public String sharingUserDetail(Board board, Model model, HttpSession session) {
		System.out.println("JkController sharingUserDetail start...");
		List<Board> sharing = jbs.sharing(board);
		System.out.println("JkController list Sharing.size()?"+sharing.size());
		
		int user_num = 0;
		if(session.getAttribute("user_num") != null) {
			user_num = (int) session.getAttribute("user_num");
		}
		else {
			model.addAttribute("msg", "로그인한 사용자만 이용할 수 있는 페이지입니다.");
			return "/loginForm";
		}
		User1 user1 = jbs.userSelect(user_num);
		
		model.addAttribute("user1", user1);
		model.addAttribute("Sharing", sharing);
		
		return "jk/writeFormSharing";
		}
	
	
	//쉐어링 게시글 전체조회
	@RequestMapping(value="/sharing")
	public String Sharing(Board board, Model model, HttpSession session) {
		System.out.println("JkController Sharing start...");
		List<Board> sharing = jbs.sharing(board);
		System.out.println("JkController list Sharing.size()?"+sharing.size());
		
		int user_num = 0;
		if(session.getAttribute("user_num") != null) {
			user_num = (int) session.getAttribute("user_num");
		}
		
		User1 user1 = jbs.userSelect(user_num);
		
		model.addAttribute("user1", user1);
		model.addAttribute("sharing", sharing);
		
		return "sharing";
		}
	
	//쉐어링 조회 필터
	@GetMapping("/loadSortedPosts")
	@ResponseBody
	public List<Board> loadSortedPosts(Board board, HttpServletRequest request) {
		logger.info("JkController /loadSortedPosts start....");
		
		System.out.println("JkController jbs.loadSortedPosts start....");
	    String sortOption = request.getParameter("sort");
	    logger.info("JSON Data: {}", sortOption);
	    List<Board> loadSortedPosts = jbs.loadSortedPosts(sortOption);
	    logger.info("Returned Data: {}", loadSortedPosts);
	    return loadSortedPosts;
	  	}
	
	
	//쉐어링 게시글 상세조회
	@GetMapping(value="/detailSharing")
	public String detailSharing(int brd_num, Model model, HttpSession session) {
		System.out.println("JkController detailSharing Start...");
		System.out.println("brd_num->"+brd_num);
		
		int user_num = 0;
		if(session.getAttribute("user_num") != null) {
			user_num = (int) session.getAttribute("user_num");
		}
		
		Board board = jbs.detailSharing(brd_num);
		
		int upViewCnt = 0;
		ycs.upViewCnt(brd_num);
			
		model.addAttribute("board", board);
		model.addAttribute("upbiewCnt", upViewCnt);
		model.addAttribute("loggedIn", user_num!=0);
	
	    System.out.println("sessionScope.usernum: " + session.getAttribute("user_num"));
	
		return"jk/detailSharing";
				
	}
	
	// 쉐어링 내가 쓴 글
		@RequestMapping("/mySharing")
		public String mySharing(Board board, Model model, HttpSession session) {
			System.out.println("JkController mySharing start...");
			
			int user_num = 0;
			if(session.getAttribute("user_num") != null) {
				user_num = (int) session.getAttribute("user_num");
			}
			else {
				model.addAttribute("msg", "로그인한 사용자만 이용할 수 있는 페이지입니다.");
				return "redirect:/loginForm";
			}
			
			List<Board> mySharing = jbs.sharing(board);
			System.out.println("JkController list mySharing.size()?" + mySharing.size());
			
		
			User1 user1 = jbs.userSelect(user_num);
			System.out.println("usernum"+user_num);
			model.addAttribute("user1", user1);
			model.addAttribute("mySharing", mySharing);
			
				return "jk/mySharing";
			}
		
	//쉐어링 내가 쓴 글 상세
	@GetMapping(value="/myDetailSharing")
	public String myDetailSharing(int brd_num, Model model, HttpSession session) {
		System.out.println("JkController detailSharing Start...");
		System.out.println("brd_num->"+brd_num);
		
		int user_num = 0;
		if(session.getAttribute("user_num") != null) {
			user_num = (int) session.getAttribute("user_num");
		}
		
		Board board = jbs.detailSharing(brd_num);
		
		int upViewCnt = 0;
		ycs.upViewCnt(brd_num);
			
		model.addAttribute("board", board);
		model.addAttribute("upbiewCnt", upViewCnt);
		model.addAttribute("loggedIn", user_num!=0);
		
		System.out.println("nick: " + board.getNick());
	    System.out.println("userName:"+board.getUser_name());
	    System.out.println("user_num:"+board.getUser_num());
	    System.out.println("user_id:"+board.getUser_id());
	    System.out.println("sessionScope.usernum: " + session.getAttribute("user_num"));
	
		return"jk/myDetailSharing";
					
		}
		
		//쉐어링 수정(읽기)
		@GetMapping(value="/updateSharing1")
		public String updateSharing1(int brd_num, Model model, HttpSession session) {
			System.out.println("JkController updateSharing1 start...");
			
			int user_num = 0;
			if(session.getAttribute("user_num") != null) {
				user_num = (int) session.getAttribute("user_num");
			}
					
			Board board = jbs.detailSharing(brd_num);
			model.addAttribute("board", board);
			
			User1 user1 = jbs.userSelect(user_num);
			model.addAttribute("user1", user1);
						
			return"jk/updateFormSharing";
			
		}
	
	//쉐어링 수정(쓰기)
		@PostMapping("/updateSharing2")
		public String updateSharing2(Board board, HttpServletRequest request, @RequestParam(value = "file1", required = false) MultipartFile file1) throws IOException {
		    System.out.println("JkController updateSharing2 start...");
		    int result = 0;
			ServletContext servletContext = request.getSession().getServletContext();
			String realPath = servletContext.getRealPath("/upload/");
			System.out.println("realPath->" + realPath);
			
			if(file1 != null) {
				String saveName = uploadFile(file1.getOriginalFilename(), file1.getBytes(), realPath);  // 진짜 저장
				
				board.setImg(saveName);	
			}
			
			
			result = jbs.updateSharing(board);
		
			request.setAttribute("brd_md", board.getBrd_md());
			return "forward:mySharing";
		}

		
	//쉐어링 삭제
		@GetMapping(value = "deleteSharing")
		public String deleteSharing(int brd_num, Model model) {
		    System.out.println("JkController deleteSharing start...");
		    
		    int deleteResult = jbs.deleteSharing(brd_num);
		    model.addAttribute("deleteResult", deleteResult);
		    

		    return "forward:mySharing";
		}
	
	//상세 페이지 댓글  조회
	@RequestMapping(value="/listCommentSharing", method=RequestMethod.GET)
	@ResponseBody
	public List<Board> listCommentSharing(@RequestParam("brd_num") int brd_num,  Model model, Board board) {
		System.out.println("JkController jbs.listCommentSharing start....");

		
		List<Board> listCommentSharing = jbs.listCommentSharing(brd_num);
		model.addAttribute(" listCommenty",  listCommentSharing);
		board.setBrd_group(brd_num);
		
		System.out.println("YaController listComment size?" + listCommentSharing.size());
		System.out.println("YaController listComment brd_group?"+board.getBrd_group());
		return listCommentSharing; 
	}


	// 쉐어링 댓글 작성
	@RequestMapping("/commentSharing")
	@ResponseBody
	public Map<String, String> commentSharing(HttpSession session, HttpServletRequest request, @ModelAttribute Board board) {
	    Map<String, String> response = new HashMap<>();

	    try {
	        System.out.println("JkController jbs.commentSharing start....");

	        int user_num = 0;
	        if (session.getAttribute("user_num") != null) {
	            user_num = (int) session.getAttribute("user_num");
	            board.setUser_num(user_num);
	            
	            int brd_num =Integer.parseInt(request.getParameter("brd_num")); 
	            
	            board.setBrd_group(brd_num);
	            board.setBrd_lg(700);
			    
			   try {
				    int brd_group = board.getBrd_num();
					int latestBrdStep = ycs.getLatestBrdStep(brd_group);
				    board.setBrd_step(latestBrdStep + 1);
			   
			   } catch (NumberFormatException e) {
			        e.printStackTrace();
			   
			        response.put("result", "failure");
			        response.put("error", "Invalid brd_num format");
			    }		
		            jbs.commentSharing(board);
 
		            response.put("result", "success");
		            response.put("redirectUrl", "/ya/commentForm?brd_num=" + board.getBrd_num());
		        } else {
		            
		            response.put("result", "failure");
		            response.put("error", "User not logged in");
		        	}	
	    		} catch (Exception e) {
			        e.printStackTrace();
			        
			        response.put("result", "failure");
			        response.put("error", "An error occurred");
			    }

			    return response;
	}	
	
	// 쉐어링 댓글 수정
	@PostMapping(value="/commentUpdateSharing")
	@ResponseBody
	public Map<String, Object> commentUpdateSharing(HttpSession session,
		      @RequestParam("brd_num") int brd_num, @RequestParam("conts") String conts, @ModelAttribute Board board) {
	    Map<String, Object> map = new HashMap<String, Object>();
	    try {
	        System.out.println("JkController jbs.commentUpdateSharing start...");

	        int user_num = 0;
	        if (session.getAttribute("user_num") != null) {
	            user_num = (int) session.getAttribute("user_num");
	            
	            board.setUser_num(user_num);
	            board.setBrd_num(brd_num);
	            board.setConts(conts);
	     
	            jbs.commentUpdateSharing(board);

	            // 댓글 정보 확인
	            System.out.println("session.getAttributeuser_num?"+session.getAttribute("user_num"));
	            System.out.println("board 댓글 수정후 conts?" + board.getConts());

	       
	            map.put("result", "success");
	            
	        } else {
	            
	            map.put("result", "failure");
	            map.put("error", "User not logged in");
	        }
	    } catch (Exception e) {
	        System.out.println("JkController commentUpdateSharing e.getMessage()"+e.getMessage());
	       
	        map.put("result", "failure");
	        map.put("error", "An error occurred");
	    }

	    return map;
	}
	
	// 쉐어링 댓글 삭제

	@PostMapping(value="/commentDeleteSharing")
	@ResponseBody
	public Map<String, Object> commentDeleteSharing(HttpSession session,
			@RequestParam("brd_num") int brd_num,  @ModelAttribute Board board){
		
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			System.out.println("JkController jbs.commentDeleteSharing start...");
			
			int user_num = 0;
			if(session.getAttribute("user_num")!=null) {
				 user_num = (int) session.getAttribute("user_num");				 
				 board.setUser_num(user_num);
				 
				 jbs.commentDeleteSharing(board);
			}
			
		} catch (Exception e) {
			 System.out.println("JkController commentDeleteSharing e.getMessage()"+e.getMessage());
		}

		
		return map;
		
	}	
		
	@PostMapping("/writeShare")
	public String writeShare(Board board, HttpServletRequest request,@RequestParam(value = "file", required = false) MultipartFile file1) throws IOException {
		System.out.println("JkController writeShaire start..");
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");  // 저장경로 생성
		System.out.println("realPath" + uploadPath);
		log.info("originalName : " + file1.getOriginalFilename());
		
		String saveName = uploadFile(file1.getOriginalFilename(), file1.getBytes(), uploadPath);  // 진짜 저장
		board.setImg(saveName);
		System.out.println("brd_md->"+ board.getBrd_md());
		int result = jbs.writeFormSharing(board);
		System.out.println("Insert result->" + result);	
		
		return "forward:mySharing";		
		
	}
	
	
	private String uploadFile(String originalName, byte[] fileData, String uploadPath) throws IOException {
		UUID uid = UUID.randomUUID();
		System.out.println("uploadPath->" + uploadPath);
		File fileDirectory = new File(uploadPath);  
		if (!fileDirectory.exists()) {
			fileDirectory.mkdirs(); 
			System.out.println("시스템 업로드용 폴더 생성 :" + uploadPath);	
		}
		
		String savedName = uid.toString() + "_" + originalName;
		log.info("saveName : " + savedName); 
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target); 
		
		return savedName;
	}

	@RequestMapping(value="/challengeManagement")
	public String challengeManagement(Integer user_num, Model model ) {
		System.out.println("JkController challengeManagement Start... ");
		
		return "jk/challengeManagement";	
	}
	
	// 회원정보 조회
	@GetMapping("/userDetail")
	public String userUpdate(Model model, HttpSession session) {
	    System.out.println("JkController userDetail start...");

	    int user_num = 0;
	    if (session.getAttribute("user_num") != null) {
	        user_num = (int) session.getAttribute("user_num");
	    }

	    if (user_num != 0) {
	        User1 user1 = jbs.userSelect(user_num);
	        model.addAttribute("user1", user1);
	        return "jk/userUpdate";
	    } else {
	        return "redirect:/loginForm";
	    }
	}

	// 회원정보 수정
	 @PostMapping("/updateUser1")
	 public String updateUser(User1 user1, Model model) {
		 System.out.println("JkController updateUser start...");

	     int updateResult = jus.updateUser1(user1);
	     model.addAttribute("updateResult", updateResult);
	     if (updateResult > 0) {
	         return "forward:/jk/updateResult.jsp"; // 업데이트 성공 시의 뷰 페이지로 이동
	     } else {
	         model.addAttribute("msg", "수정 실패 확인해 보세요");
	         return "forward:/jk/mypage.jsp"; // 업데이트 실패 시의 뷰 페이지로 이동
	     }
	 }
	
	
	
	@RequestMapping("/followManagement")
	public String challengeManagement() {
		System.out.println("JkController followManagement start...");
		
		return "jk/followManagement";
	}
	
	@RequestMapping("/sharingManagement")
	public String sharingManagement() {
		System.out.println("JkController sharingManagement start...");
		
		return "jk/sharingManagement";
	}
	
	@RequestMapping("/subscriptionManagement")
	public String subscriptionManagementManagement() {
		System.out.println("JkController subscriptionManagement start...");
		
		return "jk/subscriptionManagement";
	}
	
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
	    System.out.println("JkController mypage start...");

	    System.out.println("session.getAttribute(\"user_num\") --> " + session.getAttribute("user_num"));
	    int user_num = 0;
	    if (session.getAttribute("user_num") != null) {
	        user_num = (int) session.getAttribute("user_num");
	    }

	    return user_num != 0 ? "mypage" : "redirect:/loginForm";
	}

	
}   
	
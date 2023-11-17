package com.oracle.S202350102.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.net.http.HttpHeaders;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.mail.Session;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.springframework.beans.propertyeditors.URLEditor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S202350102.service.hbService.Paging;
import com.oracle.S202350102.service.jkService.JkBoardService;
import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.SharingList;
import com.oracle.S202350102.dto.User1;
import com.oracle.S202350102.service.yaService.YaCommunityService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class YaController {
	
	private final YaCommunityService ycs;
	private final JkBoardService jbs;
	
	//커뮤니티 게시글 전체조회
	@RequestMapping(value="/listCommunity")
	public String listCommunity(Board board, Model model,String currentPage ) {
		System.out.println("YaController listCommunity start....");
		
		//전체 게시글 총 수 
		int totalCommunity = ycs.totalCommunity(board);
		model.addAttribute("totalCommunity", totalCommunity);		
		System.out.println("YaContorller totalCommunity->"+totalCommunity);
		
		//페이징처리
		Paging boardPage = new Paging(totalCommunity, currentPage);
		board.setStart(boardPage.getStart());
	    board.setEnd(boardPage.getEnd());
	    model.addAttribute("boardPage", boardPage);
		System.out.println(" YaController boardPage start?"+boardPage.getStart());
		System.out.println(" YaControlloer boardpage total?"+boardPage.getTotal());
		System.out.println("boardPage End?"+boardPage.getEnd());
		
		List<Board> listCommunity = ycs.listCommunity(board);
		System.out.println("YaController list listCommunity.size()?"+listCommunity.size());
		model.addAttribute("listCommunity", listCommunity);
		
		


		return "listCommunity";
	}
	
	
	
	//게시글 제목을 누르면 자세히 보기 
	@GetMapping(value="detailCommunity")
	public String detailCommunity(@RequestParam("brd_num")int brd_num, Model model, HttpSession session) {
		System.out.println("YaController Start detailCommunity start...");
		
		Board board = ycs.detailCommunity(brd_num);
		// 게시글 댓글수 후가시 
		int replyCount = ycs.commentCount(brd_num);
		
		board.setReplyCount(replyCount);
		board.setBrd_group(board.getBrd_num());
		
		//로그인 상태 확인 
		int user_num = 0;
		if(session.getAttribute("user_num") != null) {
			user_num = (int) session.getAttribute("user_num");
		}
		
		//조회수 증가
		int upViewCnt = 0;
		ycs.upViewCnt(brd_num);
		
		
		System.out.println("YaController  commentCount replyCount?"+ replyCount);
		
	
		
		model.addAttribute("board", board);
		model.addAttribute("upViewCnt", upViewCnt);	
		model.addAttribute("replyCount", replyCount);
		model.addAttribute("loggedIn", user_num!= 0);
		
		System.out.println("replyCount:" +board.getReplyCount());
	    System.out.println("nick: " + board.getNick());
	    System.out.println("userName:"+board.getUser_name());
	    System.out.println("user_num:"+board.getUser_num());
	    System.out.println("user_id:"+board.getUser_id());
	    System.out.println("board_brd_step:"+board.getBrd_step());
	    System.out.println("board_Brd_group:"+board.getBrd_group());
	    System.out.println("sessionScope.usernum: " + session.getAttribute("user_num"));
	
		return"ya/detailCommunity";
	}
	
	// 커뮤니티 게시글 작성폼으로 이동 (************************************진기)
	@RequestMapping(value="/writeFormCommunity")
	public String writeFormCommunity(Board board, HttpSession session, Model model ) {
		System.out.println("YaController writeFormCommunity Start... ");
	
		int user_num=0;
		if(session.getAttribute("user_num") != null) {
			user_num = (int) session.getAttribute("user_num");
			
			User1 user1 = ycs.userSelect(user_num);
			model.addAttribute("user1", user1);				
					
		} 		   
			return "ya/writeFormCommunity"; 
				
		}

	 // 게시글 작성 ((************************************진기)
		@PostMapping(value="/writeCommunity") 
		public String insertCommunity(Board board, HttpServletRequest request, HttpSession session, @RequestParam(value = "file", required = false) MultipartFile file1) throws IOException {
				System.out.println("YaController start insertCommunity... "); 
				
				int user_num = 0;
				if (session.getAttribute("user_num") != null) {
					user_num = (int) session.getAttribute("user_num");
				}
				board.setUser_num(user_num);
				/*
				// 게시글 작성 (본글 설정)
				board.setBrd_group(board.getBrd_num());
				board.setBrd_step(0);
				board.setBrd_lg(700);
				
				int insertResult = ycs.insertCommunity(board);
				board.setUser_num(user_num);
				
				System.out.println("board brd_lg :"+board.getBrd_lg());
				System.out.println("boardbrd_md :"+board.getBrd_md());
				
				if (insertResult >0) 
					return "redirect:listCommunity";			
					else {
						 model.addAttribute("msg", "작성 실패, 확인해보세요");
					 }
				return "forward:writeCommunity";
			 }*/
				String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");  // 저장경로 생성
				System.out.println("realPath" + uploadPath);
				log.info("originalName : " + file1.getOriginalFilename());
				
				String saveName = uploadFile(file1.getOriginalFilename(), file1.getBytes(), uploadPath);  // 진짜 저장
				board.setImg(saveName);
				System.out.println("brd_md->"+ board.getBrd_md());
				int result = ycs.insertCommunity(board);
				System.out.println("Insert result->" + result);	
				
				return "forward:listCommunity";		
				
			}
			
			
		// 파일 업로드 (************************************진기)
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
		
		// 게시글 수정폼이동 
		@GetMapping(value="/updateCommunityForm")
		public String updateCommunity(int brd_num, Model model, HttpSession session) {
			System.out.println("YaController updaetCommunityForm start...");
			
			int user_num = 0;
			if(session.getAttribute("user_num") != null) {
				user_num = (int) session.getAttribute("user_num");
			}
			
			Board board = ycs.detailCommunity(brd_num);
			model.addAttribute("board", board);
			
			User1 user1 = jbs.userSelect(user_num);
			model.addAttribute("user1", user1);
			
			
			// 수정전
			System.out.println("title :"+board.getTitle());
			System.out.println("conts :"+board.getConts());
			
			model.addAttribute("board", board);
			
			return "ya/updateCommunityForm";
		}
		
		
		// 게시글 수정 (진기)
		@PostMapping(value="/updateCommunity")
		public String updateCommunity(HttpSession session, User1 user1, Model model, Board board, HttpServletRequest request, @RequestParam(value = "file1", required = false) MultipartFile file1) throws IOException {
	    System.out.println("YaController updateCommunity start...");
		
	    int user_num = 0;
	    if (session.getAttribute("user_num") != null) {
	        user_num = (int) session.getAttribute("user_num");
	    }
	    user1.setUser_num(user_num);
	    
		ServletContext servletContext = request.getSession().getServletContext();
		String realPath = servletContext.getRealPath("/upload/");
		System.out.println("realPath->" + realPath);
	 
		if(file1 != null) {
			String saveName = uploadFile(file1.getOriginalFilename(), file1.getBytes(), realPath);  // 진짜 저장
			
			board.setImg(saveName);	
		}
	    
	    int updateCommunity = ycs.updateCommunity(board);
		
		System.out.println("YaController ycs.updateCommunity updateBoard updateCommunity?"+updateCommunity);
		model.addAttribute("updateResult", updateCommunity);
		//수정후
		System.out.println("title update:"+board.getTitle());
		System.out.println("conts update:"+board.getConts());
		System.out.println("updateResult->" + updateCommunity);
		
		if (updateCommunity > 0) {
	       
	        return "redirect:/listCommunity";
	    } else {
	        model.addAttribute("msg", "수정 실패 확인해 보세요");
	        return "forward:/mypage.jsp";
	    }
	}
		
		//게시글 삭제
		@GetMapping(value="/deleteCommunity")
		public String deleteCommuinty(int brd_num, Model model) {
			
			int deleteResult = ycs.deleteCommunity(brd_num);
			System.out.println("YaController ycs.deleteCommunity start....");
		
			return "redirect:listCommunity";
			
		}
		
		//자유게시판 게시글조건(이름,제목)검색 -> 객체로 변경해야 json 형식으로 데이터 반환 가능
		@GetMapping(value="/listBoardSearch", produces = "application/json")
		@ResponseBody
		public List<Board> listBoardSearch(HttpServletRequest request) {
			System.out.println("YaController ycs.listSearchBoardart....");
			String keyword = request.getParameter("keyword");
			
			System.out.println("사용자 검색한 키워드: " + keyword);
		    
			
		    
		   
		    List<Board> listSearchBoard = ycs.listSearchBoard(keyword);
		    System.out.println("YaController listSearchBoard.size?" + listSearchBoard.size());

		    return listSearchBoard;
		}
		
		@GetMapping("/listBoardSort")
		@ResponseBody
		public  List<Board> listBoardSort(HttpServletRequest request ) {
			System.out.println("YaController ycs.listBoardSort start....");
			String sortOption = request.getParameter("sort");
			
			List<Board> listSortedBoard = ycs.listBoardSort(sortOption);
		
		    return listSortedBoard;
		}
		
		//상세 게시글 댓글  조회
		@RequestMapping(value="/listComment", method=RequestMethod.GET)
		@ResponseBody
		public List<Board> listComment(@RequestParam("brd_num") int brd_num,  Model model, Board board) {
			System.out.println("YaController ycs.listComment start....");
	
			
			List<Board> listComment = ycs.listComment(brd_num);
			model.addAttribute(" listCommenty",  listComment);
			board.setBrd_group(brd_num);
			
			System.out.println("YaController listComment size?" + listComment.size());
			System.out.println("YaController listComment brd_group?"+board.getBrd_group());
			return listComment; 
		}
		
		
		//게시글 댓글  작성 
		@RequestMapping("/commentWrite")
		@ResponseBody
		public Map<String, String> commentWrite(HttpSession session, HttpServletRequest request, @ModelAttribute Board board) {
		    Map<String, String> response = new HashMap<>();

		    try {
		        System.out.println("YaController ycs.commentWrite start....");

		        int user_num = 0;
		        if (session.getAttribute("user_num") != null) {
		            user_num = (int) session.getAttribute("user_num");
		            board.setUser_num(user_num);
		            
		            // 부모게시물의 brd num을 가져오기 
		            int brd_num =Integer.parseInt(request.getParameter("brd_num")); 
		            
		            //부모 게시글의  brd_num을 댓글의 brd_group으로 설정
		            board.setBrd_group(brd_num);
		            
				    board.setBrd_lg(700);
				    
				   // 부모 게시물의 댓글 중 가장 큰 brd_step을 가져와 1을 더해 새로운 댓글의 brd_step으로 설정       
				   try {
					    int brd_group = board.getBrd_num();
						int latestBrdStep = ycs.getLatestBrdStep(brd_group);
					    board.setBrd_step(latestBrdStep + 1);
				   
				   } catch (NumberFormatException e) {
				        e.printStackTrace();
				        // 실패한 경우
				        response.put("result", "failure");
				        response.put("error", "Invalid brd_num format");
				    }		
			            ycs.commentWrite(board);
			            System.out.println("conts:"+board.getConts());
		                // 성공한 경우, 상세 페이지로 리다이렉트
			            response.put("result", "success");
			            response.put("redirectUrl", "/ya/commentForm?brd_num=" + board.getBrd_num());
			        } else {
			            // 사용자가 로그인되지 않은 경우
			            response.put("result", "failure");
			            response.put("error", "User not logged in");
			        	}	
		    		} catch (Exception e) {
				        e.printStackTrace();
				        // 실패한 경우
				        response.put("result", "failure");
				        response.put("error", "An error occurred");
				    }

				    return response;
		}

		// 게시글 댓글 수정
		@PostMapping(value="/commentUpdate")
		@ResponseBody
		public Map<String, Object> commentUpdate(HttpSession session,
			      @RequestParam("brd_num") int brd_num, @RequestParam("conts") String conts, @ModelAttribute Board board) {
		    Map<String, Object> map = new HashMap<String, Object>();
		    try {
		        System.out.println("YaController ycs.commentUpdate start...");

		        int user_num = 0;
		        if (session.getAttribute("user_num") != null) {
		            user_num = (int) session.getAttribute("user_num");
		            
		            board.setUser_num(user_num);
		            board.setBrd_num(brd_num);
		            board.setConts(conts);
		     
		            // 댓글 업데이트 메소드 호출
		            ycs.commentUpdate(board);

		            // 댓글 정보 확인
		            System.out.println("session.getAttributeuser_num?"+session.getAttribute("user_num"));
		            System.out.println("board 댓글 수정후 conts?" + board.getConts());
		            System.out.println("board brd_num?" + board.getBrd_num());
		            System.out.println("board user_num?" + board.getUser_num());
		       
		            map.put("result", "success");
		            
		        } else {
		            // 사용자가 로그인되지 않은 경우
		            map.put("result", "failure");
		            map.put("error", "User not logged in");
		        }
		    } catch (Exception e) {
		        System.out.println("YaController commentUpdate e.getMessage()"+e.getMessage());
		        // 실패한 경우
		        map.put("result", "failure");
		        map.put("error", "An error occurred");
		    }

		    return map;
		}
		
		// 게시글 댓글 삭제
		@PostMapping(value="/commentDelete")
		@ResponseBody
		public Map<String, Object> commentDelete(HttpSession session,
				@RequestParam("brd_num") int brd_num,  @ModelAttribute Board board){
			
			Map<String, Object> map = new HashMap<String, Object>();
			try {
				System.out.println("YaController ycs.commentDelete start...");
				
				int user_num = 0;
				if(session.getAttribute("user_num")!=null) {
					 user_num = (int) session.getAttribute("user_num");				 
					 board.setUser_num(user_num);
					 
					 ycs.commentDelete(board);
					 
					 System.out.println("YaController commentDelete  board brd_num?"+board.getBrd_num());
					 System.out.println("YaController commentDelete board user_num?"+board.getUser_num());
				}
				
			} catch (Exception e) {
				 System.out.println("YaControllercommentDelete e.getMessage()"+e.getMessage());
			}
			
			
			return map;
			
		}
		
		//sharing 참가 신청 모달창 값 전달	
		@GetMapping(value="/sharingParticipate")
		@ResponseBody // 해당 데이터 반환@ResponseBody //  해당 데이터 반환
		public Map<String, Object> sharingParticipate(HttpSession session, Model model,
														@RequestParam("user_num") int user_num,
														@RequestParam("brd_num") int brd_num) 
																								{
													
			System.out.println("YaController sharingParticipate start...");
		    System.out.println("Received user_num: " + user_num);
		    System.out.println("Received brd_num: " + brd_num);
		    
			Map<String, Object> result = new HashMap<>();
			
			//detailSharing 메서드를 통해 Board 객체를 얻어옴
			Board board =  jbs.detailSharing(brd_num);
			
			//Board 객체에 brd_num과 user_num 설정
			board.setBrd_num(brd_num);
			System.out.println("board brd_num ?"+board.getBrd_num());
		
			model.addAttribute("board", board);
			
			if (session.getAttribute("user_num") != null) {
			User1 user1 = ycs.userSelect(user_num);
			model.addAttribute("user1", user1);
			
			result.put("user1", user1);
			result.put("board", board);
			result.put("status", "success");
			} else {
			result.put("status", "error");
			}
			
			return result;
			}
		
		// sharing 참가자 등록 데이터 save --> sharingList  똑같은 USER_NUM , 모집인원 마감시 알림창 띄우기 
		  @PostMapping(value="/saveSharingInfo")
		  @ResponseBody	
		  public Map<String, String> saveSharingInfo(@RequestBody Map<String, Object> requestBody, @ModelAttribute SharingList sharingList) {
			    int user_num = Integer.parseInt(requestBody.get("user_num").toString());
			    int brd_num = Integer.parseInt(requestBody.get("brd_num").toString());
			    String message = (String) requestBody.get("message");
		  
		  // 이렇게 하면 안됨...
		/*  public Map<String, String> saveSharingInfo(
		    										   @RequestParam("user_num") int user_num,
		    										   @RequestParam("brd_num") int brd_num,
		                                               @RequestParam("message") String message,
		                                               @ModelAttribute SharingList	sharingList	) { */
		        
			System.out.println("YaController saveSharingInfo start...");
			System.out.println("received user_num?" + user_num); 
			
	
			
			Board board = jbs.detailSharing(brd_num);
			  
			  sharingList.setBrd_num(board.getBrd_num());	  
		      sharingList.setMessage(message);
		      sharingList.setUser_num(user_num);
		       
		      System.out.println("brd_num:"+sharingList.getBrd_num());
		      System.out.println("message:"+sharingList.getMessage());
		      System.out.println("user_num:"+sharingList.getUser_num());
		      
		      
		       int saveResult = ycs.saveSharing(sharingList); 
		        Map<String, String> result = new HashMap<>();
		        
		        if (saveResult > 0) {
		        	
		            result.put("status", "success");
		            
		        } else {
		            result.put("status", "error");
		        }
		        result.put("status", "success");

		        return result;
		    }
		  
		//마이페이지 쉐어링 관리 - 내가 올린 쉐어링(myuploadSharing)  리스트 조회  - 내가 참가한 쉐어링(myJoinSharing)  		
		@RequestMapping(value="/sharingManagement")
		public String myUploadSharingList(HttpSession session, Board board,  Model model) {
			System.out.println("YaController myUploadSharingList start...");
			
			int user_num=0;
			if(session.getAttribute("user_num") != null) {
				user_num = (int) session.getAttribute("user_num");
				
				User1 user1 = ycs.userSelect(user_num);
				model.addAttribute("user1", user1);		
			
			List<Board> myUploadSharingList = ycs.myUploadSharingList(user_num);
			
			System.out.println("YaController sharingManagement.size()?"+myUploadSharingList.size());
			model.addAttribute("myUploadSharingList", myUploadSharingList);
		}
			return "ya/mySharingManagement";
	}	  
		
		//마이페이지 쉐어링 관리 - 내가 올린 쉐어링 에서 참가자 리스트 조회 (sharingParticipantsInfo)
		   /*@ResponseBody
				public String sharingParticipantsInfo(SharingList sharingList, Model model, @RequestParam("brd_num") int brd_num) {
					System.out.println("YaController sharingParticipantsInfo start.."); */
					
				/* brd_num= sharingList.getBrd_num(); */
	
	    @GetMapping(value = "/sharingParticipantsInfo")
	    @ResponseBody
	    public List<SharingList>sharingParticipantsList(@RequestParam("brd_num") int brd_num, Model model) {
	        System.out.println("YaController sharingParticipantsInfo start..");
	      
	        System.out.println("Ya sharingParticipantsInfo Received brd_num: " + brd_num);
	        
	        List<SharingList> sharingParticipantsList = ycs.sharingParticipantsList(brd_num);
	        model.addAttribute("sharingParticipantsList", sharingParticipantsList);
	        System.out.println("sharingParticipantsList: "+sharingParticipantsList);
	        return sharingParticipantsList;
	    }
	
		  
}		
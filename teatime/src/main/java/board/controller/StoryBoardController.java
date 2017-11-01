package board.controller;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import board.dto.StoryBoardCommentDTO;
import board.dto.StoryBoardCommentRecommendDTO;
import board.dto.StoryBoardDTO;
import board.service.StoryBoardCommentServiceImpl;
import board.service.StoryBoardServiceImpl;


@Controller
public class StoryBoardController {
	String user_id=null;
	@Autowired
	StoryBoardServiceImpl service;
	
	@Autowired
	StoryBoardCommentServiceImpl serviceComment;
	
	
	@RequestMapping(value="teatime.storyBoardMain")
	public String moveStoryMain(){		
		return "storyboard/StoryBoardMain";
	}
	
	//전체조회
	@RequestMapping("teatime.storyBoardList")
    public ModelAndView getStoryList(@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,HttpSession session) {
		user_id = (String)session.getAttribute("sessionId");
		System.out.println("세션아이디:::::::::::"+user_id);
		ModelAndView mav = new ModelAndView();
		List<StoryBoardDTO> list = service.getStoryBoardList(pageNum);
		int pageNumCount = service.getPageNum();
		mav.addObject("pageNumCount",pageNumCount);
		mav.addObject("allstoryboardlist", list);
		mav.setViewName("storyboard/StoryBoardList");
		
		return mav;
    }
	//게시판 검색기능 
		@RequestMapping("teatime.storyBoardSearch")
		public ModelAndView storyBoardSearch(String searchColumn, String keyword,@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum){
			ModelAndView mav = new ModelAndView();			
			List<StoryBoardDTO> list = service.getStoryBoardSearch(searchColumn, keyword,pageNum);		
			int pageNumCount = service.getSearchPageNum(searchColumn, keyword);
			mav.addObject("searchColumn",searchColumn);
			mav.addObject("keyword",keyword);
			mav.addObject("pageNumCount",pageNumCount);
			mav.addObject("searchList",list);
			mav.setViewName("storyboard/StoryBoardSearch");
			return mav;
		}
	
	//게시글 한개 조회
	@RequestMapping("teatime.storyBoardDetail")
	public ModelAndView getBoardDetail(int idx){
		ModelAndView mav = new ModelAndView();
		service.plusViewCount(idx);
		StoryBoardDTO storyDTO = service.getDetailStoryBoard(idx);
		List<StoryBoardCommentDTO> comment = serviceComment.getStoryBoardCommentList(idx);
		int countcomment = serviceComment.commentCount(idx);
		Map<String,Object> recommendMap = service.selectRecommend(idx,"board");
		List<StoryBoardCommentRecommendDTO> list = service.selectCommentRecommend(idx);		
		mav.addObject("commentRecommend",list);
		mav.addObject("recommend",recommendMap);		
		mav.addObject("detail", storyDTO); 
		mav.addObject("comment", comment);
		mav.addObject("countcomment", countcomment);
		mav.setViewName("storyboard/StoryBoardDeatail");
		return mav;	
	}
	
	
	//게시글 추가
	@RequestMapping(value="teatime.storyBoardInsert",method=RequestMethod.GET)
	public String moveStoryInsert(){
		return "storyboard/StoryBoardWrite";
	}
	
	//게시글 추가 후 게시판 전체조회로
	@RequestMapping(value="teatime.storyBoardInsert",method=RequestMethod.POST)
	public String setStoryInsert(StoryBoardDTO storyDTO){
		if(user_id!=null){
			storyDTO.setUser_id(user_id);
			String url = service.insertStoryBoard(storyDTO);		
		}
		return "redirect:teatime.storyBoardList";					
	}
	
	
	
	//게시글 수정
	@RequestMapping(value="teatime.storyBoardModify",method=RequestMethod.GET)
	public ModelAndView moveStoryModify(int idx, HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		StoryBoardDTO storyDTO = service.getDetailStoryBoard(idx);
		storyDTO.setUser_id((String)session.getAttribute("sessionId"));
		mav.addObject("modify", storyDTO);
		mav.setViewName("storyboard/StoryBoardModify");
		return mav;	
		
		
	
	}
	//게시글 수정
	@RequestMapping(value="teatime.storyBoardModify",method=RequestMethod.POST)
	public String setModifyStoryBoard(StoryBoardDTO storyDTO){
		
		String url = service.modifyStoryBoard(storyDTO);
		
		return "redirect:teatime.storyBoardList";					
	}
	
	//게시글 삭제
	@RequestMapping("teatime.storyBoardDelet")	
	public String setDeleteStoryBoard(int idx, StoryBoardDTO storyDTO, HttpSession session){
		storyDTO.setUser_id((String)session.getAttribute("sessionId"));
		String url = service.deleteStoryBoard(idx);
		
		return "redirect:teatime.storyBoardList";
	}
	//게시글 신고 
	@RequestMapping(value="teatime.storyBoardReport",method=RequestMethod.GET)
	public String reportStoryBoard(){
		return "storyboard/StoryBoardReport";
	}
			
	@RequestMapping(value="teatime.storyBoardReport",method=RequestMethod.POST)
	public String reportStoryBoard(int idx, String content){
		//로그인 구현되면 해야함 임의로 정의
		/*String user_id ="kgh";*/
		String tableName="board";
		service.insertReport(idx,user_id,content,tableName);		
		return "redirect:teatime.storyBoardDetail?idx="+idx;
	}
	
	//이미 신고한 게시물인지 확인하기
		@ResponseBody
		@RequestMapping("teatime.checkReport")
		public int checkReport(int idx, HttpSession session){
			/*String user_id=(String)session.getAttribute("sessionId");*/
			String tableName="board";
			return service.checkReport(idx,user_id,tableName);
		}
	
	

		@RequestMapping(value="teatime.storyBoardCommentInsert",method=RequestMethod.POST)
		public String setStoryCommentInsert(StoryBoardCommentDTO storyCommentDTO, HttpSession session){
			storyCommentDTO.setUser_id((String)session.getAttribute("sessionId"));
			System.out.println("implcecommentinsertidx="+storyCommentDTO.getBoard_idx());
			String url = serviceComment.insertStoryBoardComment(storyCommentDTO);				
			return "redirect:teatime.storyBoardDetail?idx="+storyCommentDTO.getBoard_idx();					
		}
			
	
		@RequestMapping(value="teatime.storyBoardCommentModify",method=RequestMethod.POST)
		public String moveStoryCommentModify(StoryBoardCommentDTO storyCommentDTO){
			storyCommentDTO.setUser_id(user_id);
			String url = serviceComment.modifyStoryBoardComment(storyCommentDTO);			
			return "redirect:teatime.storyBoardDetail?idx="+storyCommentDTO.getBoard_idx();		
		}
		
		
		@RequestMapping(value="teatime.storyBoardCommentDelete",method=RequestMethod.GET)
		public String setStoryCommentDelete(int idx, int board_idx){
				
			String url = serviceComment.deleteStoryBoardComment(idx);
						
			return "redirect:teatime.storyBoardDetail?idx="+board_idx;	
			//return "redirect:teatime.storyBoardList";
				
		}	
			
	
		@RequestMapping(value="teatime.storyBoardReCommentInsert",method=RequestMethod.POST)
		public String setStoryReCommentInsert(StoryBoardCommentDTO storyCommentDTO, HttpSession session){
			storyCommentDTO.setUser_id((String)session.getAttribute("sessionId"));
			int indent = storyCommentDTO.getIndent();
			storyCommentDTO.setIndent(indent+1);
			String url = serviceComment.insertStoryBoardReComment(storyCommentDTO);
				
			return "redirect:teatime.storyBoardDetail?idx="+storyCommentDTO.getBoard_idx();					
		}
		
		// 사진 업로드 Ajax 
		@RequestMapping(value="teatime.storyBoardImageUpload",method=RequestMethod.POST)
		   public @ResponseBody String setImageUpload(MultipartFile uploadFile,HttpServletRequest request){	
		      String localPath = request.getRequestURL().substring(0,21);
		      String url = service.setImageUpload(uploadFile);
		      return localPath+"/img/"+url;
		   }
		//게시글 추천 추가 
		@ResponseBody
		@RequestMapping("teatime.storyBoardRecommend")
		public Map<String,Object> setRecommend(int idx,String recommend){
			//user_id 임의 설정
			/*String user_id="kgh";*/
			System.out.println("세션아이디 :::::::::"+user_id);
			String tableName ="board";
			service.checkRecommend(idx,user_id,recommend,tableName);
			Map<String,Object> map = service.selectRecommend(idx,tableName);
			return map;
			
		}
		
		//댓글의 추천 및 비추천
		@ResponseBody
		@RequestMapping("teatime.commentRecommend")
		public Map<String,Object> setCommentRecommend(int idx, String recommend){
			//user_id 임의 설정
			/*String user_id ="test";*/
			String tableName="comment";
			service.checkRecommend(idx,user_id,recommend,tableName);	
			Map<String,Object> map = service.selectRecommend(idx,tableName);			
			return map;
		}
		
		//댓글 신고
		@RequestMapping(value="teatime.commentReport",method=RequestMethod.GET)
		public String commentReport(){
			return "storyboard/StoryBoardCommentReport";
		}
				
		@RequestMapping(value="teatime.commentReport",method=RequestMethod.POST)
		public String commentReport(int idx, String content, int board_idx){
			//로그인 구현되면 해야함 임의로 정의
			/*String user_id ="kgh";*/
			String tableName="comment";
			service.insertReport(idx,user_id,content,tableName);		
			return "redirect:teatime.storyBoardDetail?idx="+board_idx;
		}
		
		//이미 신고한 게시물인지 확인하기
		@ResponseBody
		@RequestMapping("teatime.checkCommentReport")
		public int checkCommentReport(int idx){
			/*String user_id="kgh";*/
			String tableName="comment";
			return service.checkReport(idx,user_id,tableName);
		}
		
		@ResponseBody
		@RequestMapping("teatime.checkWriter")
		public int checkWriter(int idx){
			System.out.println("ajax 세션"+user_id);
			System.out.println(service.checkWriter(user_id,idx));
			return service.checkWriter(user_id,idx);
		}
}

package board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.StoryBoardCommentDAO;
import board.dto.StoryBoardCommentDTO;
import board.dto.StoryBoardDTO;

 
@Service
public class StoryBoardCommentServiceImpl implements StoryBoardCommentService{



	@Autowired
	StoryBoardCommentDAO storyBoardCommentDAO;
	
	//댓글불러오기
	
	public List<StoryBoardCommentDTO> getStoryBoardCommentList(int idx){
	return storyBoardCommentDAO.getAllStoryBoardComment(idx);
	}
	
	
	//댓글 작성하기
	public String insertStoryBoardComment(StoryBoardCommentDTO storyCommentDTO) {
		int result =storyBoardCommentDAO.insertStoryBoardComment(storyCommentDTO);
		System.out.println(result);
		String url = "";
		int detailidx = storyCommentDTO.getIdx();
		System.out.println("detailidx="+detailidx);
		if(result == 1){
			url = "storyboard/teatime.storyBoardDetail";
		}
		else{
			url = "storyboard/StoryBoardCommentWriteFail";
		}
		return url;
	}
	
	//댓글 수정하기
	public String modifyStoryBoardComment(StoryBoardCommentDTO storyCommentDTO) {
		System.out.println("getboardidx="+storyCommentDTO.getIdx());
		int result =storyBoardCommentDAO.modifyStoryBoardComment(storyCommentDTO);
		System.out.println(result);
		String url = "";
		int detailidx = storyCommentDTO.getIdx();
		System.out.println("detailidx="+detailidx);
		if(result == 1){
			url = "storyboard/teatime.storyBoardDetail";
		}
		else{
			url = "storyboard/StoryBoardCommentWriteFail";
		}
		return url;
	}
	
	
	
	//댓글 삭제하기
	public String deleteStoryBoardComment(int idx){
		int result = storyBoardCommentDAO.deleteStoryBoardComment(idx);
		System.out.println(result);
		String url = "";
		if(result == 1 ){
			url = "storyboard/teatime.storyBoardDetail";
		}else{
			url = "storyboard/StoryBoardCommentWriteFail";
		}
		return url;
	}
	
	//댓글 작성하기
		public String insertStoryBoardReComment(StoryBoardCommentDTO storyCommentDTO) {
			int result =storyBoardCommentDAO.insertStoryBoardReComment(storyCommentDTO);
			System.out.println(result);
			String url = "";
			int detailidx = storyCommentDTO.getIdx();
			System.out.println("detailidx="+detailidx);
			if(result == 1){
				url = "storyboard/teatime.storyBoardDetail";
			}
			else{
				url = "storyboard/StoryBoardCommentWriteFail";
			}
			return url;
		}
		
		//댓글세기
		public int commentCount(int idx) {
			int count =storyBoardCommentDAO.getCommentCount(idx);
			
			return count;
		}
		
	
	
}
	


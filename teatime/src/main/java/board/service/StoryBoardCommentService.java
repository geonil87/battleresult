package board.service;

import java.util.List;

import board.dto.StoryBoardCommentDTO;


public interface StoryBoardCommentService {
	
	//댓글불러오기
	public List<StoryBoardCommentDTO> getStoryBoardCommentList(int idx);
	
	//댓글작성
	public String insertStoryBoardComment(StoryBoardCommentDTO storyCommantDTO);
	
	//댓글 수정
	public String modifyStoryBoardComment(StoryBoardCommentDTO storyCommantDTO);
	
	//댓글삭제
	public String deleteStoryBoardComment(int idx);
	
	//대댓글작성
	public String insertStoryBoardReComment(StoryBoardCommentDTO storyCommantDTO);
	
	//댓글세기
	public int commentCount(int idx);

}
 
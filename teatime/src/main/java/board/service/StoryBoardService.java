package board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import board.dto.StoryBoardCommentRecommendDTO;
import board.dto.StoryBoardDTO;

public interface StoryBoardService {
	
	
	//전체조회
	public List<StoryBoardDTO> getStoryBoardList(int pageNum);

	//게시글 한개 조회
	public StoryBoardDTO getDetailStoryBoard(int idx);
	
	//게시글 추가
	public String insertStoryBoard(StoryBoardDTO storyDTO);
	
	//게시글 수정
	public String modifyStoryBoard(StoryBoardDTO storyDTO);
	
	//게시글 삭제
	public String deleteStoryBoard(int idx);
	
	//게시글 페이징
	public int getPageNum();
	//게시글 검색
	public List<StoryBoardDTO> getStoryBoardSearch(String searchColumn, String keyword,int pageNum);
	//게시글 검색 페이징
	public int getSearchPageNum(String searchColumn, String keyword);
	
	//게시글 조회수 증가
	public void plusViewCount(int idx);
	
	//추천 비추천 했는지 확인하기
	public int checkRecommend(int idx, String user_id, String recommend,String tableName);
	
	//recommend 가져오기
	public Map<String,Object> selectRecommend(int idx,String tableName);
	
	//게시글 신고하기
	public void insertReport(int idx,String user_id,String content, String tableName);
	
	//이미 신고한 게시물인지 확인하기
	public int checkReport(int idx,String user_id,String tableName);
	
	public String setImageUpload(MultipartFile uploadFile);
	
	public List<StoryBoardCommentRecommendDTO> selectCommentRecommend(int idx);
	
	public int checkWriter(String user_id,int idx);
	
}

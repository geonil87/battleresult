package board.dao;




import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import board.dto.StoryBoardCommentRecommendDTO;
import board.dto.StoryBoardDTO;
import board.mapper.StoryBoardMapper;

@Component
public class StoryBoardDAO {
	
	@Autowired
	SqlSession session;
	
	@Autowired
	StoryBoardMapper mapper;
	
	
	//전체조회
	public List<StoryBoardDTO> getAllStoryBoard(int pageNum){
		
		List<StoryBoardDTO> list = session.selectList("storyboard.all",pageNum);	
		return list;
	
	}
	
	
	//한개조회 (글번호로 조회)
	public StoryBoardDTO getDetailStoryBoard(int idx){
		
		StoryBoardDTO storyDTO = session.selectOne("storyboard.detail", idx);
		
		
		System.out.println(storyDTO.getWdate());
		return storyDTO;
	}
	
	//글쓰기
	public int insertStoryBoard(StoryBoardDTO storyDTO){
		
	return session.insert("storyboard.insert", storyDTO);
	
	}
	
	
	//게시글 수정
	public int modifyStoryBoard(StoryBoardDTO storyDTO){
		
		System.out.println(storyDTO.getTitle() +":" + storyDTO.getContent() +":" + storyDTO.getIdx());
		
		int result = session.update("storyboard.modify", storyDTO);
		
		return result;
	}
	
	
	//게시글 삭제(글번호로 삭제)
	public int deleteStoryBoard(int idx){
		
		return session.delete("storyboard.delete", idx);
	}
	
	
	//게시판 페이징을 위한 게시물의 총 갯수 구하기
		public int getPageNum(){
			return mapper.getPageNum();
		}

		//게시판 검색기능
		public List<StoryBoardDTO> getStoryBoardSearch(Map<String,Object> searchMap){
			List<StoryBoardDTO> list = session.selectList("storyboard.search",searchMap);		
			return list;
		}
		//게시판 검색 페이징을 위한 게시물의 총 갯수 구하기 
		public int getSearchPageNum(Map<String,Object> searchMap){
			return session.selectOne("storyboard.searchPaging",searchMap);
		}
		
		//조회수 증가
		public void plusViewCount(int idx){
			mapper.plusViewCount(idx);
		}
		
		//추천 및 비추천 확인 및 insert, update		
				public int checkRecommend(Map<String,Object> map){
					Map<String,Integer> resultMap = new HashMap();
					int result=0;
					resultMap = session.selectOne("storyboard.checkRecommend",map);
					if((Integer)session.selectOne("storyboard.checkRecommend2",map)==1){//good이거나 bad거나 하나는 누른상태
						if(map.get("good")!=null){
							if((Integer)resultMap.get("good")==1){
								result=2;
							}else{
								result=1;
								session.update("storyboard.updateRecommend",map);
							}					
						}else if(map.get("bad")!=null){
							if((Integer)resultMap.get("bad")==1){
								result=2;
							}else{
								result=1;
								session.update("storyboard.updateRecommend",map);
							}
						}				
					}else{
						result=0;
						session.insert("storyboard.insertRecommend",map);
					}			
					return result;
				}
				
				//게시글 추천, 비추천 가져오기
				public Map<String,Object> selectRecommend(Map<String,Object> map){
					Map<String,Object> resultMap = new HashMap();
					int good=session.selectOne("storyboard.selectRecommendGood",map);
					int bad= session.selectOne("storyboard.selectRecommendBad",map);
					resultMap.put("good", good);
					resultMap.put("bad", bad);
					return resultMap;
				}
				
				
				//게시글, 댓글 신고하기
				public void insertReport(Map<String,Object> map){
					session.insert("storyboard.insertReport",map);
				}
				
				//이미 신고한 게시물,댓글인지 확인하기
				public int checkReport(Map<String,Object> map){
					return session.selectOne("storyboard.checkReport",map);
				}
				
				//댓글의 추천 및 비추천 수 가져오기
				public List<StoryBoardCommentRecommendDTO> selectCommentRecommend(int idx){					
					List<StoryBoardCommentRecommendDTO> resultList = new ArrayList();
					List<Integer> list = session.selectList("storyboard.selectCommentIdx",idx);
					for(Integer i : list){						
						Map<String,Object> map = new HashMap();
						map.clear();
						map.put("tableName", "comment");
						map.put("idx", i);						
						int good =session.selectOne("storyboard.selectRecommendGood",map);
						int bad = session.selectOne("storyboard.selectRecommendBad",map);
						resultList.add(new StoryBoardCommentRecommendDTO(good,bad));
					}
					return resultList;
				}
				
				public String checkWriter(int idx){
					return session.selectOne("storyboard.checkWriter",idx);
				}
}


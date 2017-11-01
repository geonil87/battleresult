package board.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import board.dao.StoryBoardDAO;
import board.dto.StoryBoardCommentRecommendDTO;
import board.dto.StoryBoardDTO;

@Service
public class StoryBoardServiceImpl implements StoryBoardService{



	@Autowired
	StoryBoardDAO storyBoardDAO;
	
	
	//게시글 전체조회
	public List<StoryBoardDTO> getStoryBoardList(int pageNum) {
		return storyBoardDAO.getAllStoryBoard(pageNum);
		
	}
	
	
	//게시글 한개 조회
	public StoryBoardDTO getDetailStoryBoard(int idx) {
		return storyBoardDAO.getDetailStoryBoard(idx);
	}
	
	
	//게시글 추가
	public String insertStoryBoard(StoryBoardDTO storyDTO) {
		int result =storyBoardDAO.insertStoryBoard(storyDTO);
		System.out.println(result);
		String url = "";
		if(result == 1){
			url = "storyboard/StoryBoardList";
		}
		else{
			url = "storyboard/StoryBoardWriteFail";
		}
		return url;
	}
		
		//게시글 수정
		public String modifyStoryBoard(StoryBoardDTO storyDTO){
			int result = storyBoardDAO.modifyStoryBoard(storyDTO);
			System.out.println(result);
			String url = "";
			if(result == 1){
				url = "storyboard/StoryBoardList";
			}else{
				url = "storyboard/StoryBoardWriteFail";
			}
			return url;
		}
	
	
	//게시글 삭제
	public String deleteStoryBoard(int idx){
		int result = storyBoardDAO.deleteStoryBoard(idx);
		System.out.println(result);
		String url = "";
		if(result == 1){
			url = "storyboard/StoryBoardDelete";
		}else{
			url = "storyboard/StoryBoardWriteFail";
		}
		return url;
	}

	//게시판 페이지 갯수 구하기
		public int getPageNum(){
			int allBoardCount = storyBoardDAO.getPageNum();
			int onePageBoardCount = 10;
			int pageNum = allBoardCount/onePageBoardCount;
			if(allBoardCount%onePageBoardCount>0){
				pageNum++;
			}		
			return pageNum;
		}
		//게시판 검색 결과 가져오기
		public List<StoryBoardDTO> getStoryBoardSearch(String searchColumn, String keyword,int pageNum){
			Map<String,Object> searchMap = new HashMap<String,Object>();
			if(searchColumn.equals("제목")){
				searchMap.put("title", "title");
			}else if(searchColumn.equals("내용")){
				searchMap.put("content", "content");
			}else if(searchColumn.equals("작성자")){
				searchMap.put("user_nick", "user_nick");
			}else{
				searchMap.put("all", "all");			
			}
			searchMap.put("pageNum", pageNum);
			searchMap.put("keyword", "%"+keyword+"%");
			
			return storyBoardDAO.getStoryBoardSearch(searchMap);
		}
		//게시판 검색결과 페이징
		public int getSearchPageNum(String searchColumn, String keyword){
			
			Map<String,Object> searchMap = new HashMap<String,Object>();		
			if(searchColumn.equals("제목")){
				searchMap.put("title", "title");
			}else if(searchColumn.equals("내용")){
				searchMap.put("content", "content");
			}else if(searchColumn.equals("작성자")){
				searchMap.put("user_nick", "user_nick");
			}else{
				searchMap.put("all", "all");			
			}
			searchMap.put("keyword", "%"+keyword+"%");
			int searchBoardCount = storyBoardDAO.getSearchPageNum(searchMap);
			int onePageBoardCount = 10;
			int pageNum = searchBoardCount/onePageBoardCount;
			if(searchBoardCount%onePageBoardCount>0){
				pageNum++;
			}		
			return pageNum;

		}
		
		//게시글 조회수 증가
		public void plusViewCount(int idx){
			storyBoardDAO.plusViewCount(idx);
		}
		
		//추천,비추천 확인하기
				public int checkRecommend(int idx, String user_id, String recommend,String tableName){
					Map<String,Object> map = new HashMap();			
					map.put("idx", idx);
					map.put("user_id",user_id);
					map.put("tableName",tableName);
					if(recommend.equals("good")){
						map.put("good", 1);
					}else if(recommend.equals("bad")){
						map.put("bad", 1);
					}
						
					return storyBoardDAO.checkRecommend(map);
				}
				
				//추천, 비추천 가져오기
				public Map<String,Object> selectRecommend(int idx,String tableName){
					Map<String,Object> map = new HashMap();			
					map.put("idx", idx);
					map.put("tableName",tableName);
					return storyBoardDAO.selectRecommend(map);
				}
				
				//게시글 신고하기
				public void insertReport(int idx,String user_id,String content,String tableName){
					Map<String,Object> map = new HashMap();
					map.put("idx", idx);
					map.put("user_id", user_id);
					map.put("content", content);
					map.put("tableName", tableName);
					storyBoardDAO.insertReport(map);
				}
				
				//이미 신고한 게시물인지 확인하기
				public int checkReport(int idx, String user_id,String tableName){
					Map<String,Object> map = new HashMap();
					map.put("idx", idx);
					map.put("user_id", user_id);
					map.put("tableName", tableName);
					return storyBoardDAO.checkReport(map);
				}
				
				// 이미지 서버 업로드
			      public String setImageUpload(MultipartFile uploadFile) {
			         UUID uid = UUID.randomUUID();
			         String original = uploadFile.getOriginalFilename();
			         String saveName = uid.toString()+"_"+original;
			         String uploadPath = "C:/image";
			         File target = new File(uploadPath, saveName);
			         System.out.println("사진 사이즈 : "+uploadFile.getSize());
			      
				          try {
				         FileCopyUtils.copy(uploadFile.getBytes(), target);
				         
				          } catch (IOException e) {
				            e.printStackTrace();
				         }
			      
			          String url = saveName;
			          System.out.println(url);
			         return url;
			      }
			      
			      //댓글의 추천수
			      public List<StoryBoardCommentRecommendDTO> selectCommentRecommend(int idx){			    	 
			    	 return storyBoardDAO.selectCommentRecommend(idx);
			      }
			      
			      public int checkWriter(String user_id,int idx){
			    	  String writer = storyBoardDAO.checkWriter(idx);
			    	  int result = 0;
			    	  if(user_id.equalsIgnoreCase(writer)){
			    		  result=1;
			    	  }else{
			    		  result=2;
			    	  }
			    	  return result;
			      }
		

	}
	


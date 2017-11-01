package board.support;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

public class Paging {
	
	private int totalCount; // 전체 게시물수
	private int countList;	// 게시판에 뿌려줄 게시물 갯수 (set 선택 가능)
	private int countPage; 	// 게시판에 뿌려줄 페이지 갯수 (set 선택 가능)
	
	private int pageNum;	// 현재 페이지 번호
	private int totalPage;	// 게시판의 페이지 수
	private int startPage;	// 시작 페이지
	private int endPage;	// 마지막 페이지
	private int startContent;	// 뿌려주는 시작 게시물 번호
	private int endContent;	// 뿌려주는 마지막 게시물 번호
	
	public Map<String,Integer> getPaging(int pageNum){
		totalPage = (int)Math.ceil((double)totalCount/(double)countList);
		// Preview & Next 버튼을 누르면 실행
		if(pageNum <= 0){
			pageNum = 1;
		}else if(pageNum > totalPage){
			pageNum = totalPage;
		}
		
		startPage = pageNum-((pageNum-1)%countPage);
		
		endPage = startPage+(countPage-1);
		if(endPage > totalPage){endPage = totalPage;};	// endPage가 총 페이지 수 보다 작으면 end 페이지는 총 페이지수
		
		startContent = 1+(countList*(pageNum-1));
		endContent = countList*pageNum;
		
		// 총 게시물이 뿌려줘야할 게시물 수보다 적을경우 페이지셋팅
		if(totalCount < countList){
			startPage = 0;
			endPage = 1;
		}
		

		
		
		Map<String,Integer> page = new HashMap<String, Integer>();
		page.put("pageNum", pageNum);
		page.put("totalPage", totalPage);
		page.put("startPage", startPage);
		page.put("endPage", endPage);
		page.put("startContent", startContent);
		page.put("endContent", endContent);
		return page;
	}

	
	/*Getter & Setter*/
	public int getTotalCount() {return totalCount;}
	public void setTotalCount(int totalCount) {this.totalCount = totalCount;}
	public int getCountList() {return countList;}
	public void setCountList(int countList) {this.countList = countList;}
	public int getCountPage() {return countPage;}
	public void setCountPage(int countPage) {this.countPage = countPage;}
	public int getPageNum() {return pageNum;}
	public void setPageNum(int pageNum) {this.pageNum = pageNum;}
	public int getTotalPage() {return totalPage;}
	public void setTotalPage(int totalPage) {this.totalPage = totalPage;}
	public int getStartPage() {return startPage;}
	public void setStartPage(int startPage) {this.startPage = startPage;}
	public int getEndPage() {return endPage;}
	public void setEndPage(int endPage) {this.endPage = endPage;}
	public int getStartContent() {return startContent;}
	public void setStartContent(int startContent) {this.startContent = startContent;}
	public int getEndContent() {return endContent;}
	public void setEndContent(int endContent) {this.endContent = endContent;}
		
}

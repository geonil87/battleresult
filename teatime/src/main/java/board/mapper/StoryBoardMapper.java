package board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import board.dto.StoryBoardDTO;

@Mapper
public interface StoryBoardMapper {
	
	
	@Select("select * from story_board")
	public List<StoryBoardDTO> getAllStoryBoardMapper(Map<String, Integer> map);
	
	@Select("select * from story_board "
			+ "where idx=#{id} ")
	public StoryBoardDTO getOneStoryBoardMapper(int id);
	
	//게시글 페이징
	@Select("select count(*) from story_board")
	public int getPageNum();
	
	@Update("update story_board set hit= hit+1 where idx=#{idx}")
	public void plusViewCount(int idx);

}

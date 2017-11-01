package board.dto;


public class StoryBoardCommentDTO {
	

	int idx; 
	int board_idx;
	String content;
	String user_id;
	String user_nick;
	int good;
	int bad;
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	String wdate;
	int comment_group;
	int step;
	int indent;
	int available;
	
	public StoryBoardCommentDTO(){}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getComment_group() {
		return comment_group;
	}

	public void setComment_group(int comment_group) {
		this.comment_group = comment_group;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getIndent() {
		return indent;
	}

	public void setIndent(int indent) {
		this.indent = indent;
	}

	public int getAvailable() {
		return available;
	}

	public void setAvailable(int available) {
		this.available = available;
	}

	public StoryBoardCommentDTO(int idx, int board_idx, String content,String user_id, String user_nick, String wdate,
			int comment_group, int step, int indent, int available) {
		super();
		this.idx = idx;
		this.board_idx = board_idx;
		this.content = content;
		this.user_id = user_id;
		this.user_nick = user_nick;
		this.wdate = wdate;
		this.comment_group = comment_group;
		this.step = step;
		this.indent = indent;
		this.available = available;
	}

	@Override
	public String toString() {
		return "StoryBoardCommentDTO [idx=" + idx + ", board_idx=" + board_idx + ", content=" + content + ", user_nick="
				+ user_nick + ", wdate=" + wdate + ", comment_group=" + comment_group + ", step=" + step + ", indent="
				+ indent + ", available=" + available + "]";
	}

	
	
	
	
	
}

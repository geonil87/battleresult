package member.dao;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSession session;
	
	
	public Map<String,String> checkLogin(Map<String,String> loginInfo){
		return session.selectOne("member.checkLoginInfo", loginInfo.get("user_id"));
	}
	

	public int insertRegist(MemberDTO memberDTO){
		int resultTemp = session.insert("member.insertRegistInfo", memberDTO);
		System.out.println(resultTemp);
		return resultTemp;
	}
	
	
	public Map<String,String> checkRegist(String userId){
		return session.selectOne("member.checkRegistInfo", userId);
	}
	
	public int checkRegistSameId(String userId){
		return session.selectOne("member.checkRegistId", userId);
	}
	
	public int checkRegistSameNick(String userNick){
		return session.selectOne("member.checkRegistNick", userNick);
	}
	
	public int checkRegistSameEmail(String userEmail){
		return session.selectOne("member.checkRegistEmail", userEmail);
	}
	
	
	public String findId(String userEmail){
		return session.selectOne("member.findId", userEmail);
	}
	
	
	public int checkIdFindPw(String userId){
		return session.selectOne("member.checkIdFindPw", userId);
	}
	
	public int changePw(Map<String,String> userInfo){
		return session.update("member.changePw", userInfo);
	}
	
	public String checkModifyPw(String userId){
		return session.selectOne("member.checkPw", userId);
	}
	
	public MemberDTO getUserInfo(String userId){
		return session.selectOne("member.getUserInfo", userId);
	}
	
	public int setModifyUserInfo(MemberDTO memberDTO){
		return session.update("member.setModifyUserInfo", memberDTO);
	}
	
}

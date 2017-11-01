package member.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import member.dto.MemberDTO;

public interface MemberService {
	
	public Map<String,String> checkLogin(Map<String,String> loginInfo);
	
	public Map<String,String> insertRegistration(MemberDTO memberDTO);
	
	public int checkRegistId(String userId);
	
	public int checkRegistNick(String userNick);
	
	public int checkRegistEmail(String userEmail);
	
	public boolean sendAuthMail(String userEmail, String authText);
	
	public boolean sendFindIdMail(String userEmail);
	
	public boolean checkIdFindPw(String userId);
	
	public boolean sendFindPwMail(String userEmail, String authText);
	
	public int changePw(String userId,String userPw);
	
	public boolean checkModifyPw(String userId,String userPw);
	
	public MemberDTO getUserInfo(String userId);
	
	public boolean setModifyUserInfo(MemberDTO memberDTO);
}

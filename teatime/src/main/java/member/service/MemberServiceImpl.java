package member.service;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import member.dao.MemberDAO;
import member.dto.MemberDTO;
import member.support.EmailAuthClass;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO dao;
	
	@Autowired
	JavaMailSender javaMailSender;
		
	//로그인
	public Map<String,String> checkLogin(Map<String,String> loginInfo) {
		Map<String, String> loginResultMap = dao.checkLogin(loginInfo);
		if(loginResultMap==null){
		
			loginResultMap = new HashMap<String,String>();
			loginResultMap.put("loginFailId", "���̵� �߸��ǰų� �������� �ʽ��ϴ�.");
		}else if(!loginResultMap.get("userPw").equals(loginInfo.get("user_pw"))){
			loginResultMap.remove("userPw");
			loginResultMap.remove("userPermission");
			loginResultMap.remove("usernick");
			
			
			loginResultMap.put("loginFailPw", "��й�ȣ�� �߸��Ǿ����ϴ�.");
		}
		
		return loginResultMap;
	}
	
	//회원가입
	public Map<String,String> insertRegistration(MemberDTO memberDTO) {

		Map<String,String> registResultMap = null;
		int registResult = dao.insertRegist(memberDTO);
		if(registResult == 1){
			registResultMap = dao.checkRegist(memberDTO.getUserId());
		}
		
		return registResultMap;  
	}

	public int checkRegistId(String userId) {
		return dao.checkRegistSameId(userId);
	}
	
	public int checkRegistNick(String userNick) {
		return dao.checkRegistSameNick(userNick);
	}


	public int checkRegistEmail(String userEmail) {
		return dao.checkRegistSameEmail(userEmail);
	}
	
	
	public boolean sendAuthMail(String userEmail, String authText) {
			
        MimeMessage message = javaMailSender.createMimeMessage();
 
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject("Teatime ȸ������ ���� ���� �Դϴ�.");
            helper.setText("�̸��� ���� �ڵ�� [ "+authText+" ]�Դϴ�.", true);
            helper.setFrom("teatimeprojectmaster@gmail.com");
            helper.setTo(userEmail);
 
            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            e.getCause();
            e.getMessage();
        }
        return false;
    }


	public boolean sendFindIdMail(String userEmail) {
		String findIdResult = dao.findId(userEmail);
        MimeMessage message = javaMailSender.createMimeMessage();
 
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject("Teatime ���̵� ã�� ����Դϴ�.");
            helper.setText("ȸ������ ���̵�� [ "+findIdResult+" ]�Դϴ�.", true);
            helper.setFrom("teatimeprojectmaster@gmail.com");
            helper.setTo(userEmail);
 
            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            e.getCause();
            e.getMessage();
        }
        return false;
	}

	

	public boolean checkIdFindPw(String userId) {
		int checkIdResult = dao.checkIdFindPw(userId);
		if(checkIdResult == 1){
			return true;
		}
		return false;
	}
	

	public boolean sendFindPwMail(String userEmail, String authText) {
        MimeMessage message = javaMailSender.createMimeMessage();
 
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject("Teatime ��й�ȣ �缳�� �����Դϴ�.");
            helper.setText("ȸ������ �缳�� ������ȣ�� [ "+authText+" ]�Դϴ�.", true);
            helper.setFrom("teatimeprojectmaster@gmail.com");
            helper.setTo(userEmail);
 
            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            e.getCause();
            e.getMessage();
        }
        return false;
	}
	
	
	public int changePw(String userId,String userPw) {
		Map<String,String> userInfo = new HashMap<String,String>();
		userInfo.put("userId", userId);
		userInfo.put("userPw", userPw);
		return dao.changePw(userInfo);
	}
	

	public boolean checkModifyPw(String userId,String userPw){
		if(dao.checkModifyPw(userId).equals(userPw)){
			return true;
		}
		return false;
	}

	public MemberDTO getUserInfo(String userId) {
		return dao.getUserInfo(userId);
	}

	public boolean setModifyUserInfo(MemberDTO memberDTO) {
		int resultModify = dao.setModifyUserInfo(memberDTO);
		return (resultModify==1) ? true:false;
	}


}

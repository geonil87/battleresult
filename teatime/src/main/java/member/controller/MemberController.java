package member.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.dao.MemberDAO;
import member.dto.MemberDTO;
import member.service.MemberServiceImpl;
import member.support.EmailAuthClass;

@Controller
public class MemberController {

	
	@Autowired
	MemberServiceImpl service;

	
	@RequestMapping("member.home")
	public String moveHome(){
		return "home";
	}
	
	@RequestMapping("member.mypage")
	public String moveMyPage(){
		return "member/mypage/myPage";
	}
	
	@RequestMapping("member.admin")
	public String moveAdminpage(){
		return "admin/adminPage";
	}

	
	@RequestMapping(value="member.login", method=RequestMethod.GET)
	public String moveLoginForm(){
		return "member/login/loginForm";
	}
	

	@RequestMapping(value="member.login", method=RequestMethod.POST)
	public ModelAndView getLoginInfo(String userId, String userPw, HttpSession session){
		ModelAndView mav = new ModelAndView();
		String path="";
		Map<String,String> loginInfo = new HashMap<String,String>();
		loginInfo.put("user_id", userId);
		loginInfo.put("user_pw", userPw);
		
		Map<String,String> result = service.checkLogin(loginInfo);
		
		if(result.containsKey("loginFailId")==true){
			mav.addObject("loginResult", result.get("loginFailId"));
			path = "redirect:member.login";
		}else if(result.containsKey("loginFailPw")==true){
			mav.addObject("userId",result.get("userId"));
			mav.addObject("loginResult", result.get("loginFailPw"));
			path = "redirect:member.login";
		}else{
			session.setAttribute("sessionId", result.get("userId"));
			session.setAttribute("sessionNick", result.get("userNick"));
			session.setAttribute("sessionPermission", result.get("userPermission"));
			path = "main/teatimeMain";
		}
		System.out.println(path);
		mav.setViewName(path);
		return mav;
	}
	

	@RequestMapping(value="member.logout")
	public String setLogout(HttpSession session){
		session.invalidate();
		
		return "redirect:teatime.main";
	}
	
	
	@RequestMapping(value="member.regist", method=RequestMethod.GET)
	public String moveRegistration(){
		return "member/regist/registForm";
	}

	@RequestMapping(value="member.regist", method=RequestMethod.POST)
	public ModelAndView setRegistration(MemberDTO memberDTO, HttpSession session){
		ModelAndView mav = new ModelAndView();
		Map<String,String> result = service.insertRegistration(memberDTO);
		session.invalidate();
		mav.addObject("registResult", result);
		mav.setViewName("member/regist/registResult");
		return mav;
	}
	
	@RequestMapping(value="member.checkSameId", method=RequestMethod.POST)
	public @ResponseBody int checkSameId(String id, HttpSession session){
		session.removeAttribute("sessionSameId");
		int result = service.checkRegistId(id);
		if(result==1){
			session.setAttribute("sessionSameId", id);
		}
		System.out.println(result);
		return result;
	}

	@RequestMapping(value="member.checkSameNick", method=RequestMethod.POST)
	public @ResponseBody int checkSameNick(String nick , HttpSession session){
		session.removeAttribute("sessionSameNick");
		int result = service.checkRegistNick(nick);
		if(result==1){
			session.setAttribute("sessionSameNick", nick);
		}
		return result;
	}
	
	@RequestMapping(value="member.checkEmail", method=RequestMethod.GET)
	public String moveEmailAuth(){
		return "member/regist/registEmailAuthForm";
	}
	
	
	@RequestMapping(value="member.sendAuthEmail", method=RequestMethod.POST)
	public @ResponseBody boolean sendAuthEmail(String userEmail, HttpSession session){
		boolean result = false;
		System.out.println("�̸��� ���� ����");
		System.out.println(userEmail);
		session.removeAttribute("sessionEmailAuth");
	
		
		int checkEmail = service.checkRegistEmail(userEmail);
		System.out.println(checkEmail);
		if(checkEmail != 1){
	
			String authText = EmailAuthClass.excuteEmailAuth();
			System.out.println("�������� : "+ authText);
			result = service.sendAuthMail(userEmail, authText);
			if(result){
				session.setAttribute("sessionEmailAuth", authText);	
				
			} 
		}	
		
		System.out.println(result);
		return result;
	}

	@RequestMapping(value="member.checkAuthText", method=RequestMethod.POST)
	public @ResponseBody boolean checkAuthText(String auth, String userEmail, HttpSession session){
		boolean result = false;
		System.out.println("�̸��� ���� ����");
		System.out.println(auth);
		System.out.println(userEmail);
		System.out.println(auth+" : "+ session.getAttribute("sessionEmailAuth"));
		if(session.getAttribute("sessionEmailAuth").equals(auth)){
			session.setAttribute("sessionEmail", userEmail);
			result = true;
		};
		session.removeAttribute("sessionEmailAuth");
		System.out.println(result);
		return result;
	}

	@RequestMapping(value="member.findId", method=RequestMethod.GET)
	public String moveFindId(){
		return "member/login/findIdForm";
	}

	@RequestMapping(value="member.findId", method=RequestMethod.POST)
	public @ResponseBody boolean findId(String userEmail){
		System.out.println("�̸��� ���� ����");
		System.out.println(userEmail);
		boolean result = service.sendFindIdMail(userEmail);
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value="member.findPw", method=RequestMethod.GET)
	public String moveFindPw(){
		return "member/login/findPwForm";
	}
	
	@RequestMapping(value="member.findPw", method=RequestMethod.POST)
	public @ResponseBody boolean findPw(String userEmail, String userId, HttpSession session){
		boolean checkIdResult = service.checkIdFindPw(userId);
		boolean result = false;
		if(checkIdResult){
			String authText = EmailAuthClass.excutePwAuth();
			System.out.println("�������� : "+ authText);
			result = service.sendFindPwMail(userEmail, authText);
			if(result){
				session.setAttribute("sessionPwAuth", authText);
				session.setAttribute("sessionPwAuthId", userId);
			}
		}
		return result;
	}
	
	
	@RequestMapping(value="member.checkFindPwAuthText", method=RequestMethod.POST)
	public @ResponseBody boolean checkFindPwAuthText(String auth, HttpSession session){
		boolean result = false;
		System.out.println("�̸��� ���� ����");
		System.out.println(auth);
		System.out.println(auth+" : "+ session.getAttribute("sessionPwAuth"));
		if(session.getAttribute("sessionPwAuth").equals(auth)){
			result = true;
		};
		session.removeAttribute("sessionPwAuth");
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value="member.changePw", method=RequestMethod.GET)
	public String moveChangePw(){
		return "member/login/changeUserPw";
	}
	
	
	@RequestMapping(value="member.changePw", method=RequestMethod.POST)
	public String ChangePw(String userPw, HttpSession session){
		String userId = (String)session.getAttribute("sessionPwAuthId");
		System.out.println(userId +" : " + userPw);
		int result = service.changePw(userId, userPw);
		if(result == 1){
			System.out.println("���� ����");
		}else{
			System.out.println("���� ����");
		}
		session.invalidate();
		return "javascript:window.close()";
	}
	
	
		@RequestMapping(value="member.checkModifyUserInfo", method=RequestMethod.GET)
		public String moveCheckModifyInfo(){
			return "member/login/checkModifyUserInfo";
		}
	
		@RequestMapping(value="member.checkModifyUserInfo", method=RequestMethod.POST)
		public ModelAndView getCheckModifyInfo(HttpSession session, String userId, String userPw){
			ModelAndView mav = new ModelAndView();
			if(session.getAttribute("sessionId")!=null){
				boolean checkPw = service.checkModifyPw(userId, userPw); 
				if(checkPw){
					mav.addObject("userId", userId);
					mav.setViewName("redirect:member.modifyUserInfo");
				}else{
					mav.addObject("checkResult", "��й�ȣ�� Ʋ���ϴ�");
					mav.setViewName("redirect:member.checkModifyUserInfo");
				}
			}
			return mav;
		}	
	
	
	
	@RequestMapping(value="member.modifyUserInfo", method=RequestMethod.GET)
	public ModelAndView moveModifyUserInfo(HttpSession session,String userId){
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionId")!=null){
			MemberDTO memberDTO = service.getUserInfo(userId);
			mav.addObject("memberDTO", memberDTO);
			mav.setViewName("member/login/modifyUserInfo");
		}else{
			mav.addObject("checkResult", "ȸ�������� �����ϴ�.");
			mav.setViewName("redirect:member.checkModifyUserInfo");
		}
		return mav;
	}
	
	@RequestMapping(value="member.modifyUserInfo", method=RequestMethod.POST)
	public ModelAndView setModifyUserInfo(HttpSession session, MemberDTO memberDTO){
		ModelAndView mav = new ModelAndView();
		boolean result = service.setModifyUserInfo(memberDTO);
		if(result){
			session.setAttribute("sessionId", memberDTO.getUserId());
			session.setAttribute("sessionNick", memberDTO.getUserNick());
			session.setAttribute("sessionPermission", memberDTO.getUserPermission());
			mav.setViewName("redirect:teatime.main");
		}else{
			mav.setViewName("redirect:member.checkModifyUserInfo");
		}
		
		return mav;
	}
	

		@RequestMapping(value="member.deleteUserInfo", method=RequestMethod.GET)
		public String deleteUserInfo(HttpSession session){
			
			return null;
		}
	
}


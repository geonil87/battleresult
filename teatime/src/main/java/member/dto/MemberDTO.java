package member.dto;

public class MemberDTO {
	
	// 변수 선언부
	private String userId;
	private String userPw;
	private String userName;
	private String userNick;
	private String userPhone;
	private String userEmail;
	private String userPostcode;
	private String userAddress1;
	private String userAddress2;
	private String userGender;
	private String userBirthday;
	private String userIndate;
	private int userPermission;
	
	
	// Getter & Setter
	public String getUserId() {return userId;}
	public void setUserId(String userId) {this.userId = userId;}
	public String getUserPw() {return userPw;}
	public void setUserPw(String userPw) {this.userPw = userPw;}
	public String getUserName() {return userName;}
	public void setUserName(String userName) {this.userName = userName;}
	public String getUserNick() {return userNick;}
	public void setUserNick(String userNick) {this.userNick = userNick;}
	public String getUserPhone() {return userPhone;}
	public void setUserPhone(String userPhone) {this.userPhone = userPhone;}
	public String getUserAddress1() {return userAddress1;}
	public void setUserAddress1(String userAddress1) {this.userAddress1 = userAddress1;}
	public String getUserAddress2() {return userAddress2;}
	public void setUserAddress2(String userAddress2) {this.userAddress2 = userAddress2;}
	public String getUserGender() {return userGender;}
	public void setUserGender(String userGender) {this.userGender = userGender;}
	public String getUserBirthday() {return userBirthday;}
	public void setUserBirthday(String userBirthday) {this.userBirthday = userBirthday;}
	public String getUserIndate() {return userIndate;}
	public void setUserIndate(String userIndate) {this.userIndate = userIndate;}
	public String getUserEmail() {return userEmail;}
	public void setUserEmail(String userEmail) {this.userEmail = userEmail;}
	
	public int getUserPermission() {return userPermission;}
	public void setUserPermission(int userPermission) {this.userPermission = userPermission;}
	public String getUserPostcode() {return userPostcode;}
	public void setUserPostcode(String userPostcode) {this.userPostcode = userPostcode;}
	
	// Constructor
	// 1.기본 생성자
	public MemberDTO(){super();}
	
	// 2.전체 변수를 포함한 생성자
	public MemberDTO(String userId, String userPw, String userName, String userNick, String userPhone, String userEmail,
			String userPostcode, String userAddress1, String userAddress2, String userGender, String userBirthday,
			String userIndate, int userPermission) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userNick = userNick;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userPostcode = userPostcode;
		this.userAddress1 = userAddress1;
		this.userAddress2 = userAddress2;
		this.userGender = userGender;
		this.userBirthday = userBirthday;
		this.userIndate = userIndate;
		this.userPermission = userPermission;
	}
	
	
	
}

package kr.co.farmstory2.service;

import java.util.List;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dao.UserDAO;
import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.UserService;

public class UserService {
	private static UserService instance = new UserService();
	public static UserService getInstance() {
		return instance;
	}
	private UserService() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserDAO dao = UserDAO.getInstance();
	private String generatedCode;
	
	public void insertUser(UserDTO dto) {
		dao.insertUser(dto);
	}
	
	public int selectCountUsers() {
		return dao.selectCountUsers();
	}
	
	public int selectCountUid(String uid) {
		return dao.selectCountUid(uid);
	}
	
	public int selectCountNick(String nick) {
		return dao.selectCountNick(nick);
	}
	
	public int selectCountHp(String hp) {
		return dao.selectCountHp(hp);
	}
	
	public int selectCountEmail(String email) {
		return dao.selectCountEmail(email);
	}
	
	public int selectCountNameAndEmail(String name, String email) {
		return dao.selectCountNameAndEmail(name, email);				
	}
	
	public int selectCountUidAndEmail(String uid, String email) {
		return dao.selectCountUidAndEmail(uid, email);
	}
	
	public UserDTO selectUser(String uid, String pass) {
		return dao.selectUser(uid, pass);
	}
	
	public UserDTO selectMyInfo(String nick) {
		return dao.selectMyInfo(nick);
	}
	
	public UserDTO selectUserByNameAndEmail(String name, String email) {
		return dao.selectUserByNameAndEmail(name, email);				
	}
	
	public int passChange(String uid, String pass) {
		return dao.passChange(uid, pass);
	}
	
	public List<UserDTO> selectUsers(int start) {
		return dao.selectUsers(start);
	}
	
	public List<UserDTO> selectUserLatest(int start) {
		return dao.selectUserLatest(start);
	}
	
	public void updateUser(UserDTO dto) {
		dao.updateUser(dto);
	}
	
	public int updateUserForWithdraw(String uid) {
		return dao.updateUserForWithdraw(uid);
	}
	
	public void deleteUser(String uid) {
		dao.deleteUser(uid);
	}
	
	public int sendCodeByEmail(String receiver) {
		
		// 인증코드 생성
		int code = ThreadLocalRandom.current().nextInt(100000, 1000000);		
		generatedCode = String.valueOf(code);
		
		// 기본정보
		String sender = "fg012023@gmail.com";
		String password = "zgnzinuvqtvkrrgt";
		String title = "Farmstory2 인증코드 입니다.";
		String content = "<h1>인증코드는 " + code + "</h1>";
		
		// Gmail SMTP 서버 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		// Gmail STMP 세션 생성
		Session gmailSession = Session.getInstance(props, new Authenticator(){
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});
		
		// 메일 발송
		int status = 0;
		Message message = new MimeMessage(gmailSession);
		
		try{
			logger.info("here1...");
			message.setFrom(new InternetAddress(sender, "보내는 사람", "UTF-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(title);
			message.setContent(content, "text/html;charset=UTF-8");
			Transport.send(message);
			status = 1;
			
		}catch(Exception e){
			status = 0;
			logger.error("sendCodeByEmail() error : " + e.getMessage());
		}
		
		return status;
	} // sendCodeByEmail end
	
	public int cofirmCodeByEmail(String code) {
		
		if(code.equals(generatedCode)) {
			logger.info("return 1...");
			return 1;
		}else {
			logger.info("return 0...");
			return 0;
		}
	}
	
	// 페이지 마지막 번호
		public int getLastPageNum(int total) {
			
			int lastPageNum = 0;
			
			if(total % 10 == 0){
				lastPageNum = total / 10;
			}else{
				lastPageNum = total / 10 + 1;
			}
			
			return lastPageNum;
		}
		
		// 페이지 그룹
		public int[] getPageGroupNum(int currentPage, int lastPageNum) {
			int currentPageGroup = (int)Math.ceil(currentPage / 10.0);
			int pageGroupStart = (currentPageGroup - 1) * 10 + 1;
			int pageGroupEnd = currentPageGroup * 10;
			
			if(pageGroupEnd > lastPageNum){
				pageGroupEnd = lastPageNum;
			}
			
			int[] result = {pageGroupStart, pageGroupEnd};
			
			return result;
		}
		
		// 페이지 시작번호
		public int getPageStartNum(int total, int currentPage) {
			int start = (currentPage - 1) * 10;
			return total - start;
		}
		
		// 현재 페이지 번호
		public int getCurrentPage(String pg) {
			int currentPage = 1;
			
			if(pg != null){
				currentPage = Integer.parseInt(pg);	
			}
			
			return currentPage;
		}
		
		// Limit 시작번호
		public int getStartNum(int currentPage) {
			return (currentPage - 1) * 10;
		}
		
}

package kr.co.jboard2.service;

import java.util.List;

import kr.co.jboard2.dao.UserDAO;
import kr.co.jboard2.dto.UserDTO;


public class UserService {
	
	public static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	
	private UserDAO dao = new UserDAO(); 
	
	public void insertUser(UserDTO dto) {
		dao.insertUser(dto);
	}
	
	public void selectUser(UserDTO dto) {
		dao.selectUser(dto);
	}
	
	public List<UserDTO> selectUsers(UserDTO dto) {		
		return dao.selectUsers(dto);		
	}
	
	public void updateUser(UserDTO dto) {
		dao.updateUser(dto);
	}
	
	public void deleteUser(String uid) {
		dao.deleteUser(uid);
	}
	
	public void selectCountUid(String uid) {
		dao.selectCountUid(uid);
	}
	
	public void selectCountEmail(String email) {
		dao.selectCountEmail(email);
	}
	
	public void selectCountHp(String hp) {
		dao.selectCountHp(hp);
	}
	
	public void selectCountNick(String nick) {
		dao.selectCountNick(nick);
	}
	

	
	
}

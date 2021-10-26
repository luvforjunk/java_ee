package user.service;

import java.util.List;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSelectService implements UserService {

	@Override
	public void execute() {
		//DB - select해서 데이터를 다 꺼내와라
		UserDAO userDAO = UserDAO.getInstance();
		List<UserDTO> list = userDAO.getUserList();

		//응답
		for (UserDTO userDTO : list) {// list에 있는 값을 하나하나 꺼내서 DTO에
			System.out.println(userDTO.getName() + "\t" + userDTO.getId() + "\t" + userDTO.getPwd());
		}
	}
}

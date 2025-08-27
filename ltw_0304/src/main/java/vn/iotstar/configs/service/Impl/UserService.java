package vn.iotstar.configs.service.Impl;

import java.util.List;

import vn.iotstar.configs.dao.IUserDao;
import vn.iotstar.configs.dao.implement.UserDaoImpl;
import vn.iotstar.configs.model.UserModel;
import vn.iotstar.configs.service.IUserService;

public class UserService implements IUserService {
	IUserDao userDao = new UserDaoImpl();
	
	@Override
	public UserModel login(String username, String password) {
		UserModel user = this.FindByUsername(username);
		if (user != null && password.equals(user.getPassWord())) {
			return user;
		}
		return null;
	}

	@Override
	public UserModel FindByUsername(String username) {
		// Check if there's a direct method in DAO first
		UserModel user = userDao.findByUsername(username);
		if (user != null) {
			return user;
		}
		
		// Fallback to searching through all users
		List<UserModel> users = userDao.findAll();
		for (UserModel u : users) {
			if (username.equals(u.getUserName())) {
				return u;
			}
		}
		return null;
	}
}
package vn.iotstar.configs.service;

import vn.iotstar.configs.model.UserModel;

public interface IUserService {
	UserModel login(String username, String password);
	UserModel FindByUsername(String username);
}